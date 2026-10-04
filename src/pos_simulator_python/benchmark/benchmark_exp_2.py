#!/usr/bin/env python3
"""
Benchmark Experiment 2: Large scale random network
- Distribution: RANDOM (initial Gini: 0.0)
- Peers: 10000
- Epochs: 40000
"""

import sys
import os

sys.path.append(os.path.join(os.path.dirname(__file__), "..", "src"))
sys.path.append(os.path.dirname(__file__))

from parameters import Parameters, Distribution, NewEntry

name = "exp_2"

params = Parameters(
    n_epochs=40000, 
    initial_stake_volume=50000.0,
    initial_distribution=Distribution.RANDOM,
    initial_gini=0.0,
    n_peers=10000, 
    n_corrupted=200,
    p_fail=0.5,
    p_join=0.01,
    p_leave=0.01,
    join_amount=NewEntry.NEW_RANDOM,
    penalty_percentage=0.5,
    reward=40.0,
    scheduled_joins=None,
    scheduled_sybil_attacks=None,
    use_dynamic_reward=True,
)

if __name__ == "__main__":
    try:
        from benchmark_algorithms import run_benchmark

        run_benchmark(params, name)
    except Exception as e:
        import traceback

        traceback.print_exc()
