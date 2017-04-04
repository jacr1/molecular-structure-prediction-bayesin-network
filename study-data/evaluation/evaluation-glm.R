library(lubridate)
library(car)

data = read.csv("final-data.csv", sep=",", head=TRUE)
data$time_taken <- period_to_seconds(hms(data$time_taken))
data$prediction_type <- as.factor(data$prediction_type)
data$user_structure <- as.factor(data$user_structure)
data$smiles_length <- nchar(as.character(data$smiles))
data$time_taken <- data$time_taken + 0.000001
# Order by user_id, and smiles
data <- data[order(data$user_id, data$smiles),]

# Shows skew of data to the right hitting that the values are not disrtubted correctly
plot(density(data$time_taken))
#####################################################
# First Model
par(mfrow=c(2,2))
glm <- glm(formula = data$time_taken~data$predictions_used + data$prediction_type + data$smiles_length + data$rubs + data$undos + data$user_structure, 
           family="Gamma")
summary(glm)
plot(glm)
Anova(glm)

#####################################################
# Second Model
glm <- glm(formula = data$time_taken~data$predictions_used + data$smiles_length + data$rubs + data$undos, 
           family="Gamma")
summary(glm)
plot(glm, pch = 10)
Anova(glm)

