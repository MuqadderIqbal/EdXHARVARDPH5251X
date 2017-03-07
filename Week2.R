library(dplyr)
femaleMiceWeights <- read.csv("dagdata/inst/extdata/femaleMiceWeights.csv")
control <- filter(femaleMiceWeights, Diet =="chow" ) %>% select(Bodyweight)%>% unlist()
treatment <- filter(femaleMiceWeights, Diet =="hf" ) %>% select(Bodyweight)%>% unlist()


mean(treatment)
mean(control)
mean(treatment) - mean(control)
#-----------------Random Variables-----------------#
population <- read.csv("dagdata/inst/extdata/femaleControlsPopulation.csv")
class(population)
population <- unlist(population)
class(population)
mean(sample(population, 12))

#-----------------Random Variables Exercises-----------------#
#Ex1:
mean(population)

#Ex2:
set.seed(1)
rnd <- sample(population,5)
abs(mean(rnd) - mean(population))

#Ex3:
set.seed(5)
rnd <- sample(population,5)
abs(mean(rnd) - mean(population))
#----------Null Hypothesis-----------------------------------#

obs <- mean(treatment) - mean(control)

n <- 10000
nulls <- vector("numeric", n)
for(i in 1:n)
{
  control <- sample(population, 12)
  treatment <- sample(population, 12)
  nulls[i] <- mean(treatment) - mean(control)
  
}
mean(abs(nulls) > obs) # p-value


#-----------------Null Hypothesis Exercises-----------------#
#Ex1:
set.seed(1)
cnt <- 1000
nulls2 <- vector("numeric", cnt)
for (j in 1:cnt)
{
  nulls2[j] <- mean(sample(population,5))
  
}
hist(nulls2)
mean(abs(nulls2 - mean(population)) > 1)

#Ex2:
set.seed(1)
cnt <- 10000
nulls3 <- vector("numeric", cnt)
for (j in 1:cnt)
{
  nulls3[j] <- mean(sample(population,5))
  
}
hist(nulls3)
mean(abs(nulls3 - mean(population)) > 1)


#Ex3:
set.seed(1)
cnt <- 1000
nulls4 <- vector("numeric", cnt)
for (j in 1:cnt)
{
  nulls4[j] <- mean(sample(population,50))
  
}
hist(nulls4)
mean(abs(nulls4 - mean(population)) > 1)
#-----------Probability Distributions/Exercises--------------------#
install.packages("gapminder")
library(gapminder)
data(gapminder)
head(gapminder)

x<- filter(gapminder, year == "1952")%>% select(lifeExp)
class(x)
x <- unlist(x)

#Ex1:
mean(x <= 40)

#Ex2:
mean(x <= 60) - mean(x <= 40)

#SAPPLY function equivalent
prop = function(q) 
{
  mean(x <= q)
}

prop(40)
qs = seq(from=min(x), to=max(x), length=20)
props = sapply(qs, prop)
plot(qs, props)
# props = sapply(qs, function(q) mean(x <= q))
plot(ecdf(x))
