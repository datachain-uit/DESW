#!/usr/bin/env python3
"""
Benchmark Experiment 1: High initial inequality scenario
- Gini: 0.8
- Peers: 2000
- Epochs: 30000
"""

import sys
import os

sys.path.append(os.path.join(os.path.dirname(__file__), "..", "src"))
sys.path.append(os.path.dirname(__file__))

from parameters import Parameters, Distribution, NewEntry

name = "exp_1"

params = Parameters(
    n_epochs=30000, 
    initial_stake_volume=20000.0,
    initial_distribution=Distribution.GINI,
    initial_gini=0.8,
    n_peers=2000, 
    n_corrupted=40,
    p_fail=0.3,
    p_join=0.001,
    p_leave=0.001,
    join_amount=NewEntry.NEW_AVERAGE,
    penalty_percentage=0.3,
    reward=20.0,
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
