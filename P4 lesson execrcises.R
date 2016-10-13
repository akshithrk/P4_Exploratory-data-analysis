getwd()
setwd('C:/Users/akshi/Downloads')
states<- read.csv('stateData.csv')
states
statesubset <- subset(states, state.region == 1)
head(statesubset, 2)
dim(statesubset)
install.packages("rmarkdown")
?mtcars
summary(mtcars)
str(mtcars)
subset(mtcars, mpg>= 30 | hp < 60)
install.packages("ggplot2", dependencies = T)
library(ggplot2)
install.packages('xlsx')
library(xlsx)
install.packages('rJava')
library(xlsx)
library(rJava)
install.packages('rJava')
library(rJava)
install.packages('dplyr')
library(dplyr)
install.packages('ggvis')
library(ggvis)
reddit <- read.csv('reddit.csv')

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

tenure<-na.omit(facebook$tenure)
tenure
ggplot(aes(x = tenure), data = facebook) + 
  geom_histogram(binwidth = 30, color = 'black', fill = '#099DD9')

ggplot(aes(x = tenure/365), data = facebook) +
  geom_histogram(binwidth = 0.12, color = 'black', fill = '#099DD9')
