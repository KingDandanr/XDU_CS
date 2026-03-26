import math
import os
import tempfile
from typing import Optional

import gymnasium as gym
import numpy as np
from gymnasium import spaces

os.environ.setdefault("MPLCONFIGDIR", os.path.join(tempfile.gettempdir(), "rl_vehicle_mplconfig"))

import matplotlib.pyplot as plt


class VehicleAvoidanceEnv(gym.Env):
    metadata = {"render_modes": ["human"], "render_fps": 10}

    def __init__(self, config: dict, render_mode: Optional[str] = None):
        super().__init__()
        self.render_mode = render_mode
        self.world_size = float(config["world_size"])
        self.start = np.array(config["start"], dtype=np.float32)
        self.goal = np.array(config["goal"], dtype=np.float32)
        self.max_steps = int(config["max_steps"])
        self.base_obstacles = config["obstacles"]
        self.agent_speed = 0.35
        self.goal_radius = 0.45
        self.safe_margin = 0.45
        self.max_obstacles_in_state = 3
        self.current_step = 0

        self.action_vectors = np.array(
            [
                [1.0, 0.0],
                [1.0, 1.0],
                [0.0, 1.0],
                [-1.0, 1.0],
                [-1.0, 0.0],
                [-1.0, -1.0],
                [0.0, -1.0],
                [1.0, -1.0],
            ],
            dtype=np.float32,
        )
        self.action_vectors = self._normalize_rows(self.action_vectors)

        obs_dim = 2 + 2 + 4 + self.max_obstacles_in_state * 5
        self.observation_space = spaces.Box(
            low=-1.0,
            high=1.0,
            shape=(obs_dim,),
            dtype=np.float32,
        )
        self.action_space = spaces.Discrete(len(self.action_vectors))

        self.agent_pos = self.start.copy()
        self.obstacles = []
        self.fig = None
        self.ax = None

    def reset(self, seed=None, options=None):
        super().reset(seed=seed)
        self.current_step = 0
        self.agent_pos = self.start.copy()
        self.obstacles = [
            {
                "position": np.array(item["position"], dtype=np.float32),
                "radius": float(item["radius"]),
                "velocity": np.array(item["velocity"], dtype=np.float32),
            }
            for item in self.base_obstacles
        ]
        observation = self._get_obs()
        info = self._get_info(False, False)
        return observation, info

    def step(self, action):
        self.current_step += 1
        action_vector = self.action_vectors[int(action)] * self.agent_speed
        old_distance = self._distance(self.agent_pos, self.goal)
        self.agent_pos = self._clip_position(self.agent_pos + action_vector)
        self._move_obstacles()

        collision = self._check_collision()
        reached_goal = self._distance(self.agent_pos, self.goal) <= self.goal_radius
        truncated = self.current_step >= self.max_steps
        reward = self._compute_reward(old_distance, collision, reached_goal)

        observation = self._get_obs()
        info = self._get_info(collision, reached_goal)
        terminated = collision or reached_goal

        if self.render_mode == "human":
            self.render()

        return observation, reward, terminated, truncated, info

    def render(self):
        if self.fig is None or self.ax is None:
            self.fig, self.ax = plt.subplots(figsize=(6, 6))

        self.ax.clear()
        self.ax.set_xlim(0, self.world_size)
        self.ax.set_ylim(0, self.world_size)
        self.ax.set_title("Vehicle Avoidance Environment")
        self.ax.set_aspect("equal", adjustable="box")
        self.ax.grid(True, linestyle="--", alpha=0.3)

        self.ax.scatter(self.start[0], self.start[1], c="green", s=80, label="start")
        self.ax.scatter(self.goal[0], self.goal[1], c="red", s=80, label="goal")
        self.ax.scatter(self.agent_pos[0], self.agent_pos[1], c="blue", s=80, label="agent")

        for obstacle in self.obstacles:
            circle = plt.Circle(
                obstacle["position"],
                obstacle["radius"],
                color="gray",
                alpha=0.5,
            )
            self.ax.add_patch(circle)
            velocity = obstacle["velocity"]
            if np.linalg.norm(velocity) > 0:
                self.ax.arrow(
                    obstacle["position"][0],
                    obstacle["position"][1],
                    velocity[0] * 5,
                    velocity[1] * 5,
                    head_width=0.15,
                    color="black",
                    alpha=0.7,
                    length_includes_head=True,
                )

        self.ax.legend(loc="upper left")
        plt.pause(0.001)

    def close(self):
        if self.fig is not None:
            plt.close(self.fig)
            self.fig = None
            self.ax = None

    def _get_obs(self):
        goal_relative = (self.goal - self.agent_pos) / self.world_size
        boundary_info = np.array(
            [
                self.agent_pos[0] / self.world_size,
                self.agent_pos[1] / self.world_size,
                (self.world_size - self.agent_pos[0]) / self.world_size,
                (self.world_size - self.agent_pos[1]) / self.world_size,
            ],
            dtype=np.float32,
        )

        obstacle_features = []
        sorted_obstacles = sorted(
            self.obstacles,
            key=lambda item: self._distance(self.agent_pos, item["position"]),
        )

        for obstacle in sorted_obstacles[: self.max_obstacles_in_state]:
            relative_position = (obstacle["position"] - self.agent_pos) / self.world_size
            velocity = obstacle["velocity"]
            obstacle_features.extend(
                [
                    relative_position[0],
                    relative_position[1],
                    obstacle["radius"] / self.world_size,
                    velocity[0],
                    velocity[1],
                ]
            )

        while len(obstacle_features) < self.max_obstacles_in_state * 5:
            obstacle_features.extend([0.0, 0.0, 0.0, 0.0, 0.0])

        obs = np.array(
            [
                self.agent_pos[0] / self.world_size,
                self.agent_pos[1] / self.world_size,
                goal_relative[0],
                goal_relative[1],
                *boundary_info,
                *obstacle_features,
            ],
            dtype=np.float32,
        )
        return np.clip(obs * 2.0 - 1.0, -1.0, 1.0)

    def _compute_reward(self, old_distance, collision, reached_goal):
        new_distance = self._distance(self.agent_pos, self.goal)
        progress_reward = (old_distance - new_distance) * 8.0
        reward = progress_reward - 0.05

        nearest_gap = self._nearest_obstacle_gap()
        if nearest_gap < self.safe_margin:
            reward -= (self.safe_margin - nearest_gap) * 4.0

        if collision:
            reward -= 80.0
        if reached_goal:
            reward += 120.0
        return reward

    def _get_info(self, collision, reached_goal):
        return {
            "distance_to_goal": self._distance(self.agent_pos, self.goal),
            "collision": collision,
            "reached_goal": reached_goal,
            "step": self.current_step,
        }

    def _move_obstacles(self):
        for obstacle in self.obstacles:
            obstacle["position"] = obstacle["position"] + obstacle["velocity"]
            for idx in range(2):
                lower = obstacle["radius"]
                upper = self.world_size - obstacle["radius"]
                if obstacle["position"][idx] < lower or obstacle["position"][idx] > upper:
                    obstacle["velocity"][idx] *= -1.0
                    obstacle["position"][idx] = np.clip(obstacle["position"][idx], lower, upper)

    def _check_collision(self):
        for obstacle in self.obstacles:
            if self._distance(self.agent_pos, obstacle["position"]) <= obstacle["radius"]:
                return True
        return False

    def _nearest_obstacle_gap(self):
        if not self.obstacles:
            return math.inf
        return min(
            self._distance(self.agent_pos, item["position"]) - item["radius"]
            for item in self.obstacles
        )

    def _clip_position(self, position):
        return np.clip(position, 0.0, self.world_size)

    @staticmethod
    def _distance(a, b):
        return float(np.linalg.norm(a - b))

    @staticmethod
    def _normalize_rows(array):
        norms = np.linalg.norm(array, axis=1, keepdims=True)
        return array / norms
