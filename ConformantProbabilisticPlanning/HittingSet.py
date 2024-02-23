from ConformantProbabilisticPlanning.TagProbability import TagProbability
from ConformantProbabilisticPlanning.Z3StringConstraints import StringConstraints
from ConformantProbabilisticPlanning.MergedProblems import MergedProblems
from z3 import *
from pysat.examples.hitman import Hitman



class HittingSet:
    def __init__(self, sample_tags_history, problem, candidate_plan, action_map, contexts, tag_generator, all_projected_problems, used_projected_problems, all_used_hitting_set):
        self.sample_tags_history = sample_tags_history
        self.problem = problem
        self.candidate_plan = candidate_plan
        self.action_map = action_map
        self.contexts = contexts
        self.tag_generator = tag_generator
        self.all_projected_problems = all_projected_problems
        self.used_projected_problems = used_projected_problems
        self.all_used_hitting_set = all_used_hitting_set
        self.current_hitting_set_length = None
        self.has_hitting_set_left = True
        self.sorted_hitting_set = [] # 只储存符合当前条件的概率（长度最短的sets）,数据结构为[(tagindex, probability)]
        self.id_hittingset_map = dict()
        self.hitman = self.initialize()



    def initialize(self):
        history_samples = copy.deepcopy(self.sample_tags_history)
        all_tags = copy.deepcopy(self.tag_generator.all_true_and_false_tags_by_index)
        all_tags_without_empty = []
        for i in all_tags:
            if len(i) != 0:
                all_tags_without_empty.append(i)
        all_sets = history_samples + all_tags_without_empty
        h = Hitman(bootstrap_with=all_sets, htype='sorted')
        return h

    def get_hitting_set(self, hitting_set_type):
        if hitting_set_type == 'random':
            hitting_set = self.hitman.get()
            if hitting_set is None:
                self.has_hitting_set_left = False
                return None, self.all_used_hitting_set
            else:
                self.all_used_hitting_set.append(hitting_set)
                self.hitman.block(hitting_set)
                return hitting_set, self.all_used_hitting_set
        elif hitting_set_type == 'ratio':
            while self.has_hitting_set_left:
                if len(self.sorted_hitting_set) == 0: # 当前长度的hitting set用完了，再寻找下一个长度的
                    self.current_hitting_set_length = None
                    self.get_a_group_of_hitting_sets()
                else:
                    break
            if len(self.sorted_hitting_set) != 0:
                selection = self.sorted_hitting_set[0]
                self.sorted_hitting_set.remove(selection)
                hitting_set = self.id_hittingset_map[selection[0]]
                self.all_used_hitting_set.append(hitting_set)
                return hitting_set, self.all_used_hitting_set
            else:
                return None, self.all_used_hitting_set



    def get_a_group_of_hitting_sets(self):
        no_more_hitting_set = False
        hitting_set_probability = dict()
        while True:
            hitting_set = self.hitman.get()
            if hitting_set is None:
                no_more_hitting_set = True
                break
            if self.current_hitting_set_length is None:
                self.current_hitting_set_length = len(hitting_set)
            if len(hitting_set) > self.current_hitting_set_length:
                break
            self.hitman.block(hitting_set)
            if hitting_set in self.all_used_hitting_set:
                continue
            # if not self.check_hitting_set_satisfiability(hitting_set):
            #     continue
            probability = self.get_hitting_set_probability(hitting_set)
            if probability == 0:
                continue
            hitting_set_probability[id(hitting_set)] = probability
            self.id_hittingset_map[id(hitting_set)] = hitting_set
        if len(hitting_set_probability) != 0:
            self.sorted_hitting_set = sorted(hitting_set_probability.items(), key=lambda x: x[1],
                                                  reverse=True)
        if no_more_hitting_set:
            self.has_hitting_set_left = False

    def check_hitting_set_satisfiability(self, hitting_set):
        '''
        确认选取的hitting set的tag满足initial state的要求
        :param hitting_set:
        :return:
        '''
        tags = []
        for tag_index in hitting_set:
            tag = self.tag_generator.index_tag_map[tag_index]
            tags.append(tag)
        constraint_object = StringConstraints(self.problem, self.candidate_plan, self.action_map,
                                              self.contexts, self.tag_generator)
        initial_assert = constraint_object.get_initial_assert()
        declare_assert = constraint_object.get_other_assert()
        constraint_string = [declare_assert, initial_assert]
        tag_assert = '(assert (and '
        for tag in self.tag_generator.all_tags_in_one_list:
            if tag not in tags:
                tag_assert += '(not (and '
                for predicate in tag:
                    tag_assert += constraint_object.to_smt(predicate, 0) + ' '
                tag_assert += '))'
        tag_assert += '))\n'
        print(tag_assert)
        constraint_string.append(tag_assert)
        solver = Solver()
        solver.from_string(' '.join(constraint_string))
        return solver.check() == sat

    def get_hitting_set_probability(self, hitting_set):
        tags = []
        for index in hitting_set:
            tags.append(self.tag_generator.index_tag_map[index])
        probability = self.computing_hitting_set_probability(tags)
        return probability


    def computing_hitting_set_probability(self, tags):
        mp = MergedProblems(self.all_projected_problems,
                            self.used_projected_problems, self.problem)
        mp.merge_problems()
        tp = TagProbability(self.problem, self.candidate_plan, self.action_map, self.contexts, self.tag_generator, mp)
        temp_sample_tags = copy.deepcopy([tags])
        probability = tp.get_satisfied_tags_probability(temp_sample_tags) # initial state probability
        return probability


if __name__ == '__main__':
    a = [{4}, {0, 2}, {5}, {3}, {0, 2, 3}, {1, 4, 5}]
    h = Hitman(bootstrap_with=a, htype='sorted')
    h.block([4,3])
    h.block([4,2])
    h.block([4,0,5])
    for i in h.enumerate():
        print(i)