#!/usr/bin/env python3
"""
Benchmark Experiment 3: Dynamic network with scheduled whale joins
- Distribution: RANDOM (initial Gini: 0.3)
- Peers: 5000
- Epochs: 40000
- Scheduled joins: Epoch 5000 (+10,000 stake), Epoch 35000 (+50,000 stake)
"""

import sys
import os

sys.path.append(os.path.join(os.path.dirname(__file__), "..", "src"))
sys.path.append(os.path.dirname(__file__))

from parameters import Parameters, Distribution, NewEntry

name = "exp_3"

scheduled_joins = [(5000, 10000), (35000, 50000)]

params = Parameters(
    n_epochs=40000,  # Reduce epochs for faster execution
    initial_stake_volume=30000.0,
    initial_distribution=Distribution.RANDOM,
    initial_gini=0.3,
    n_peers=5000,  # Reduce peers for faster execution
    n_corrupted=50,
    p_fail=0.3,
    p_join=0.001,
    p_leave=0.001,
    join_amount=NewEntry.NEW_MAX,
    penalty_percentage=0.3,
    reward=20.0,
    scheduled_joins=scheduled_joins,
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
