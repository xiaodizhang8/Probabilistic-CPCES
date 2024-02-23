import os
from ConformantProbabilisticPlanning.PlanChecking import PlanChecking

path = '/Users/xiaodizhang/Documents/PhD_Project/ICAPS-2024/实验数据/results-FF-hit-0.99'
folders = os.listdir(path)
folders.sort()

for domain in folders:
    if domain == '.DS_Store':
        continue
    if domain == 'bomb':
        continue
    for round in os.listdir(os.path.join(path, domain)):
        if round == '.DS_Store':
            continue
        if round != '1':
            continue
        for file in os.listdir(os.path.join(path, domain, round)):
            if file == '.DS_Store':
                continue
            has_plan = False
            with open(os.path.join(path, domain, round, file), 'r') as f:
                contents = f.readlines()
                for line in contents:
                    if line.startswith('find a valid plan'):
                        has_plan = True
                    if has_plan and line.startswith('['):
                        line = line[1:-2]
                        plan = line.split(', ')
                        modified_plan = []
                        for action in plan:
                            action = action.replace('\'', '')
                            modified_plan.append(action)
                        break
            if has_plan:
                instance = file.split('.')[0]+'.pddl'
                print('-'*50)
                print('domain:', domain)
                print('instance:', instance)
                print('round:', round)
                print('checking plan...')
                PlanChecking(modified_plan, os.path.join('FD-Benchmarks-0.99', domain, 'domain.pddl'), os.path.join('FD-Benchmarks-0.99', domain, 'instances', instance), type='conformant_probabilistic_planning')