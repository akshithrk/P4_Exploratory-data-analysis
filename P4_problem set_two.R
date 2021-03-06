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

count(volume == 0)
count(diamonds$volume)
??count
count(volume)

# correlation btw price and volume
cor.test(price, volume, 
         method = 'pearson',
         alternative = 'two.sided',
         conf.level = 0.95)

??subset()
subset <- subset(diamonds, volume = 0 & volume >= 800)
diamonds$subset <- subset
subset

colnames(subset)
subset$price <- subset_price
subset$volume <- subset_volume
subset$volume
subset_volume


cor.test(subset_price, subset$volume,
    method = 'pearson',
    alternative = 'two.sided',
    conf.level = 0.95)

with(subset, cor.test(price, volume))

subset_2 <- subset %>%
  filter(subset$volume != 0,
         subset$volume <= 800)

p5 <- ggplot(data = subset_2, aes(x = subset_2$volume, y = subset_2$price)) +
  geom_point(alpha = 1/20) +
  geom_smooth(method = 'lm', se = T)

p5

#diamonds by clarity
diamondsByClarity <- diamonds %>%
  group_by(clarity) %>%
  summarise(mean_price = mean(price),
            median_price = median(price),
            min_price = min(price),
            max_price = max(price),
            n = n()) %>%
  arrange(clarity)

#barcharts

# diamonds_mp_by_clarity & diamonds_mp_by_color datasets were provided by 
# udacity so, following plots p6 & p7 will produce results in the udacity console

p6 <- ggplot(data = diamonds_mp_by_clarity,
             aes(x = clarity, y = mean_price, fill = clarity)) +
  geom_bar(stat = 'identity', color = 'black')

p7 <- ggplot(data = diamonds_mp_by_color,
             aes(x = color, y = mean_price, fill = color)) +
  geom_bar(stat = 'identity', color = 'black')

grid.arrange(p6, p7)