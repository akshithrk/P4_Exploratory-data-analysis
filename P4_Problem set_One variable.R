help(diamonds)
diamonds
summary(diamonds)
describe(diamonds)
factor(diamonds)
is.ordered(diamonds)
is.factor(diamonds)
str(diamonds)

qplot(x = diamonds$price)

ggplot(diamonds, aes(x = diamonds$price)) +
  geom_histogram(color = 'red', fill = 'blue', binwidth = 590) +
  scale_x_continuous(breaks = seq(0, 19000, 1000)) +
  xlab("price") + ylab('count')

summary(diamonds$price)
describe(diamonds$price >= 15000)

