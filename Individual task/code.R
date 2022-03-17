backup <- mushrooms
mushrooms <- backup # e -> 51%

mushrooms$bruises <- as.factor(ifelse(mushrooms$bruises == "t", 1, 0))
mushrooms$gill.size <- as.factor(ifelse(mushrooms$gill.size == "b", 1, 0))
mushrooms$stalk.shape <- as.factor(ifelse(mushrooms$stalk.shape == "e", 1, 0))
mushrooms$ring.number <- as.factor(ifelse(mushrooms$ring.number == "n", 0,
                          ifelse(mushrooms$ring.number == "o", 1, 2)))

##### Analysis #####
barplot(table(mushrooms$class), xlab = "Class", main = "Class graph", col = "red")
barplot(table(mushrooms$cap.color), xlab = "Cap color", main = "Cap color graph", col = "red")
barplot(table(mushrooms$cap.shape), xlab = "Cap shape", main = "Cap shape graph", col = "red")
barplot(table(mushrooms$cap.surface), xlab = "Cap surface", main = "Cap surface graph", col = "red")
barplot(table(mushrooms$bruises), xlab = "Bruises", main = "Bruises graph", col = "red")
barplot(table(mushrooms$odor), xlab = "Odor", main = "Odor graph", col = "red")
barplot(table(mushrooms$gill.attachment), xlab = "Gill attachment", main = "Gill attachment graph", col = "red")
barplot(table(mushrooms$gill.spacing), xlab = "Gill spacing", main = "Gill spacing graph", col = "red")
barplot(table(mushrooms$gill.size), xlab = "Gill size", main = "Gill size graph", col = "red")
barplot(table(mushrooms$gill.color), xlab = "Gill color", main = "Gill color graph", col = "red")
barplot(table(mushrooms$stalk.color.above.ring), xlab = "Stalk CAR", main = "Stalk color above ring graph", col = "red")
barplot(table(mushrooms$stalk.color.below.ring), xlab = "Stalk CBR", main = "Stalk color below ring graph", col = "red")
barplot(table(mushrooms$stalk.root), xlab = "Stalk root", main = "Stalk root graph", col = "red")
barplot(table(mushrooms$stalk.shape), xlab = "Stalk shape", main = "Stalk shape graph", col = "red")
barplot(table(mushrooms$stalk.surface.above.ring), xlab = "Stalk SAR", main = "Stalk surface above ring graph", col = "red")
barplot(table(mushrooms$stalk.surface.below.ring), xlab = "Stalk SBR", main = "Stalk surface below ring graph", col = "red")
barplot(table(mushrooms$veil.color), xlab = "Veil color", main = "Veil color graph", col = "red")
barplot(table(mushrooms$veil.type), xlab = "Veil type", main = "Veil type graph", col = "red")
barplot(table(mushrooms$ring.number), xlab = "Ring number", main = "Ring number graph", col = "red")
barplot(table(mushrooms$ring.type), xlab = "Ring type", main = "Ring type graph", col = "red")
barplot(table(mushrooms$spore.print.color), xlab = "Spore color", main = "Spore color graph", col = "red")
barplot(table(mushrooms$population), xlab = "Population", main = "Population graph", col = "red")
barplot(table(mushrooms$habitat), xlab = "Habitat", main = "Habitat graph", col = "red")

summary(mushrooms)

mushrooms$veil.type <- NULL

library(FSelector)
info <- information.gain(class ~ ., mushrooms)
info

# Train & Test
samp_size <- floor(0.2 * nrow(mushrooms))
set.seed(123)
train_ind <- sample(seq_len(nrow(mushrooms)), size = samp_size)
test <- mushrooms[train_ind, ]
train <- mushrooms[-train_ind, ]

library(plyr)
count(train$class) # e -> 51%
count(test$class) # e -> 52%

##### TREE #####
library(C50)
fit <- C5.0(class ~ odor + gill.color + stalk.surface.above.ring +  ring.type + spore.print.color,
            data=train, control = C5.0Control(noGlobalPruning = TRUE))
summary(fit)

png("fit.png", res=80, height=6500, width=8000) 
plot(fit) 
dev.off()

result <- predict(fit, test, type="class")
mean(result == test[ , 1])

conf.matrix <- table(test$class, result)
rownames(conf.matrix) <- paste("Actual", rownames(conf.matrix), sep = ":")
colnames(conf.matrix) <- paste("Pred", colnames(conf.matrix), sep = ":")
print(conf.matrix)