backup <- credit
credit <- backup

m <- min(credit$Age, na.rm = TRUE)
M <- max(credit$Age, na.rm = TRUE)
for(i in 1:length(credit$Age)){
  credit$Age[i] <- (2 * (credit$Age[i] - m) / (M - m)) - 1
}

m <- min(credit$Duration, na.rm = TRUE)
M <- max(credit$Duration, na.rm = TRUE)
for(i in 1:length(credit$Duration)){
  credit$Duration[i] <- (2 * (credit$Duration[i] - m) / (M - m)) - 1
}

m <- min(credit$Amount, na.rm = TRUE)
M <- max(credit$Amount, na.rm = TRUE)
for(i in 1:length(credit$Amount)){
  credit$Amount[i] <- (2 * (credit$Amount[i] - m) / (M - m)) - 1
}

credit["inst1"] <- 0
credit["inst2"] <- 0
credit["inst3"] <- 0
credit["inst4"] <- 0
for(i in 1:length(credit$InstallmentRatePercentage)) {
  if(credit$InstallmentRatePercentage[i] == 1)
    credit$inst1[i] = 1
  if(credit$InstallmentRatePercentage[i] == 2)
    credit$inst2[i] = 1
  if(credit$InstallmentRatePercentage[i] == 3)
    credit$inst3[i] = 1
  if(credit$InstallmentRatePercentage[i] == 4)
    credit$inst4[i] = 1
}

credit["res1"] <- 0
credit["res2"] <- 0
credit["res3"] <- 0
credit["res4"] <- 0
for(i in 1:length(credit$ResidenceDuration)) {
  if(credit$ResidenceDuration[i] == 1)
    credit$res1[i] = 1
  if(credit$ResidenceDuration[i] == 2)
    credit$res2[i] = 1
  if(credit$ResidenceDuration[i] == 3)
    credit$res3[i] = 1
  if(credit$ResidenceDuration[i] == 4)
    credit$res4[i] = 1
}

credit["num1"] <- 0
credit["num2"] <- 0
credit["num3"] <- 0
credit["num4"] <- 0
for(i in 1:length(credit$NumberExistingCredits)) {
  if(credit$NumberExistingCredits[i] == 1)
    credit$num1[i] = 1
  if(credit$NumberExistingCredits[i] == 2)
    credit$num2[i] = 1
  if(credit$NumberExistingCredits[i] == 3)
    credit$num3[i] = 1
  if(credit$NumberExistingCredits[i] == 4)
    credit$num4[i] = 1
}

credit1 <- credit[sample(nrow(credit)),]
credit2 <- credit[sample(nrow(credit)),]
credit3 <- credit[sample(nrow(credit)),]
credit4 <- credit[sample(nrow(credit)),]

samp_size_1 <- floor(0.1 * nrow(credit1))
set.seed(123)
train_ind_1 <- sample(seq_len(nrow(credit1)), size = samp_size_1)
test_1 <- credit1[train_ind_1, ]
train_1 <- credit1[-train_ind_1, ]

samp_size_2 <- floor(0.1 * nrow(credit2))
set.seed(421)
train_ind_2 <- sample(seq_len(nrow(credit2)), size = samp_size_2)
test_2 <- credit2[train_ind_2, ]
train_2 <- credit2[-train_ind_2, ]

samp_size_3 <- floor(0.1 * nrow(credit3))
set.seed(231)
train_ind_3 <- sample(seq_len(nrow(credit3)), size = samp_size_3)
test_3 <- credit3[train_ind_3, ]
train_3 <- credit3[-train_ind_3, ]

samp_size_4 <- floor(0.1 * nrow(credit4))
set.seed(733)
train_ind_4 <- sample(seq_len(nrow(credit4)), size = samp_size_4)
test_4 <- credit1[train_ind_4, ]
train_4 <- credit1[-train_ind_4, ]

library(ISLR)
library(InformationValue)
##### 3 #####
glm.fit <- glm(Class ~ inst4 + num1 + Age + Amount, data = train_4, family = binomial)
print(glm.fit)

glm.probs <- predict(glm.fit, test_4, type = "response")

threshold_3 = 0.60

conf_3 <- confusionMatrix(test_4$Class, glm.probs, threshold = threshold_3)
conf_3
# misClassError(test$Class, glm.probs, threshold = threshold_3)

##### 4 #####
glm.fit <- glm(Class ~ inst4 + num1 + res4 + res2 + Age + Amount, data = train_4, family = binomial)
print(glm.fit)

glm.probs <- predict(glm.fit, test_4, type = "response")

threshold_4 = 0.59

conf_4 <- confusionMatrix(test_4$Class, glm.probs, threshold = threshold_4)
conf_4
# misClassError(test$Class, glm.probs, threshold = threshold_4)

##### 5 #####
precision <- function(conf_matrix) {
  conf_matrix[1, 1] / (conf_matrix[1, 1] + conf_matrix[1, 2])
}

recall <- function(conf_matrix) {
  conf_matrix[1, 1] / (conf_matrix[1, 1] + conf_matrix[2, 1])
}

f1 <- function(conf_matrix) {
  precision <- precision(conf_matrix)
  recall <- recall(conf_matrix)
  2 * (precision * recall) / (precision + recall)
}

print(f1(conf_4))

test_class <- ifelse(test_4$Class == "Good", 1, 0)
test_prob <- ifelse(glm.probs > threshold_4, 1, 0)
plotROC(test_class, test_prob)





# optCutOff_3 <- optimalCutoff(test$Class, glm.probs)[1]
# optCutOff_3

# library(car)
# scatterplot(Age ~ Duration | Class, data = credit, xlab = "Age", ylab = "inst1")