---
title: "P4_project_explore_and_summarise_data"
author: "akshith kandakatla"
date: "December 8, 2016"
output: html_document
---
  
---
References:
  Udacity@Project descriptions: https://github.com/akshithrk/Project-Descriptions-for-Review/blob/master/Data-Analyst/Explore%20and%20Summarize%20Data.md
  Vishnu Priya: http://htmlpreview.github.io/?https://github.com/vishnupriya123/Analysis/blob/master/wines_analysis.html
  Casaretto: https://github.com/pcasaretto/udacity-eda-project/blob/master/wine.Rmd
  Allan Breyes: https://github.com/allanbreyes/udacity-data-science/blob/master/p3/submission.Rmd
  Key Manesh: https://github.com/keymanesh/Udacity--Data-Analysis-with-R
  Daria@Rpubs: https://rpubs.com/Daria/57835
---
#read file
getwd()
#setwd('C:/Users/akshi/Downloads')
# setting working directory for the cloned repository
setwd('C:/Users/ch186802/Downloads')
list.files(pattern = 'csv')
data <- read.csv('wineQualityReds.csv')

#libraries
#install.packages('rmarkdown')
library(rmarkdown)
#install.packages('ggplot2')
library(ggplot2)
#install.packages('xlsx')
library(xlsx)
#install.packages('rJava')
library(rJava)
library(dplyr)
#install.packages('ggvis')
library(ggvis)
library(Hmisc)
library(gridExtra)
#install.packages('tidyr')
library(tidyr)
#install.packages('psych')
library(psych)

#exploring dataset
colnames(data)
# 13 attributes in the data set

summary(data)
str(data)

X <- data$X
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

ggplot(data = data, aes(x= quality, y = alcohol)) +
  geom_point() +
  scale_y_continuous(breaks = seq(0, 15, 1), limits = c(8, 15)) +
  geom_smooth(method = 'lm', color = 'blue')

#little correlation found between wine quality and higher alcohol content

str(data)
summary(X)
describe(X)

cor.test(quality, sulphates,
         method = 'pearson')
#0.251

cor.test(quality, pH,
         method = 'pearson')
#-0.057

cor.test(quality, density,
         method = 'pearson')
#-0.174

cor.test(quality, total.sulphur.dioxide,
         method = 'pearson')

summary(total.sulphur.dioxide)
describe(total.sulphur.dioxide)
table(total.sulphur.dioxide)
head(total.sulphur.dioxide)
total.sulphur.dioxide
str(total.sulphur.dioxide)

cor.test(quality, chlorides,
         method = 'pearson')
#-0.1289

cor.test(quality, residual.sugar,
         method = 'pearson')
#0.0137

cor.test(quality, citric.acid,
         method = 'pearson')
#0.2263

cor.test(quality, volatile.acidity,
         method = 'pearson')
#-0.3905

cor.test(quality, fixed.acidity,
         method = 'pearson')
#0.124

cor.test(quality, X,
         method = 'pearson')
#0.6645
sdf
"
thus based on the correlation test
volatile.acidity = -0.3905
pH = -0.057
chlorides = -0.1289
density = -0.174
residual.sugar = 0.0137
fixed.acidity = 0.124
citric.acid = 0.2263
sulphates = 0.251
X = 0.6645

top 3: 
citric.acid = 0.2263
sulphates = 0.251
X = 0.6645

bottom 3:
volatile.acidity = -0.3905
pH = -0.057
chlorides = -0.1289
"
#checking the covariance of all the variables against each other
#top - 3
data_top3 <- subset(data, select = c(citric.acid, sulphates, X))
cov(data_top3)

"
             citric.acid   sulphates             X
citric.acid   0.03794748  0.01032771    -13.811433
sulphates     0.01032771  0.02873262     -9.807459
X           -13.81143304 -9.80745932 213200.000000
"

cov(data)
cor(data)

#correlation between quality and the other features
"
                         quality
X                     0.06645261
fixed.acidity         0.12405165
volatile.acidity     -0.39055778
citric.acid           0.22637251
residual.sugar        0.01373164
chlorides            -0.12890656
free.sulfur.dioxide  -0.05065606
total.sulfur.dioxide -0.18510029
density              -0.17491923
pH                   -0.05773139
sulphates             0.25139708
alcohol               0.47616632
quality               1.00000000
"

"
assuming good quality is quality >= 7 and
bad quality <= 4
"
"
creating plots based on the above correlation values
"




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
