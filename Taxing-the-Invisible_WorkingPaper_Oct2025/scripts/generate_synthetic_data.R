# Taxing the Invisible – Working Paper (October 2025)
# Author: Diego Vallarino, Ph.D.
# Institution: Inter-American Development Bank (IDB), Washington D.C.
# License: MIT License
# Repository: https://github.com/DiegoVallarino/Taxing-the-Invisible


set.seed(123)
library(MASS)
library(copula)

# Simulate synthetic population
n <- 500
education <- sample(c("low", "medium", "high"), n, replace = TRUE, prob = c(0.3, 0.5, 0.2))
sector <- sample(c("agriculture", "industry", "services"), n, replace = TRUE, prob = c(0.4, 0.35, 0.25))
region <- sample(c("north", "south", "east", "west"), n, replace = TRUE)

# Copula-based income generation
cop <- normalCopula(param = 0.6, dim = 2)
u <- rCopula(n, copula = cop)
income <- qlnorm(u[,1], meanlog = 3.2, sdlog = 0.5)

synthetic_data <- data.frame(education, sector, region, income)
write.csv(synthetic_data, "./data/synthetic_data_small.csv", row.names = FALSE)
