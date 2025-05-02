# Probabilistic-CPCES and Probabilistic-CPCES-HIT

This is the repository for the project on Probabilistic-CPCES and Probabilistic-CPCES-HIT. For the underlying principles, please refer to our paper: https://ojs.aaai.org/index.php/ICAPS/article/view/31532

This work is inspired from CPCES. CPCES is a counter-example based conformant planner. For more details on CPCES, please refer to the paper: https://www.sciencedirect.com/science/article/pii/S000437022030031X

## Before Running the Program
1. Download the classical planner FF and install it. Move the compiled executable ''ff'' to the ./classical_planner directory. For more information about the FF planner, please refer to: https://fai.cs.uni-saarland.de/hoffmann/ff.html
2. We have already downloaded the Fast Downward planner. The source code is located in the ./downward directory. You need to compile it.
3. You may need to install Madagascar planner. We provide an executable Madagascar under classical_planner/DisjunctiveMadagascar folder. Note that because Madagascar does not support disjunctive goals, we did some translations so that Madagascar can be run. The translation codes are under classical_planner/DisjunctiveMadagascar/translate
4. You may have to install some modules in requirements.txt.
5. (***VERY IMPORTANT!!!***) This project requires python3 library NNF. After installing NNF module, find where NNF module is, and modify a file named dsharp.py (this file is in NNF module) at line 154. The original code is “return result”, but you should modify it as “return result, var_labels”. Our program uses var-labels to help us compute counter-tags.

## Program Options
The main function is at conformant_probability_planning.py, in which:
* -d is the path to the domain file
* -i is the path to the instance file
* -p is the planner (ff or fd or mad). mad is Madagascar, fd is Fast Downward.
* -s is the searching engine when you are choosing superfd. You should refer to the official website of Fast Downward to see how to use various searching engines.
* -hs (boolean) is whether using hitting set strategy (probabilistic-CPCES-hit).
* -ht is the hitting set strategy (random or minimal).

## How to run Probabilistic-CPCES
example 1 (ff planner):
```bash
python3 conformant_probability_planning.py -d FD-Benchmarks-0.99/dispose/domain.pddl -i FD-Benchmarks-0.99/dispose/instances/p_4_2.pddl -p ff
```

example 2 (Madagascar planner):
```bash
python3 conformant_probability_planning.py -d FD-Benchmarks-0.99/dispose/domain.pddl -i FD-Benchmarks-0.99/dispose/instances/p_4_2.pddl -p mad
```

## How to run Probabilistic-CPCES-hit
using random hitting set strategy (ff planner):
```bash
python3 conformant_probability_planning.py -d FD-Benchmarks-0.99/dispose/domain.pddl -i FD-Benchmarks-0.99/dispose/instances/p_4_2.pddl -p ff -hs True -ht random
```

using minimal hitting set strategy (ff planner):
```bash
python3 conformant_probability_planning.py -d FD-Benchmarks-0.99/dispose/domain.pddl -i FD-Benchmarks-0.99/dispose/instances/p_4_2.pddl -p ff -hs True -ht minimal
```