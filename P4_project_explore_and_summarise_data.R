---
title: "P4_project_explore_and_summarise_data"
author: "akshith kandakatla"
date: "December 8, 2016"
output: html_document
---
#read file
getwd()
setwd('C:/Users/akshi/Downloads')
list.files(pattern = 'csv')
data <- read.csv('wineQualityReds.csv')

#libraries
library(rmarkdown)
library(ggplot2)
#install.packages('xlsx')
library(xlsx)
#library(rJava)
library(dplyr)
library(ggvis)
library(Hmisc)
library(gridExtra)
library(tidyr)
#install.packages('psych')
library(psych)

#exploring dataset
colnames(data)
# 13 attributes in the data set

summary(data)
str(data)

x <- data$X
fixed.acidity <- data$fixed.acidity
volatile.acidity <- data$volatile.acidity
citric.acid <- data$citric.acid
residual.sugar <- data$residual.sugar
chlorides <- data$chlorides
free.sulphur.dioxide <- data$free.sulphur.dioxide
total.sulphur.dioxide <- data$total.sulphur.dioxide
density <- data$density
pH <- data$pH
sulphates <- data$sulphates
alcohol <- data$alcohol
quality <- data$quality

#visualising data
qplot(data = data, x = data$X)

ggplot(data = data, aes(x = data$X)) +
  geom_histogram(binwidth = 30, color = I('black'), fill = I('#099DD9')) +
  scale_x_continuous(breaks = seq(0, 1600, 100), limits = c(0, 1550)) 

x.log <- log10(data$X + 1)
qplot(data = data, x = x.log)
x.log.plot <- ggplot(data = data, aes(x = x.log)) + 
  geom_histogram(binwidth = 0.1, color = I('black'), fill = I('#099DD9')) + 
  scale_x_continuous(breaks = seq(0, 5, 1), limits = c(0, 3.5)) 

#considering response variable as quality
summary(quality)
table(quality)
describe(quality)

#checking correlation  quality & alcohol
cor.test(quality, alcohol,
         method = 'pearson',
         conf.level = 0.95)
#0.4761

with(data, cor.test(quality, alcohol),
     method = 'pearson')
#0.4761



```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r cars}
summary(cars)
```

## Including Plots

You can also embed plots, for example:

```{r pressure, echo=FALSE}
plot(pressure)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
