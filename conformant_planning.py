import argparse
import time

from translate.pddl_parser.pddl_file import open
from Methods.classical_planning import writeClassicalSampleFileForSUPERFD
from Methods.classical_planning import planning
from Methods.classical_planning import writeDomainFile
from Methods.classical_planning import writeSampleFile
from Methods.classical_planning import write_plan_file
from ConformantPlanning.FD_plan_generator import FDPlanGenerator

from Methods.context import Context
from ConformantPlanning.SUPERB_string import SUPERB_string
from instantiate import explore
from Methods.MergingContext import MergingContext
from ConformantPlanning.sampleGenerator import sampleGenerator
from ConformantPlanning.multi_sample_generator import multiSampleGenerator


sampling_time = 0
fd_search_time = 0

def get_action_map(actions, result):
    for action in actions:
        result[action.name] = action
    return result

def conformantPlanningCPCES(problem, domain_file, instance_file, planner, search_engine=None, superb=True, merged=True, separated=True):
    global sampling_time
    contexts = None
    SUPERB_info = None
    classical_instance_file = instance_file + '_sample'
    classical_domain_file = domain_file + 'domain_conformant'
    candidate_plan = None
    iteration = 1
    sample_list = list()
    temp = problem.init
    problem.init = problem.all_possible_initial
    relaxed_reachable, atoms, actions, axioms, reachable_action = explore(problem)
    problem.init = temp
    contexts = Context(atoms, actions, problem.goal,
                       problem.all_possible_initial - problem.initial_true - problem.initial_false, False)
    print('context')
    print(contexts.get_contexts())
    merging_contexts = None
    if merged:
        merging_contexts = MergingContext(atoms, actions, problem.goal,
                                          problem.all_possible_initial - problem.initial_true - problem.initial_false)
        print('merging context')
        print(merging_contexts.get_contexts())
    action_map = get_action_map(actions, dict())
    if superb:
        print("is superb")
        SUPERB_info = SUPERB_string()
    while True:
        print('iteration:', iteration)
        start = time.time()
        sample_generator = sampleGenerator(problem, candidate_plan, action_map)
        counter_example = sample_generator.compute_single_counter_example()
        sampling_time += time.time()-start
        if counter_example is None:
            print(' ')
            print("find a valid plan")
            print(candidate_plan)
            print('iteration: ' + str(iteration))
            print('plan length: ' + str(len(candidate_plan)))
            write_plan_file(candidate_plan, instance_file + '_plan')
            break
        if superb:
            sample_start = time.time()
            counter_example = SUPERB_info.improve_counter_example(counter_example, contexts, sample_generator)
            sampling_time += time.time() - sample_start
        print(counter_example)
        sample_list.append(counter_example)

        #update explore problem
        writeDomainFile(problem, classical_domain_file, sample_list=sample_list, contexts=merging_contexts, merged=merged, separated=separated)
        writeSampleFile(sample_list, problem, classical_instance_file, contexts=merging_contexts, merged=merged, separated=separated)
        candidate_plan = planning(classical_domain_file, classical_instance_file, planner, search_engine)
        if candidate_plan is None:
            print("no solution")
            break
        elif isinstance(candidate_plan, str):
            print("find error!")
            print(candidate_plan)
            break
        else:
            print('find a plan')
            print(candidate_plan)
            print('')
        # if iteration == 1:
        #     break
        iteration += 1


def warmStartingCPCES(problem, domain_file, instance_file, planner, search_engine=None, superb=True, merged=True, separated=True):
    global sampling_time
    contexts = None
    SUPERB_info = None
    classical_instance_file = instance_file + '_sample'
    classical_domain_file = domain_file + 'domain_conformant'
    candidate_plan = None
    iteration = 1
    sample_list = list()
    temp = problem.init
    problem.init = problem.all_possible_initial
    relaxed_reachable, atoms, actions, axioms, reachable_action = explore(problem)
    problem.init = temp
    contexts = Context(atoms, actions, problem.goal,
                       problem.all_possible_initial - problem.initial_true - problem.initial_false, True)
    print('context')
    print(contexts.get_contexts())
    merging_contexts = None
    if merged:
        merging_contexts = MergingContext(atoms, actions, problem.goal,
                                          problem.all_possible_initial - problem.initial_true - problem.initial_false)
        print('merging context')
        print(merging_contexts.get_contexts())
    action_map = get_action_map(actions, dict())
    if superb:
        print("is superb")
        SUPERB_info = SUPERB_string()
    while True:
        print('iteration:', iteration)
        if iteration == 1:
            start = time.time()
            multi_sample_generator = multiSampleGenerator(problem, candidate_plan, action_map, contexts)
            counter_example = multi_sample_generator.compute_multiple_counter_examples_for_warm_starting()
            sampling_time += time.time() - start
            print(counter_example)
            sample_list.extend(counter_example)
        else:
            start = time.time()
            sample_generator = sampleGenerator(problem, candidate_plan, action_map)
            counter_example = sample_generator.compute_single_counter_example()
            sampling_time += time.time() - start
            print(counter_example)
            if counter_example is None:
                print(' ')
                print("find a valid plan")
                print(candidate_plan)
                print('iteration: ' + str(iteration))
                print('plan length: ' + str(len(candidate_plan)))
                write_plan_file(candidate_plan, instance_file + '_plan')
                break
            if superb:
                sample_start = time.time()
                counter_example = SUPERB_info.improve_counter_example(counter_example, contexts, sample_generator)
                print(counter_example)
                sampling_time += time.time() - sample_start
            sample_list.append(counter_example)

        # update explore problem
        writeDomainFile(problem, classical_domain_file, sample_list=sample_list, contexts=merging_contexts,
                        merged=merged, separated=separated)
        writeSampleFile(sample_list, problem, classical_instance_file, contexts=merging_contexts, merged=merged,
                        separated=separated)
        candidate_plan = planning(classical_domain_file, classical_instance_file, planner, search_engine)
        if candidate_plan is None:
            print("no solution")
            break
        elif isinstance(candidate_plan, str):
            print("find error!")
            print(candidate_plan)
            break
        else:
            print('find a plan')
            print(candidate_plan)
            print('')
        # if iteration == 1:
        #     break
        iteration += 1


def conformantPlanningICC(problem, domain_file, instance_file, search_engine=None, superb=True):
    global sampling_time, fd_search_time
    SUPERB_info = None
    classical_instance_file = instance_file + '_sample'
    candidate_plan = None
    empty_plan_flag = False # 用于记录程序有没有进入empty plan模式
    iteration = 1
    sample_list = list()
    relaxed_reachable, atoms, actions, axioms, reachable_action = explore(problem)
    contexts = Context(atoms, actions, problem.goal, problem.all_possible_initial-problem.initial_true-problem.initial_false, False)
    merging_contexts = MergingContext(atoms, actions, problem.goal, problem.all_possible_initial-problem.initial_true-problem.initial_false)
    print('context')
    print(contexts.get_contexts())
    print('merging context')
    print(merging_contexts.get_contexts())
    pgen = FDPlanGenerator(domain_file, classical_instance_file, merging_contexts)
    start_init = problem.init # 记录这些是为了empty plan模式，保持参数一致性用的。因为后期重写instance不现实，但是从problem导出会出现一些参数缺失
    start_all_possible_init = problem.all_possible_initial # 记录这些是为了empty plan模式，保持参数一致性用的。因为后期重写instance不现实，但是从problem导出会出现一些参数缺失
    unknown_initial = problem.unknown_initial # 记录这些是为了empty plan模式，保持参数一致性用的。因为后期重写instance不现实，但是从problem导出会出现一些参数缺失
    action_map = get_action_map(actions, dict())
    if superb:
        print("is superb")
        SUPERB_info = SUPERB_string()
    while True:
        print('iteration:', iteration)
        sampling_start = time.time()
        sample_generator = sampleGenerator(problem, candidate_plan, action_map)
        counter_example = sample_generator.compute_single_counter_example()
        sampling_time += time.time() - sampling_start
        if counter_example is None:
            print(counter_example)
            print('')
            print("find a valid plan")
            if empty_plan_flag:
                candidate_plan.remove('MAGIC')
            print(candidate_plan)
            print('iteration: ' + str(iteration))
            print('plan length: ' + str(len(candidate_plan)))
            print('total sas variables: ' + str(pgen.total_variables))
            print('total new variables: ' + str(pgen.variable_num))
            write_plan_file(candidate_plan, instance_file + '_plan')
            break
        if superb:
            sample_start = time.time()
            counter_example = SUPERB_info.improve_counter_example(counter_example, contexts, sample_generator)
            sampling_time += time.time() - sample_start
        print(counter_example)
        sample_list.append(counter_example)
        writeClassicalSampleFileForSUPERFD(sample_list, problem, classical_instance_file)
        sas_task, actions = pgen.generate_sas()
        if sas_task == 'Simplified to empty goal':
            empty_plan_flag = True
        # 如果发现一个counter-example是goal state,我们就在domain中添加一个动作Magic,这个动作没有precondition，但是有effect是no_empty
        # 同时，在goal state中添加no_empty
            classical_instance_file = classical_instance_file + '_no_empty'
            problem = pgen.delete_empty_plan(sample_list, problem, start_init)
            relaxed_reachable, atoms, actions, axioms, reachable_action = explore(problem)
            problem.unknown_init = unknown_initial
            problem.all_possible_initial = start_all_possible_init
            contexts = Context(atoms, actions, problem.goal, problem.all_possible_initial-problem.initial_true-problem.initial_false)
            pgen.contexts = contexts
            sas_task, actions = pgen.generate_sas()

        action_map = get_action_map(actions, action_map)
        read_result = pgen.read_sas(iteration)
        if iteration == 2 and read_result == 'Cannot merge variables':
            print('Cannot merge variables')
            pgen.read_sas(iteration)
        pgen.write_sas()
        planning_start = time.time()
        if iteration == 5:
            break
        candidate_plan = pgen.compute_plan(search_engine)
        fd_search_time += time.time() - planning_start
        if candidate_plan == 'Search stopped without finding a solution.':
            print('Search stopped without finding a solution.')
            break
        print('find a plan')
        print(candidate_plan)
        print('')
        iteration += 1
        if iteration == 6:
            break



def conformantPlanning(domain_file, instance_file, planner, search_engine=None, superb=True, merged=True, separated=True, multiple=True):
    print('superb', superb)
    print('merge', merged)
    print('separate', separated)
    print('multiple', multiple)
    start = time.time()
    problem = open(domain_file, instance_file)
    if planner == 'superfd':
        conformantPlanningICC(problem, domain_file, instance_file, search_engine, superb)
        print('FD search time: ' + str(fd_search_time))
    else:
        if multiple:
            warmStartingCPCES(problem, domain_file, instance_file, planner, search_engine, superb, merged, separated)
        else:
            conformantPlanningCPCES(problem, domain_file, instance_file, planner, search_engine, superb, merged, separated)
    conformant_planning_time = time.time() - start
    print('conformant planning time: '+ str(conformant_planning_time))
    print('sampling time: ' + str(sampling_time))



if __name__ == '__main__':
    # conformantPlanning('FD-Benchmarks/one_dispose/domain.pddl', 'FD-Benchmarks/one_dispose/instances/p_3_2.pddl', 'superfd', 'eager(single(ff()))')
    # conformantPlanning('conformant_benchmarks/domain_bomb.pddl', 'conformant_benchmarks/p20-1.pddl', 'ff', 'eager(single(ff()))')
    # conformantPlanning('conformant_benchmarks/domain_block.pddl', 'conformant_benchmarks/p01.pddl', 'superfd', 'eager(single(ff()))')
    # conformantPlanning('conformant_benchmarks/domain_dispose.pddl', 'conformant_benchmarks/p_4_2.pddl', 'superfd', 'eager(single(ff()))')
    # conformantPlanning('conformant_benchmarks/domain_coins.pddl', 'conformant_benchmarks/p12.pddl', 'superfd', 'eager(single(ff()))')
    # conformantPlanning('conformant_benchmarks/domain_look.pddl', 'conformant_benchmarks/instance_look.pddl', 'superfd', 'eager(single(ff()))')
    # conformantPlanning('conformant_benchmarks/d3.pddl', 'conformant_benchmarks/p3.pddl', 'superfd', 'eager(single(ff()))')
    # conformantPlanning('FD-Benchmarks/blockworld/domain.pddl', 'FD-Benchmarks/blockworld/instances/p03.pddl', 'superfd', 'eager(single(ff()))', True, False, False, False)
    # conformantPlanning('FD-Benchmarks/bomb/domain.pddl', 'FD-Benchmarks/bomb/instances/p100-5.pddl', 'ff', 'eager(single(ff()))', True, True, True, True)
    # conformantPlanning('FD-Benchmarks/coins/domain.pddl', 'FD-Benchmarks/coins/instances/p12.pddl', 'ff', 'eager(single(ff()))', True, True, True, True)
    # conformantPlanning('FD-Benchmarks/dispose/domain.pddl', 'FD-Benchmarks/dispose/instances/p_4_2.pddl', 'ff', 'eager(single(ff()))', True, False, False, False)
    # conformantPlanning('FD-Benchmarks/look-grab_4_2_2/domain.pddl', 'FD-Benchmarks/look-grab_4_2_2/instances/p_4_2_2.pddl', 'ff', 'eager(single(ff()))', True, True, True, False)
    conformantPlanning('FD-Benchmarks/one_dispose/domain.pddl', 'FD-Benchmarks/one_dispose/instances/p_2_2.pddl', 'ff', 'eager(single(ff()))', True, False, False, False)
    # conformantPlanning('FD-Benchmarks/raos_keys_2/domain.pddl', 'FD-Benchmarks/raos_keys_2/instances/p2.pddl', 'ff', 'eager(single(ff()))', True, True, True, True)
    # conformantPlanning('FD-Benchmarks/uts/domain.pddl', 'FD-Benchmarks/uts/instances/p20.pddl', 'superfd', 'eager(single(ff()))', True, False, False, False)
    # conformantPlanning('other-benchmarks/grid/wall/domain_10_1229.pddl', 'other-benchmarks/grid/wall/instance_10_1229.pddl', 'ff', 'eager(single(ff()))', True, True, False, True)
    # parser = argparse.ArgumentParser()
    # parser.add_argument('-d', '--domain', dest='domain')
    # parser.add_argument('-i', '--instance', dest='instance')
    # parser.add_argument('-p', '--planner', dest='planner', default='superfd')
    # parser.add_argument('-s', '--search_engine', dest='search_engine', default='eager(single(ff))')
    # parser.add_argument('-b', '--superb', dest='superb', default=True)
    # parser.add_argument('-m', '--merged', dest='merged', default=True)
    # parser.add_argument('-sep', '--seperated', dest='seperated', default=True)
    # parser.add_argument('-mul', '--multiple', dest='multiple', default=True)
    # args = parser.parse_args()
    # conformantPlanning(args.domain, args.instance, args.planner, args.search_engine, args.superb, args.merged, args.seperated, args.multiple)
