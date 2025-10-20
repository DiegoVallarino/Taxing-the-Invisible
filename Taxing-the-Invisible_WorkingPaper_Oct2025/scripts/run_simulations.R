# Taxing the Invisible – Working Paper (October 2025)
# Author: Diego Vallarino, Ph.D.
# Institution: Inter-American Development Bank (IDB), Washington D.C.
# License: MIT License
# Repository: https://github.com/DiegoVallarino/Taxing-the-Invisible


library(dplyr)
data <- read.csv("./data/synthetic_data_small.csv")

# Simple benchmark vs GNN tax comparison
data <- data %>% mutate(
  tax_benchmark = 0.2 * income,
  tax_gnn = 0.25 * income * runif(n(), 0.9, 1.1),
  post_tax_benchmark = income - tax_benchmark,
  post_tax_gnn = income - tax_gnn
)

summary_stats <- data.frame(
  mean_income = mean(data$income),
  mean_tax_gnn = mean(data$tax_gnn),
  mean_tax_benchmark = mean(data$tax_benchmark)
)

write.csv(summary_stats, "./results/tables/simulation_summary.csv", row.names = FALSE)
