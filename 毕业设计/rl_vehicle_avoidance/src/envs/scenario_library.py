from copy import deepcopy


SCENARIOS = {
    "static_easy": {
        "world_size": 10.0,
        "start": [1.0, 1.0],
        "goal": [9.0, 9.0],
        "max_steps": 220,
        "obstacles": [
            {"position": [4.0, 4.5], "radius": 0.8, "velocity": [0.0, 0.0]},
            {"position": [6.0, 6.0], "radius": 0.9, "velocity": [0.0, 0.0]},
            {"position": [3.0, 7.0], "radius": 0.7, "velocity": [0.0, 0.0]},
        ],
    },
    "static_dense": {
        "world_size": 10.0,
        "start": [1.0, 1.0],
        "goal": [9.0, 8.8],
        "max_steps": 260,
        "obstacles": [
            {"position": [2.5, 3.0], "radius": 0.7, "velocity": [0.0, 0.0]},
            {"position": [4.0, 2.8], "radius": 0.8, "velocity": [0.0, 0.0]},
            {"position": [5.6, 4.2], "radius": 0.9, "velocity": [0.0, 0.0]},
            {"position": [3.8, 6.2], "radius": 0.8, "velocity": [0.0, 0.0]},
            {"position": [6.5, 6.8], "radius": 0.8, "velocity": [0.0, 0.0]},
            {"position": [7.8, 4.8], "radius": 0.7, "velocity": [0.0, 0.0]},
        ],
    },
    "mixed_dynamic": {
        "world_size": 10.0,
        "start": [1.0, 1.0],
        "goal": [9.0, 9.0],
        "max_steps": 300,
        "obstacles": [
            {"position": [4.0, 4.0], "radius": 0.8, "velocity": [0.0, 0.0]},
            {"position": [6.8, 6.5], "radius": 0.7, "velocity": [0.0, 0.0]},
            {"position": [5.0, 2.5], "radius": 0.6, "velocity": [0.05, 0.0]},
            {"position": [2.5, 6.0], "radius": 0.6, "velocity": [0.0, -0.05]},
            {"position": [7.0, 3.5], "radius": 0.5, "velocity": [-0.04, 0.03]},
        ],
    },
    "narrow_passage": {
        "world_size": 10.0,
        "start": [1.0, 1.0],
        "goal": [9.0, 9.0],
        "max_steps": 320,
        "obstacles": [
            {"position": [3.3, 4.0], "radius": 0.75, "velocity": [0.0, 0.0]},
            {"position": [4.6, 5.2], "radius": 0.75, "velocity": [0.0, 0.0]},
            {"position": [5.9, 4.0], "radius": 0.75, "velocity": [0.0, 0.0]},
            {"position": [4.1, 7.0], "radius": 0.65, "velocity": [0.0, 0.0]},
            {"position": [6.4, 7.0], "radius": 0.65, "velocity": [0.0, 0.0]},
        ],
    },
    "dynamic_crossing": {
        "world_size": 10.0,
        "start": [1.0, 8.8],
        "goal": [9.0, 1.2],
        "max_steps": 340,
        "obstacles": [
            {"position": [3.0, 3.0], "radius": 0.55, "velocity": [0.06, 0.0]},
            {"position": [7.0, 7.0], "radius": 0.55, "velocity": [-0.06, 0.0]},
            {"position": [5.0, 2.5], "radius": 0.6, "velocity": [0.0, 0.055]},
            {"position": [5.0, 7.5], "radius": 0.6, "velocity": [0.0, -0.055]},
            {"position": [4.5, 5.0], "radius": 0.7, "velocity": [0.0, 0.0]},
        ],
    },
}


def get_scenario(name: str) -> dict:
    if name not in SCENARIOS:
        raise ValueError(f"Unknown scenario: {name}. Available: {list(SCENARIOS)}")
    return deepcopy(SCENARIOS[name])
