help(diamonds)
diamonds
summary(diamonds)
describe(diamonds)
factor(diamonds)
is.ordered(diamonds)
is.factor(diamonds)
str(diamonds)

library(ggplot2)
qplot(x = diamonds$price)

ggplot(diamonds, aes(x = diamonds$price)) +
  geom_histogram(color = 'red', fill = 'blue', binwidth = 590) +
  scale_x_continuous(breaks = seq(0, 19000, 1000)) +
  xlab("price") + ylab('count')

summary(diamonds$price)
describe(diamonds$price >= 15000)

ggplot(diamonds, aes(x = diamonds$price)) +
  geom_histogram(color = 'red', fill = 'blue', binwidth = 30) +
  scale_x_continuous(labels = diamonds$dollar, breaks = seq(0, 2000, 250)) +
  coord_cartesian(c(0, 2000)) +
  xlab("price") + ylab('count')


# diamond prices by cut ---------------------------------------------------

summary(diamonds$cut)
describe(diamonds)
colnames(diamonds)
help(describe)
??describe
library(Hmisc)
describe(diamonds$cut)
str(diamonds$cut)
levels(diamonds$cut)
cut <- diamonds$cut
price <- diamonds$price
diamonds$dollar

help("facet_grid")
ggplot(diamonds, aes(x= price)) +
  geom_histogram(color = 'black', fill = 'orange', binwidth = 30) +
  scale_x_continuous(labels = diamonds$dollar, breaks = seq(0, 4000, 100)) +
  coord_cartesian(c(0, 4000)) +
  facet_grid(cut~., scales = 'free_y') +
  xlab('price') + ylab('cut')


# price -------------------------------------------------------------------

describe(price)
library(dplyr)
help(by)
by(cut, price, summary)
by(price, cut, summary)

group_by(cut)
diamonds %>%
  group_by(cut) %>%
  summarise(max = max(price),
            min = min(price),
            median = median(price))


# scale -------------------------------------------------------------------

qplot(x = price, data = diamonds) + facet_wrap(~cut)
help("facet_wrap")
qplot(x = price, data = diamonds) + 
  facet_wrap(~cut, scales = 'free_y')


# price by carat ----------------------------------------------------------
price <- diamonds$price
carat <- diamonds$carat

price_per_carat <- ggplot(diamonds, aes(price/carat)) +
  geom_histogram(color = "black", fill = "Red", binwidth = 3.27) +
  facet_grid(cut~., scales = 'free') +
  xlab('price per carat') + ylab('count')
  
price_per_carat
price_per_carat + scale_x_log10()

# boxplots ----------------------------------------------------------------

qplot(x = price, data = diamonds,
      geom = 'boxplot')

ggplot(diamonds, aes(x = diamonds$clarity, y = price, color = cut)) +
  geom_boxplot()

# adding a 3rd dimension
clarity<- diamonds$clarity
ggplot(diamonds, aes(x = clarity, y = price, color = cut)) +
  geom_boxplot() +
  facet_grid(color~., margins = T, scales = 'free')

# adjusting data to the mean
ggplot(diamonds, aes(x = clarity, y = price, color = cut)) +
  geom_boxplot() +
  facet_grid(color~., margins = T, scales = 'free') +
  coord_cartesian()


# IQR ---------------------------------------------------------------------

by(diamonds$color, quantile, iqr)
diamonds %>%
  group_by(color) %>%
  summarise(first = quantile(price, 0.25),
            third = quantile(price, 0.75),
            iqr = third - first)
