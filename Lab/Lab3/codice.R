# Training and test set
samp_size <- floor(0.1 * nrow(credit))
set.seed(123)
train_ind <- sample(seq_len(nrow(credit)), size = samp_size)
test <- credit[train_ind, ]
train <- credit[-train_ind, ]

library(plyr)
prop_train <- count(train$Class)["freq"]
prop_test <- count(test$Class)["freq"]
prop_train
prop_test

# KNN
library(kknn)
kknn <- kknn(Class ~ Age + Amount + Duration, train, test, k = 1, distance = 2, "optimal")
summary(kknn)
mean(kknn[[1]] == test[, 11])
conf.matrix <- table(test$Class, kknn[[1]])
rownames(conf.matrix) <- paste("Actual", rownames(conf.matrix), sep = ":")
colnames(conf.matrix) <- paste("Pred", colnames(conf.matrix), sep = ":")
print(conf.matrix)