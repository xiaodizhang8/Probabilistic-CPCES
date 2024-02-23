from hashlib import sha256
from z3 import *
import random
from ConformantProbabilisticPlanning.Z3StringConstraints import StringConstraints
from ConformantProbabilisticPlanning.TagProbability import TagProbability


class PlanChechingTagGenerator:
    def __init__(self, problem, candidate_plan, action_map, contexts, tag_generator, all_projected_problems):
        self.problem = problem
        self.candidate_plan = candidate_plan
        self.action_map = action_map
        self.contexts = contexts
        self.tag_generator = tag_generator
        self.all_projected_problems = all_projected_problems
        self.counter_tags = None

    def find_satisfied_tags(self, threshold=None):
        return self.find_random_satisfied_tags(threshold=threshold)

    def get_hash_code(self, s):
        return sha256(str(s).encode('utf-8')).hexdigest()

    def find_random_satisfied_tags(self, threshold=None):
        '''
        随机抽取tags
        :param threshold:
        :return:
        '''
        satisified_tags = list()
        final_probability = 0
        for i in range(len(self.all_projected_problems)):
            satisified_tags.append(None)
        all_true_and_false_tags = self.tag_generator.all_true_and_false_tags
        all_tags_in_a_list = list()
        tag_pro_index_map = dict()
        for pro_index in range(len(all_true_and_false_tags)):
            tag_group = all_true_and_false_tags[pro_index]
            for tag in tag_group:
                tag = list(tag)
                tag.sort()
                all_tags_in_a_list.append(tag)
                tag_pro_index_map[self.get_hash_code(tag)] = pro_index
        random.shuffle(all_tags_in_a_list)
        for tag in all_tags_in_a_list:
            tag = list(tag)
            tag.sort()
            pro_index = tag_pro_index_map[self.get_hash_code(tag)]
            projected_problem = self.all_projected_problems[pro_index]
            constraint_object = StringConstraints(self.problem, self.candidate_plan, self.action_map,
                                                  self.contexts, self.tag_generator, projected_problem)
            regression_assert = ''
            if self.candidate_plan is not None:
                constraint_object.regression(self.problem, self.candidate_plan, self.action_map)
                regression_assert = constraint_object.get_regression_assert()
            precondition_assert = constraint_object.get_projected_precondition_assert()
            initial_assert = constraint_object.get_projected_initial_assert()
            constraint_string = [regression_assert, precondition_assert, initial_assert]
            tag_assert = '(assert (and '
            for predicate in tag:
                tag_assert += constraint_object.to_smt(predicate, 0) + ' '
                constraint_object.declared_predicate = predicate.get_predicate(0, constraint_object.declared_predicate)
            tag_assert += '))\n'
            constraint_string.append(tag_assert)
            declare_assert = constraint_object.get_other_assert()
            constraint_string.insert(0, declare_assert)
            solver = Solver()
            solver.from_string(' '.join(constraint_string))
            if solver.check() == sat:
                if satisified_tags[pro_index] is None:
                    satisified_tags[pro_index] = [tag]
                else:
                    satisified_tags[pro_index].append(tag)
                if threshold is not None:
                    tp = TagProbability(self.problem, self.candidate_plan, self.action_map, self.contexts, self.tag_generator)
                    probability = self.compute_multi_tags_probability(satisified_tags, tp)
                    final_probability = probability
                    # if final_probability >= threshold:
                    #     break
        print('final probability', final_probability)
        return final_probability

    def compute_multi_tags_probability(self, satisified_tags, tp):
        # 需要先判断sample_tags中是否全为None，即可能没有sample tag。如果没有sample tag直接返回0
        has_sample = False
        for i in satisified_tags:
            if i is not None:
                has_sample = True
                break
        if not has_sample:
            return 0
        else:
            temp_satisified_tags = copy.deepcopy(satisified_tags)
            probability = tp.get_satisfied_tags_probability(temp_satisified_tags)
            return probability