getwd()
setwd('C:/Users/akshi/Downloads')
library(rmarkdown)
library(ggplot2)
library(dplyr)
library(ggvis)
library(Hmisc)
library(gridExtra)
library(tidyr)


install.packages('rmarkdown')
install.packages("ggplot2")
install.packages('dplyr')
install.packages('ggvis')
install.packages('Hmisc')
install.packages('gridExtra')
install.packages('tidyr')

#Lesson 4_problem set: 2
#========================================================

diamonds
summary(diamonds)
#summarize(diamonds, min)

??describe
describe(diamonds)
colnames(diamonds)

??by
by(diamonds$clarity, nrow(diamonds$carat), simplify = T)


# defining variables

carat <- diamonds$carat
cut <- diamonds$cut
color <- diamonds$color
clarity <- diamonds$clarity
depth <- diamonds$depth
table <- diamonds$table
price <- diamonds$price
x <- diamonds$x
y <- diamonds$y
z <- diamonds$z

# price vs x

p1 <- ggplot(aes(x = price, y = x), data = diamonds) +
  geom_point()

p1

# findings

cor.test(price, x, alternative = 'two.sided',
         method = 'pearson', conf.level = 0.95 )

# correlations
cor.test(price, y, alternative = 'two.sided',
         method = 'pearson', conf.level = 0.95 )

cor.test(price, z, alternative = 'two.sided',
         method = 'pearson', conf.level = 0.95 )

#price vs depth

p2 <- ggplot(aes(x = depth, y = price), data = diamonds) +
  geom_point()

p2

#adjustments

p2 <- ggplot(aes(x = depth, y = price), data = diamonds) +
  geom_point(alpha = 1/100) +
  scale_x_continuous(breaks = seq(min(depth), max(depth), 2),
                     labels = seq(min(depth), max(depth), 2))

p2

#correlation depth vs price

cor.test(depth, price, alternative = 'two.sided',
         method = 'pearson', conf.level = 0.95)

#price vs. carat

describe(price)
describe(carat)

top_price <- subset(price, price <= quantile(price, 0.99))
describe(top_price)
top_carat <- subset(carat, carat <= quantile(carat, 0.99))
describe(top_carat)

p3 <- ggplot(aes(x = carat, y = price), data = diamonds) +
  geom_point(alpha = 1/20) +
  scale_x_continuous(limits = c(0, quantile(carat, 0.99))) +
  scale_y_continuous(limits = c(0, quantile(price, 0.99)))

p3

# price vs. volume
colnames(diamonds)

diamonds$volume <- x * y * z
volume <- diamonds$volume
summary(volume)
describe(volume)

p4 <- ggplot(data = diamonds, aes(x = price, y = volume)) +
  geom_point(alpha = 1/20)

p4
