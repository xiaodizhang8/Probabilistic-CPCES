from translate.pddl_parser.pddl_file import open
from translate.instantiate import explore_probabilistic
from Methods.context import Context
from ConformantProbabilisticPlanning.AllProjectedProblems import AllProjectedProblems
from ConformantProbabilisticPlanning.TagGenerator import TagGenerator
from ConformantProbabilisticPlanning.SampleTagGenerator import SampleTagsGenerator
from ConformantProbabilisticPlanning.ClassicalPlanningWriter import write_classical_domain_file
from ConformantProbabilisticPlanning.ClassicalPlanningWriter import write_classical_instance_file
from ConformantProbabilisticPlanning.ClassicalPlanningWriter import write_classical_instance_file_by_hitting_set
from ConformantProbabilisticPlanning.ClassicalPlanningWriter import write_classical_domain_file_by_hitting_set
from ConformantProbabilisticPlanning.MergedProblems import MergedProblems
from ConformantProbabilisticPlanning.PlanChecking import PlanChecking
from ConformantProbabilisticPlanning.HittingSet import HittingSet
from Methods.MergingContext import MergingContext
from Methods.classical_planning import planning
import time
import argparse

def get_action_map(actions, result):
    for action in actions:
        result[action.name] = action
    return result

def merge_counter_examples(counter_examples_records, new_counter_examples):
    for counter_example in new_counter_examples:
        if counter_example not in counter_examples_records:
            counter_examples_records.append(counter_example)
    return counter_examples_records

def get_counter_example_index(counter_examples_records, new_counter_examples):
    res = list()
    for counter_example in new_counter_examples:
        index = counter_examples_records.index(counter_example)
        res.append(index)
    return res

def conformant_probabilistic_CPCES_by_hitting_set(problem, domain, instance, planner, search_engine, hitting_set_type):
    candidate_plan = None
    classical_domain_path = domain + '_classic'
    classical_instance_path = instance + '_classic'
    threshold = problem.threshold
    temp = problem.init
    problem.init = problem.all_possible_initial
    relaxed_reachable, atoms, actions, axioms, reachable_action = explore_probabilistic(problem)
    problem.init = temp
    print('start computing contexts')
    context_time_start = time.time()
    contexts = Context(atoms, actions, problem.goal,
                       problem.all_possible_initial - problem.initial_true - problem.initial_false)
    print('contexts computing completed')
    print('contexts computing time:', time.time() - context_time_start)
    print('contexts:', contexts.contexts)
    # print('probabilities:', problem.initial_probability_groups)
    # merging_contexts = MergingContext(atoms, actions, problem.goal,
    #                                   problem.all_possible_initial - problem.initial_true - problem.initial_false)
    action_map = get_action_map(actions, dict())
    merged_problems = list() #每一轮都会有merged problems
    sample_tags_history = list() # 每一轮sample tag的历史记录
    all_used_hitting_set = []  # 储存已经试过的hitting set，可不需要再看重复的
    iteration = 1
    all_projected_problems = AllProjectedProblems(problem, contexts)
    # modify_contexts(all_projected_problems, contexts, merging_contexts)
    # print(contexts.contexts)
    probabilistic_tag_generator = TagGenerator(problem, candidate_plan, action_map, contexts)
    print('start computing tags')
    tags_time_start = time.time()
    probabilistic_tag_generator.find_all_tags()
    print('tags computing completed')
    print('tags computing time:', time.time() - tags_time_start)
    planning_time = 0
    hitting_set_time = 0
    sample_tag_searching_time = 0
    while True:
        print('iteration:', iteration)
        # 判断每个tag是否符合sample tag
        st_generator = SampleTagsGenerator(problem, candidate_plan, action_map, contexts, probabilistic_tag_generator, all_projected_problems)
        sample_tag_searching_start = time.time()
        sample_tags, probability = st_generator.find_sample_tags(threshold=threshold)
        sample_tag_searching_time += time.time() - sample_tag_searching_start
        if probability is None:
            print("no solution due to no enough sample tags")
            break
        if sample_tags is None:
            print('find a valid plan')
            print(candidate_plan)
            # print('plan probability:', 1 - probability)
            print('plan length:', len(candidate_plan))
            print('planning time:', planning_time)
            print('hitting set searching time:', hitting_set_time)
            print('sample tag searching time:', sample_tag_searching_time)
            print('iterations:', iteration)
            return candidate_plan
        sample_tags = st_generator.sample_tags
        # print('sample tags', sample_tags)
        num_of_sample_tags, used_projected_problems, sample_tags_history = st_generator.get_information_from_sample_tags_for_hitting_set(sample_tags_history, probabilistic_tag_generator.tag_index_map)
        print('number of sample tags', num_of_sample_tags)
        # print('all_appeared_sample_tags', all_appeared_sample_tags)
        # print('sample tag history', sample_tags_history)
        # print('used_projected_problems', used_projected_problems)
        print('sample tags probability', probability)
        mp = MergedProblems(all_projected_problems, used_projected_problems, problem)
        mp.merge_problems()
        merged_problems.append(mp)

        hitting_set_time_start = time.time()
        hs = HittingSet(sample_tags_history, problem, candidate_plan, action_map, contexts, probabilistic_tag_generator, all_projected_problems, used_projected_problems, all_used_hitting_set)
        searching_plan = True
        while searching_plan:
            index_hitting_set, all_used_hitting_set = hs.get_hitting_set(hitting_set_type)
            if index_hitting_set is None:
                print("no solution due to no hitting set")
                print('planning time:', planning_time)
                print('hitting set searching time:', hitting_set_time)
                print('sample tag searching time:', sample_tag_searching_time)
                print('iterations:', iteration)
                return
            write_classical_instance_file_by_hitting_set(problem, classical_instance_path, merged_problems, probabilistic_tag_generator, index_hitting_set, all_projected_problems, contexts)
            write_classical_domain_file_by_hitting_set(problem, classical_domain_path, contexts, index_hitting_set, probabilistic_tag_generator, all_projected_problems)
            # if iteration == 1:
            #     break
            planning_time_start = time.time()
            candidate_plan = planning(classical_domain_path, classical_instance_path, planner, search_engine)
            planning_time += time.time() - planning_time_start
            if candidate_plan is not None:
                print('hitting set', index_hitting_set)
                searching_plan = False
        hitting_set_time += time.time() - hitting_set_time_start

        if candidate_plan is None:
            print("no solution due to no candidate plan")
            print('planning time:', planning_time)
            print('hitting set searching time:', hitting_set_time)
            print('sample tag searching time:', sample_tag_searching_time)
            print('iterations:', iteration)
            return
        elif isinstance(candidate_plan, str):
            print("find error!")
            print(candidate_plan)
            return
        else:
            print('find a plan')
            # print(candidate_plan)
            print('')

        # if iteration == 1:
        #     break
        iteration += 1

def modify_contexts(all_projected_problems, contexts, merging_contexts):

    removed_contexts = []
    removed_merged_contexts = []
    for index in range(len(all_projected_problems.all_projected_problems)):
        projected_problem = all_projected_problems.all_projected_problems[index]
        if len(projected_problem.goal) == 0:
            removed_contexts.append(index)
            removed_merged_contexts.append(index)
    for i in removed_contexts:
        contexts.contexts[i] = None
    for i in removed_merged_contexts:
        merging_contexts.contexts[i] = None
    # all_projected_problems.get_constant_problem()
    # contexts.get_all_predicate_name_in_contexts()
    # contexts.get_all_predicates_in_contexts()
    # merging_contexts.get_all_predicate_name_in_contexts()

def conformant_probabilistic_CPCES(problem, domain, instance, planner, search_engine):
    candidate_plan = None
    classical_domain_path = domain + '_classic'
    classical_instance_path = instance + '_classic'
    threshold = problem.threshold
    temp = problem.init
    problem.init = problem.all_possible_initial
    relaxed_reachable, atoms, actions, axioms, reachable_action = explore_probabilistic(problem)
    problem.init = temp
    print('start computing contexts')
    context_time_start = time.time()
    contexts = Context(atoms, actions, problem.goal,
                       problem.all_possible_initial - problem.initial_true - problem.initial_false)
    print('contexts computing completed')
    print('contexts computing time:', time.time() - context_time_start)
    # print('contexts:', contexts.contexts)
    # print('probabilities:', problem.initial_probability_groups)
    # merging_contexts = MergingContext(atoms, actions, problem.goal,
    #                                   problem.all_possible_initial - problem.initial_true - problem.initial_false)
    action_map = get_action_map(actions, dict())
    merged_problems = list()  # 每一轮都会有merged problems
    sample_tags_history = list()  # 每一轮sample tag的历史记录
    # for _ in range(len(contexts.contexts)):
    #     all_appeared_sample_tags.append(None)
    sample_tag_index_subproblem_index_map = dict()  # sample tag的index和projected problem index的map
    iteration = 1
    all_projected_problems = AllProjectedProblems(problem, contexts)
    # modify_contexts(all_projected_problems, contexts, merging_contexts)
    # print(contexts.contexts)
    probabilistic_tag_generator = TagGenerator(problem, candidate_plan, action_map, contexts)
    # 找到所有tag
    print('start computing tags')
    tags_time_start = time.time()
    probabilistic_tag_generator.find_all_tags()
    print('tags computing completed')
    print('tags computing time:', time.time() - tags_time_start)
    planning_time = 0
    sample_tag_searching_time = 0
    while True:
        print('iteration:', iteration)
        # 判断每个tag是否符合sample tag
        st_generator = SampleTagsGenerator(problem, candidate_plan, action_map, contexts, probabilistic_tag_generator,
                                           all_projected_problems)
        sample_tag_searching_start = time.time()
        sample_tags, probability = st_generator.find_sample_tags(threshold=threshold)
        sample_tag_searching_time += time.time() - sample_tag_searching_start
        if probability is None:
            print("no solution due to no enough sample tags")
            break
        if sample_tags is None:
            print('find a valid plan')
            print(candidate_plan)
            # print('plan probability:', 1 - probability)
            print('plan length:', len(candidate_plan))
            print('planning time:', planning_time)
            print('sample tag searching time:', sample_tag_searching_time)
            print('iterations:', iteration)
            return candidate_plan
        sample_tags = st_generator.sample_tags
        # print('sample tags', sample_tags)
        num_of_sample_tags, used_projected_problems, sample_tags_history = st_generator.get_information_from_sample_tags(
            sample_tags_history, probabilistic_tag_generator.tag_index_map)
        print('number of sample tags', num_of_sample_tags)
        # print('sample tag history', sample_tags_history)
        # print('used_projected_problems', used_projected_problems)
        print('sample tags probability', probability)
        mp = MergedProblems(all_projected_problems, used_projected_problems, problem)
        mp.merge_problems()
        merged_problems.append(mp)

        write_classical_instance_file(problem, classical_instance_path, merged_problems, probabilistic_tag_generator,
                                                     sample_tags_history, contexts)
        write_classical_domain_file(problem, classical_domain_path, merged_problems, contexts, sample_tags_history, all_projected_problems)

        planning_time_start = time.time()
        candidate_plan = planning(classical_domain_path, classical_instance_path, planner, search_engine)
        planning_time += time.time() - planning_time_start

        if candidate_plan is None:
            print("no solution due to no candidate plan")
            print('planning time:', planning_time)
            print('sample tag searching time:', sample_tag_searching_time)
            print('iterations:', iteration)
            return
        elif isinstance(candidate_plan, str):
            print("find error!")
            print(candidate_plan)
            return
        else:
            print('find a plan')
            # print(candidate_plan)
            print('')

        # if iteration == 3:
        #     break
        iteration += 1

def conformant_probabilistic_planning(domain, instance, planner, search_engine=None, hitting_set=None, hitting_set_type='random'):
    total_time_start = time.time()
    problem = open(domain, instance, type='conformant_probabilistic_planning')
    if hitting_set:
        plan = conformant_probabilistic_CPCES_by_hitting_set(problem, domain, instance, planner, search_engine, hitting_set_type)
    else:
        plan = conformant_probabilistic_CPCES(problem, domain, instance, planner, search_engine)
    total_time = time.time() - total_time_start
    print('total time:', total_time)
    print('')
    # print('checking plan...')
    # PlanChecking(plan, domain, instance, type='conformant_probabilistic_planning')

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('-d', '--domain', dest='domain')
    parser.add_argument('-i', '--instance', dest='instance')
    parser.add_argument('-p', '--planner', dest='planner', default='ff')
    parser.add_argument('-s', '--search_engine', dest='search_engine', default='eager(single(ff))')
    parser.add_argument('-hs', '--hitting_set', dest='hitting_set', default=False)
    parser.add_argument('-ht', '--hitting_type', dest='hitting_type', default='random')
    args = parser.parse_args()
    print(args.domain)
    print(args.instance)
    print(args.planner)
    print(args.search_engine)
    print(args.hitting_set)
    print(args.hitting_type)
    conformant_probabilistic_planning(args.domain, args.instance, args.planner, args.search_engine, args.hitting_set, args.hitting_type)
