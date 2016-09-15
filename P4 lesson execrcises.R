getwd()
setwd('C:/Users/akshithreddy/Downloads')
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
setwd('C:/Users/akshithreddy/Downloads')
list.files()
facebook <- read.csv('pseudo_facebook.tsv', sep = '\t')
install.packages('ggplot2')
library(ggplot2)
ggplot(facebook)
ggplot(data = facebook, aes(x = dob_day)) +
  geom_histogram(binwidth = 1) +
  scale_x_continuous(breaks = 1:31) +
  facet_wrap(~dob_month)