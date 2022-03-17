#CREATE A TRAINING SET AND A TEST SET
data(credit)
# 90% of the sample size
smp_size <- floor(0.9 * nrow(credit))
# set the seed to make your partition reproductible
set.seed(123)
train_ind <- sample(seq_len(nrow(credit)), size = smp_size)

train <- credit[train_ind, ]
test <- credit[-train_ind, ]

library(plyr)
count(train$Class)
count(test$Class)

#CHECK PROPORTION
proportion <- function(dataset){
  x <- 0
  y <- 0
  tot <- 0
  for(i in 1:length(dataset$Class)){
    if(dataset$Class[i] == "Bad"){
      x <- x + 1
    }else{
      y <- y + 1
    }
  }
  
  percBad <- x * 100 / length(dataset$Class)
  percGood <- y * 100 / length(dataset$Class)
  print(percBad)
  print(percGood)
}

proportion(train)
proportion(test)

#CREATE THE TREE AND APPLY IT TO THE TEST SET PT.1
library(rpart)

fit <- rpart(Class ~ Age + Amount + Duration + InstallmentRatePercentage + ResidenceDuration + NumberExistingCredits, data=train)

printcp(fit)
plotcp(fit)
summary(fit)

plot(fit, uniform=TRUE, main="Classification Tree for Credit", asp = 2)
text(fit, use.n=TRUE, all=TRUE, cex=.8)

library(rpart.plot)
prp(fit, type = 2, faclen = 0, cex = 0.8, extra = 1)

result <- predict(fit, test, type="class")
mean(result == test[ , 11])

conf.matrix <- table(test$Class, result)
rownames(conf.matrix) <- paste("Actual", rownames(conf.matrix), sep = ":")
colnames(conf.matrix) <- paste("Pred", colnames(conf.matrix), sep = ":")
print(conf.matrix)

#CREATE THE TREE AND APPLY IT TO THE TEST SET PT.2
library(RWeka)

fit <- J48(Class ~ Age + Amount + Duration + InstallmentRatePercentage + ResidenceDuration + NumberExistingCredits + EmployedWithBonds + CheckingAccountStatus, data=train)
sink("result1.txt")
print(fit)
sink()

printcp(fit)
plotcp(fit)
summary(fit)

plot(fit, uniform=TRUE, main="Classification Tree for Credit", asp = 2)
text(fit, use.n=TRUE, all=TRUE, cex=.8)

library(rpart.plot)
prp(fit, type = 2, faclen = 0, cex = 0.8, extra = 1)

result <- predict(fit, test, type="class")
mean(result == test[ , 11])

conf.matrix <- table(test$Class, result)
rownames(conf.matrix) <- paste("Actual", rownames(conf.matrix), sep = ":")
colnames(conf.matrix) <- paste("Pred", colnames(conf.matrix), sep = ":")
print(conf.matrix)

#CREATE THE TREE AND APPLY IT TO THE TEST SET PT.3
library(rpart)

fit <- rpart(Class ~ ., data=train)

printcp(fit)
plotcp(fit)
summary(fit)

plot(fit, uniform=TRUE, main="Classification Tree for Credit", asp = 2)
text(fit, use.n=TRUE, all=TRUE, cex=.8)

library(rpart.plot)
prp(fit, type = 2, faclen = 0, cex = 0.8, extra = 1, uniform = TRUE)

result <- predict(fit, test, type="class")
mean(result == test[ , 11])

conf.matrix <- table(test$Class, result)
rownames(conf.matrix) <- paste("Actual", rownames(conf.matrix), sep = ":")
colnames(conf.matrix) <- paste("Pred", colnames(conf.matrix), sep = ":")
print(conf.matrix)

#PRUNING
library(rpart)

fit <- rpart(Class ~ ., data=train)
pfit<- prune(fit, cp=0.026217)

printcp(pfit)
plotcp(pfit)
summary(pfit)

plot(pfit, uniform=TRUE, main="Pruned Classification Tree for Credit")
text(pfit, use.n=TRUE, all=TRUE, cex=.8)

library(rpart.plot)
prp(fit, type = 2, faclen = 0, cex = 0.8, extra = 1, uniform = TRUE)

result <- predict(pfit, test, type="class")
mean(result == test[ , 11])
print(result)
conf.matrix <- table(test$Class, result)
rownames(conf.matrix) <- paste("Actual", rownames(conf.matrix), sep = ":")
colnames(conf.matrix) <- paste("Pred", colnames(conf.matrix), sep = ":")
print(conf.matrix)