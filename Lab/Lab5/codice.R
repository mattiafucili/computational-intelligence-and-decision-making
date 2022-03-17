backup <- credit
credit <- backup

##### Preprocess #####
credit$CheckingAccountStatus.lt.0 <- as.factor(credit$CheckingAccountStatus.lt.0)
credit$CreditHistory.NoCredit.AllPaid <- as.factor(credit$CreditHistory.NoCredit.AllPaid)

##### Discretized dataset #####
library(funModeling)
library(dplyr)
discretized_credit <- discretize_df(data = credit, data_bins = discretize_get_bins(data = credit, input = c("Duration", "Amount", "Age"), n_bins = 10), stringsAsFactors = T)

##### Training and test set #####
samp_size <- floor(0.1 * nrow(discretized_credit))
set.seed(123)
train_ind <- sample(seq_len(nrow(discretized_credit)), size = samp_size)
test <- discretized_credit[train_ind, ]
train <- discretized_credit[-train_ind, ]

##### 1 #####
library(plyr)
library(mlbench)
library(e1071)
model <- naiveBayes(Class ~ CheckingAccountStatus.lt.0 + CreditHistory.NoCredit.AllPaid + Duration + 
                    Amount, data = train)

model$apriori

##### 2 #####
model$tables

##### 3 #####
model_duration <- naiveBayes(Class ~ Duration, data = train)
pred_duration <- predict(model_duration, test, type = "class")
pred_duration
conf_matrix_duration <- table(pred_duration, test$Class)
conf_matrix_duration

model_amount <- naiveBayes(Class ~ Amount, data = train)
pred_amount <- predict(model_amount, test, type = "raw")
pred_amount
conf_matrix_amount <- table(pred_amount, test$Class)
conf_matrix_amount

model_check <- naiveBayes(Class ~ CheckingAccountStatus.lt.0, data = train)
pred_check <- predict(model_check, test, type = "class")
pred_check
conf_matrix_check <- table(pred_check, test$Class)
conf_matrix_check

model_cred <- naiveBayes(Class ~ CreditHistory.NoCredit.AllPaid, data = train)
pred_cred <- predict(model_cred, test, type = "raw")
pred_cred
conf_matrix_cred <- table(pred_cred, test$Class)
conf_matrix_cred

##### 4 #####
model_4 <- naiveBayes(Class ~ CreditHistory.NoCredit.AllPaid + CheckingAccountStatus.lt.0,
                      data = train)
pred_4 <- predict(model_4, test, type = "class")
pred_4_prob <- ifelse(pred_4 == "Good", 1, 0)
conf_matrix_4 <- table(pred_4, test$Class)
conf_matrix_4

##### 5 #####
model_5 <- naiveBayes(Class ~ Duration + Amount, data = train)
pred_5 <- predict(model_5, test, type = "class")
pred_5_prob <- ifelse(pred_5 == "Good", 1, 0)
conf_matrix_5 <- table(pred_5, test$Class)
conf_matrix_5

##### 6 #####
pred_6 <- predict(model, test, type = "class")
pred_6_prob <- ifelse(pred_6 == "Good", 1, 0)
conf_matrix_6 <- table(pred_6, test$Class)
conf_matrix_6

##### 7 #####
precision <- function(conf_matrix) {
  conf_matrix[4] / (conf_matrix[4] + conf_matrix[3])
}

recall <- function(conf_matrix) {
  conf_matrix[4] / (conf_matrix[4] + conf_matrix[2])
}

f1 <- function(conf_matrix) {
  precision <- precision(conf_matrix)
  recall <- recall(conf_matrix)
  2 * (precision * recall) / (precision + recall)
}

print(f1(conf_matrix_4))
print(f1(conf_matrix_5))
print(f1(conf_matrix_6))

##### 8 #####
library(pROC)
test_prob <- ifelse(test$Class == "Good", 1, 0)

roc_4 <- roc(pred_4_prob, test_prob)
plot.roc(roc_4)
auc(pred_4_prob, test_prob)

roc_5 <- roc(pred_5_prob, test_prob)
plot.roc(roc_5)
auc(pred_5_prob, test_prob)

roc_6 <- roc(pred_6_prob, test_prob)
plot.roc(roc_6)
auc(pred_6_prob, test_prob)

library(lift)
plotLift(pred_4_prob, test_prob)
plotLift(pred_5_prob, test_prob)
plotLift(pred_6_prob, test_prob)