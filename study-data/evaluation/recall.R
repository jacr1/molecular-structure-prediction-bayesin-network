install.packages(ROCR)
library (ROCR);

data = read.csv("final-data-python.csv", sep=",", head=TRUE)
data$prediction_type <- as.factor(data$prediction_type)
data$correctly_drawn <- as.logical(data$correctly_drawn)


pred_used <- data[data$predictions_used > 0, ]
not_pred_used <- data[data$predictions_used <= 0, ]

pred_used_correct = nrow(pred_used[pred_used$correctly_drawn == TRUE,])
not_pred_used_correct = nrow(not_pred_used[not_pred_used$correctly_drawn == TRUE,])

cat("predictions used:", pred_used_correct,"out of", nrow(pred_used), "correct")
cat("predictions not used:", not_pred_used_correct,"out of", nrow(not_pred_used), "correct") 

result <- t.test(x=not_pred_used$correctly_drawn, y=pred_used$correctly_drawn)