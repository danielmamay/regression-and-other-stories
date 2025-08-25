library(ggplot2)
library(rosdata)
library(rstanarm)

data(health)

print(health)

# Scatterplot

country <- rownames(health)

plot(health$spending, health$lifespan, type="n")
text(health$spending, health$lifespan, country)

# ggplot version

ggplot(data=health, aes(x=spending, y=lifespan, label=country)) +
  geom_text() +
  labs(x="Health care spending (PPP US$)",
       y="Life expectancy (years)")
