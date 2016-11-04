getwd()
setwd('C:/Users/akshi/Downloads')
install.packages('rmarkdown')
library(rmarkdown)

install.packages("ggplot2")
library(ggplot2)

install.packages('dplyr')
library(dplyr)

install.packages('ggvis')
library(ggvis)

install.packages('Hmisc')
library(Hmisc)

install.packages('gridExtra')
library(gridExtra)

install.packages('tidyr')
library(tidyr)

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

