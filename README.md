# Taxing the Invisible: Robust Fiscal Design under Informational Scarcity

**Author:** Diego Vallarino, Ph.D.  
**Affiliation:** Inter-American Development Bank (IDB), Washington, D.C.  
**Year:** 2025  
**License:** MIT License  
**DOI (pending):** [To be added after Zenodo deposition]

---

## Overview

This repository accompanies the paper:

> **Vallarino, D. (2025). _Taxing the Invisible: Robust Fiscal Design under Informational Scarcity._**  
> Journal of Economics, Finance and Administrative Science (JEFAS).

The project develops a **robust taxation framework** combining  
Graph Neural Networks (GNNs) and distributionally robust optimization  
to design equitable fiscal rules in environments with limited information.

Two stylized economies are simulated —a **small cohesive** and a **large fragmented** one—  
using synthetic populations generated through **copula-based sampling** calibrated  
to empirical aggregates from public household and labor surveys.

---

## Methodology Summary

1. **Synthetic Data Generation:**  
   Multivariate copulas (Gaussian/Clayton) were used to expand base populations (2,500 → 25,000; 10,000 → 100,000 agents),  
   preserving marginal distributions and conditional dependencies of observable features  
   (education, occupation, region, and sectoral informality).

2. **Graph Construction:**  
   Economic similarity networks were built from co-occurrence matrices of observed features.  
   Nodes represent agents; edges represent structural proximity.

3. **Representation Learning (GNN):**  
   Graph embeddings were learned using a Graph Convolutional Network (GCN) implemented in PyTorch Geometric.  
   Embeddings act as sufficient statistics for tax design under partial observability.

4. **Robust Fiscal Optimization:**  
   Tax schedules were optimized using distributionally robust optimization  
   over Wasserstein ambiguity sets, ensuring welfare performance under uncertainty.

5. **Simulation Analysis:**  
   Comparative evaluation between structure-informed and benchmark tax rules  
   (based on observable proxies) using indicators of redistribution, regressivity,  
   and robustness.

---

## Repository Contents

| Folder | Description |
|---------|--------------|
| `data/` | Synthetic datasets (500 & 1,000 agents) for reproducibility. |
| `scripts/` | R and Python scripts to generate data, train GNNs, and run simulations. |
| `results/` | Tables and figures included in the manuscript. |
| `supplementary/` | Mathematical formulation, methodological notes, and codebook. |

---

## Data Availability

All datasets are **fully synthetic**, generated from statistical distributions  
calibrated to anonymized aggregates from public sources.  
No confidential or individual-level data are used.

The complete synthetic dataset and simulation code can be accessed:
- via this repository (`data/` folder) for demonstration samples (500 & 1,000 agents);
- or upon request to the corresponding author for the full-size populations.

> Data access requests: [Contact the author](mailto:dvallarino@iadb.org)

---

## 🔍 Citation

If you use this repository, please cite:

---

## 📄 License

This repository is distributed under the **MIT License**,  
allowing reuse and adaptation with appropriate attribution.

---

## 🧠 Acknowledgments

This research was developed within the context of fiscal policy innovation  
at the Inter-American Development Bank (IDB).  
The author thanks colleagues and reviewers for comments on earlier drafts,  
and acknowledges the computational resources used for GNN training and simulation.

---
