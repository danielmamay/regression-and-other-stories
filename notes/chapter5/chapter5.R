# 5.1 Simulation of discrete probability models

n_girls <- rbinom(1, 400, 0.488)
print(n_girls)

n_sims <- 1000
n_girls <- rbinom(n_sims, 400, 0.488)
hist(n_girls)

# 5.2 Simulation of continuous and mixed discrete/continuous models

n_sims <- 1000
y1 <- rnorm(n_sims, 3, 0.5)
y2 <- exp(y1)
y3 <- rbinom(n_sims, 20, 0.6)
y4 <- rpois(n_sims, 5)
par(mfrow = c(2, 2))
hist(
  y1,
  breaks = seq(floor(min(y1)), max(y1) + 0.2, 0.2),
  main = "1000 draws from a normal dist. with mean 3, sd 0.5"
)
hist(
  y2,
  breaks = seq(0, max(y2) + 5, 5),
  main = "1000 draws from the corresponding lognormal dist."
)
hist(
  y3,
  breaks = seq(-0.5, 20.5, 1),
  main = "1000 draws from the binomial dist. with 20 tries, probability 0.6"
)
hist(
  y4,
  breaks = seq(-0.5, max(y4) + 1, 1),
  main = "1000 draws from the Poisson dist. with mean 5"
)

# 5.3 Summarizing a set of simulations using median and median absolute deviation

z <- rnorm(1e4, 5, 2)
cat(
  "mean =",
  mean(z),
  ", median =",
  median(z),
  ", sd =",
  sd(z),
  ", mad sd =",
  mad(z)
)

# 5.4 Bootstrapping to simulate a sampling distribution

library(rosdata)

boot_ratio <- function(data) {
  n <- nrow(data)
  boot <- sample(n, replace = TRUE)
  earn_boot <- data$earn[boot]
  male_boot <- data$male[boot]
  median(earn_boot[male_boot == 0]) / median(earn_boot[male_boot == 1])
}

n_sims <- 10000
output <- replicate(n_sims, boot_ratio(data = earnings))

hist(output)
print(sd(output))
