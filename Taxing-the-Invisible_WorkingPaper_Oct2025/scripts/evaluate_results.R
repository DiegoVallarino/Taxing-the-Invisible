# Taxing the Invisible – Working Paper (October 2025)
# Author: Diego Vallarino, Ph.D.
# Institution: Inter-American Development Bank (IDB), Washington D.C.
# License: MIT License
# Repository: https://github.com/DiegoVallarino/Taxing-the-Invisible


library(ggplot2)
data <- read.csv("./data/synthetic_data_small.csv")
summary <- read.csv("./results/tables/simulation_summary.csv")

ggplot(data, aes(x = income)) +
  geom_histogram(bins = 30, fill = 'steelblue', color = 'white') +
  labs(title = 'Income Distribution – Synthetic Economy', x = 'Income', y = 'Count')

ggsave('./results/figures/income_distribution.png', width = 7, height = 5)
