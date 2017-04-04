install.packages(ROCR)
library (ROCR);

data = read.csv("final-data.csv", sep=",", head=TRUE)
data$prediction_type <- as.factor(data$prediction_type)
data$right_structure_drawn <- apply(data, 1, function(x) x["smiles"] == x["smiles_drawn"])

pred_used <- data[data$predictions_used > 0, ]
not_pred_used <- data[data$predictions_used <= 0, ]

pred_used_correct = nrow(pred_used[pred_used$right_structure_drawn == TRUE,])
not_pred_used_correct = nrow(not_pred_used[not_pred_used$right_structure_drawn == TRUE,])

cat("predictions used:", pred_used_correct,"out of", nrow(pred_used), "correct")
cat("predictions not used:", not_pred_used_correct,"out of", nrow(not_pred_used), "correct") 

result <- t.test(x=not_pred_used$right_structure_drawn, y=pred_used$right_structure_drawn)
result
