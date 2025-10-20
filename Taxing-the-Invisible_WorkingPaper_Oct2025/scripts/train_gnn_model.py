# Taxing the Invisible – Working Paper (October 2025)
# Author: Diego Vallarino, Ph.D.
# Institution: Inter-American Development Bank (IDB), Washington D.C.
# License: MIT License
# Repository: https://github.com/DiegoVallarino/Taxing-the-Invisible

import torch
from torch_geometric.data import Data
from torch_geometric.nn import GCNConv
import pandas as pd

torch.manual_seed(42)

# Load synthetic data
df = pd.read_csv('./data/synthetic_data_small.csv')
n = len(df)

# Create dummy graph edges
edge_index = torch.randint(0, n, (2, n * 2))
x = torch.tensor(pd.get_dummies(df[['education','sector','region']]).values, dtype=torch.float)
y = torch.tensor(df['income'].values, dtype=torch.float).view(-1, 1)

# Define GNN
class GNN(torch.nn.Module):
    def __init__(self):
        super(GNN, self).__init__()
        self.conv1 = GCNConv(x.size(1), 16)
        self.conv2 = GCNConv(16, 1)
    def forward(self, x, edge_index):
        x = torch.relu(self.conv1(x, edge_index))
        return self.conv2(x, edge_index)

model = GNN()
optimizer = torch.optim.Adam(model.parameters(), lr=0.01)
criterion = torch.nn.MSELoss()

for epoch in range(200):
    optimizer.zero_grad()
    pred = model(x, edge_index)
    loss = criterion(pred, y)
    loss.backward()
    optimizer.step()

torch.save(model.state_dict(), './results/gnn_model.pt')
