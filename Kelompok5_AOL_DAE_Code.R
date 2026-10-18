setwd("~/CS STAT Sem 5/Design & Analysis of Experiments/aol")

# Load Dataset
df <- read.csv('data.csv')
head(df)
str(df)

# ANOVA & Assumption Testing & Fisher LSD
library(agricolae)
library(doebioresearch)
library(AgroR)

DBC(df$gen, df$col, df$yield, mcomp = 'lsd')

