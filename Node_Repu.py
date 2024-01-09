import matplotlib.pyplot as plt
import numpy as np

# Example Node Reputation Data
nodes = ['Node1', 'Node2', 'Node3', 'Node4']
reputation_scores = [80, 95, 65, 75]

fig = plt.figure(figsize=(10, 8))
ax = fig.add_subplot(111, projection='3d')

# Plot Nodes in 3D Space
ax.scatter(range(len(nodes)), [1] * len(nodes), reputation_scores, s=100, c=reputation_scores, cmap='viridis')

# Customize the plot
ax.set_xlabel('Nodes')
ax.set_ylabel('Y Axis (Static)')
ax.set_zlabel('Reputation Score')
ax.set_title('Node Reputation in 3D Space')

# Add node labels
for i, node in enumerate(nodes):
    ax.text(i, 1.2, reputation_scores[i], node, ha='center', va='center', color='black')

plt.show()
