

# setup -------------------------------------------------------------------
getwd()
setwd('C:/Users/akshi/Downloads')
states<- read.csv('stateData.csv')
states
statesubset <- subset(states, state.region == 1)
head(statesubset, 2)
dim(statesubset)

install.packages("rmarkdown")
library(rmarkdown)
?mtcars
summary(mtcars)
describe(mtcars)
str(mtcars) 


# libraries ------------------------------------------------------------------------


subset(mtcars, mpg>= 30 | hp < 60)

install.packages("ggplot2", dependencies = T)
library(ggplot2)

install.packages('xlsx')
library(xlsx)

install.packages('rJava')
library(rJava)

install.packages('dplyr')
library(dplyr)

install.packages('ggvis')
library(ggvis)

reddit <- read.csv('reddit.csv')


# order function ----------------------------------------------------------

#using order function to order the factor variables
getwd()
setwd('C:/Users/akshithreddy/Downloads')
reddit <- read.csv('reddit.csv')
table(reddit$employment.status)
reddit
str(reddit)
summary(reddit)
View(reddit)
reddit$age.range
levels(reddit)
levels(reddit$age.range)
qplot(data = reddit, x = age.range)
library(ggplot2)
levels(reddit$income.range)
levels(reddit$age.range)
is.factor(reddit$age.range)
age.range.order <- ordered(reddit$age.range, levels = c("Under 18", "18-24", "25-34", "35-44", "45-54", "55-64", "65 or Above"))
reddit$age.range
age.range.order

# order function for the income.range
reddit$income.range
levels(reddit$income.range)
reddit$income.range <- ordered(reddit$income.range, levels = c("Under $20,000", "$20,000 - $29,999", "$30,000 - $39,999", "$40,000 - $49,999", "$50,000 - $69,999", "$70,000 - $99,999", "$100,000 - $149,999", "$150,000 or more"))
qplot(reddit$income.range)


# facebook ----------------------------------------------------------------

#facebook user data
getwd()
setwd('C:/Users/akshi/Downloads')
list.files()
facebook <- read.csv('pseudo_facebook.tsv', sep = '\t')
install.packages('ggplot2')
library(ggplot2)
ggplot(data = facebook, aes(x = dob_day)) +
  geom_histogram(binwidth = 1) +
  scale_x_continuous(breaks = 1:31) +
  facet_wrap(~dob_month)
install.packages('Hmisc')
library(Hmisc)
summary(facebook$friend_count)
summarize(facebook$friend_count)
describe(facebook)
colnames(facebook)
qplot(facebook$friend_count)
ggplot(facebook)
help("qplot")


# fb_qplot ----------------------------------------------------------------

qplot(x = facebook$friend_count,
       data = facebook, xlim = c(0, 1000))

qplot(x = facebook$friend_count, y=facebook$gender,  data = facebook) +
  scale_x_continuous(limits = c(0, 1000), breaks = seq(0, 1000, 50))

qplot(x= facebook$friend_count, data = na.omit(facebook),
      binwidth = 10) +
  scale_x_continuous(limits = c(0, 1000), breaks = seq(0, 1000, 50)) +
  facet_wrap(~gender)

ggplot(aes(x = facebook$friend_count), data = facebook) +
  geom_histogram() +
  scale_x_continuous(limits = c(0, 1000), breaks = seq(0, 1000, 50)) +
  facet_wrap(~gender)

qplot(x= facebook$friend_count, data = facebook, na.omit(facebook$gender)) +
  scale_x_continuous(limits = c(0, 1000), breaks = seq(0, 1000, 50)) +
  facet_wrap(~gender)

table(facebook$gender)
by(facebook$friend_count, facebook$gender, summary)

qplot(facebook$tenure, data = facebook, color = 'black', fill = )


# fb_tenure ---------------------------------------------------------------

#tenure

setwd('C:/Users/akshi/Downloads')
facebook <- read.csv('pseudo_facebook.tsv', sep = '\t')

library(ggplot2)
library(Hmisc)
tenure<-na.omit(facebook$tenure)
tenure


# fb_ggplot ---------------------------------------------------------------

ggplot(aes(x = tenure), data = facebook) + 
  geom_histogram(binwidth = 30, color = 'black', fill = '#099DD9')

tenure_plot = qplot(x = tenure, data = facebook, binwidth = 30,
      color = I('black'), fill = I('#099DD9'))
tenure_plot

tenure<-facebook$tenure
ggplot(aes(x = tenure/365), data = facebook) +
  geom_histogram(binwidth = 0.25, color = I('black'), fill = I('#099DD9'))
                 + scale_x_continuous(breaks = seq(1, 7, 1), limits = c(0, 7))


# fb_qplot_labelling ------------------------------------------------------

#labelling

qplot(x = tenure/365, data = facebook, binwidth = 0.12,
      color = I('black'), fill = I('#099DD9')) +
  scale_x_continuous(breaks = seq(1, 7, 1), limits = c(0, 7)) +
  xlab('number of years') + ylab('fb user count')


# user ages
describe(facebook)
user<-facebook$userid

age<-facebook$age
summary(age)

age_plot = qplot(x = age, data = facebook, binwidth = 1,
      color = I('black'), fill = I('#188AA8')) +
  scale_x_continuous(breaks = seq(0, 115, 5), limits = c(13, 115)) +
  xlab('user age') + ylab('no. of fb users')
age_plot


# fb_data transformation --------------------------------------------------

# data transformation
install.packages('gridExtra')

age_plot
tenure_plot

friend_cnt<-facebook$friend_count

friend_cnt_plot = qplot(x = friend_cnt, data = facebook, binwidth = 25,
                        color = I('black')) + 
  scale_x_continuous(breaks = seq(0, 700, 50), limits = c(0, 700))

friend_cnt_plot

library(gridExtra)
grid.arrange(tenure_plot, age_plot, ncol = 1, nrow = 2)

summary(friend_cnt)
summary(log10(friend_cnt))
summary(log10(friend_cnt + 1))
summary(sqrt(friend_cnt))

grid.arrange(friend_cnt_plot, age_plot, tenure_plot, ncol = 1, nrow = 3)

friend.cnt.log <- log10(friend_cnt + 1)
friend.cnt.sqrt <- sqrt(friend_cnt)

frndcnt_sqrt_plot = qplot(friend.cnt.sqrt, data = facebook, binwidth = 1,
                          color = I('black'))
frndcnt_sqrt_plot

frndcnt_log_plot = qplot(friend.cnt.log, data = facebook, binwidth = 0.1,
                         color = I('black'))
frndcnt_log_plot
grid.arrange(friend_cnt_plot, frndcnt_sqrt_plot, frndcnt_log_plot, nrow = 3, ncol = 1)

p1 <- ggplot(aes(x = friend_cnt), data = facebook) + geom_histogram()
p1
log <- p1 + scale_x_log10()
sqrt <- p1 + scale_x_sqrt()
log
sqrt

grid.arrange(p1, log, sqrt, ncol = 1)


# frequency polygons ------------------------------------------------------

friend_cnt<-na.omit(facebook$friend_count)
friend_cnt<-facebook$friend_count
gender<- facebook$gender

!is.na(friend_cnt)

qplot(x = friend_cnt, data = subset(facebook, !is.na(gender)),
      binwidth = 10) +
  scale_x_continuous(lim = c(0, 1000), breaks = seq(0, 1000, 50)) +
  facet_wrap(~gender)

library(ggplot2)
qplot(x = friend_cnt, data = subset(facebook, !is.na(gender)),
      binwidth = 10, geom = 'freqpoly', color = gender) +
  scale_x_continuous(lim = c(0, 1000), breaks = seq(0, 1000, 50))
help(qplot)


# freq_polygon_likes ------------------------------------------------------

likes<- facebook$www_likes
gender<- facebook$gender

help(subset)
qplot(x = likes, data = subset(facebook, !is.na(gender)),
      geom = 'freqpoly', color = gender) +
  scale_x_continuous() +
  scale_x_log10()

summary(likes)
describe(likes)
by(likes, gender, sum)


# boxplots ----------------------------------------------------------------
friend_cnt<- na.omit(facebook$friend_count)

qplot(x = gender, y = friend_count,
      data = subset(facebook, !is.na(gender)),
      geom = 'boxplot', ylim = c(0, 1000))

# as most of the data points were omitted to derive conclusions we use cartesian cord to set y limits


qplot(x = gender, y = friend_count,
      data = subset(facebook, !is.na(gender)),
      geom = 'boxplot') +
  coord_cartesian(ylim = c(0, 1000))

qplot(x = gender, y = friend_count,
      data = subset(facebook, !is.na(gender)),
      geom = 'boxplot') +
  coord_cartesian(ylim = c(0, 250))

by(facebook$friendships_initiated, gender, summary)
mobile_checkin <- NA
facebook$mobile_checkin <- ifelse(facebook$mobile_likes > 0, 1, 0)
help(factor)
facebook$mobile_checkin <- factor(facebook$mobile_checkin)
summary(facebook$mobile_checkin)
describe(facebook$mobile_checkin)
