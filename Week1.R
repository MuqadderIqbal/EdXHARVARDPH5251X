
femaleMiceWeights <- read.csv("C:/STUFF/Learning/EdX/HarvardX-PH5251x/dagdata/inst/extdata/femaleMiceWeights.csv")
femaleMiceWeights[12,2]
weights <- femaleMiceWeights$Bodyweight
weights[11]
length(weights)
mean(weights[13:24])
mean(femaleMiceWeights[13:24,2])
#rm(mydata)


set.seed(1)
i = sample(13:24, 1)
weights[i]


library(dplyr)
controls <-filter(femaleMiceWeights, Diet == "chow")
View(controls)
controls <- select(controls, Bodyweight)
unlist(controls)


controls <- filter(femaleMiceWeights, Diet == "chow")%>% select(Bodyweight) %>% unlist
controls

#*************Dplyr exercises************#
msleep <-read.csv("C:/STUFF/Learning/EdX/HarvardX-PH5251x/dagdata/inst/extdata/msleep_ggplot2.csv")
class(msleep)
primates <- filter(msleep, order == "Primates")
nrow(primates)
class(primates)
primatesleep <- filter(msleep, order == "Primates") %>% select(sleep_total)
class(primatesleep)
primatesleep <- unlist(primatesleep)
mean(primatesleep)
