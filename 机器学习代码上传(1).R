library(caret)
library(randomForest)
library(pROC)
library(openxlsx)
library(compositions)

## Load data
data <- read.xlsx("data.xlsx", rowNames = TRUE)
meta <- read.xlsx("metadata.xlsx", rowNames = TRUE)

## Add label
data$Group <- factor(meta$Group, levels = c("HC", "MDD"))

## CLR transform（和你前面一致）
features <- setdiff(colnames(data), "Group")
clr_data <- clr(data[, features] + 1e-6)
data <- data.frame(Group = data$Group, clr_data)

## CV setting
ctrl <- trainControl(method = "cv", number = 5,
                     classProbs = TRUE,
                     summaryFunction = twoClassSummary)

## Repeat training
set.seed(123)
n_repeat <- 20
auc_values <- numeric(n_repeat)

for (i in 1:n_repeat) {
  
  idx <- createDataPartition(data$Group, p = 0.7, list = FALSE)
  
  train_data <- data[idx, ]
  test_data  <- data[-idx, ]
  
  model <- train(Group ~ ., data = train_data,
                 method = "rf",
                 trControl = ctrl,
                 metric = "ROC",
                 tuneLength = 10)
  
  prob <- predict(model, test_data, type = "prob")[, "MDD"]
  auc_values[i] <- auc(roc(test_data$Group, prob))
}

## Results
mean_auc <- mean(auc_values)
ci_auc <- quantile(auc_values, c(0.025, 0.975))

mean_auc
ci_auc