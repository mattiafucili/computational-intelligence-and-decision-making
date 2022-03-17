credit$InstallmentRatePercentage1 <- 0
credit$InstallmentRatePercentage2 <- 0
credit$InstallmentRatePercentage3 <- 0
credit$InstallmentRatePercentage4 <- 0
for(i in 1:length(credit$InstallmentRatePercentage)) {
  if(credit$InstallmentRatePercentage[i] == 1)
    credit$InstallmentRatePercentage1[i] <- 1
  if(credit$InstallmentRatePercentage[i] == 2)
    credit$InstallmentRatePercentage2[i] <- 1
  if(credit$InstallmentRatePercentage[i] == 3)
    credit$InstallmentRatePercentage3[i] <- 1
  if(credit$InstallmentRatePercentage[i] == 4)
    credit$InstallmentRatePercentage4[i] <- 1
}
credit$InstallmentRatePercentage <- NULL

credit$ResidenceDuration1 <- 0
credit$ResidenceDuration2 <- 0
credit$ResidenceDuration3 <- 0
credit$ResidenceDuration4 <- 0
for(i in 1:length(credit$ResidenceDuration)) {
  if(credit$ResidenceDuration[i] == 1)
    credit$ResidenceDuration1[i] <- 1
  if(credit$ResidenceDuration[i] == 2)
    credit$ResidenceDuration2[i] <- 1
  if(credit$ResidenceDuration[i] == 3)
    credit$ResidenceDuration3[i] <- 1
  if(credit$ResidenceDuration[i] == 4)
    credit$ResidenceDuration4[i] <- 1
}
credit$ResidenceDuration <- NULL

credit$NumberExistingCredits1 <- 0
credit$NumberExistingCredits2 <- 0
credit$NumberExistingCredits3 <- 0
credit$NumberExistingCredits4 <- 0
for(i in 1:length(credit$NumberExistingCredits)) {
  if(credit$NumberExistingCredits[i] == 1)
    credit$NumberExistingCredits1[i] <- 1
  if(credit$NumberExistingCredits[i] == 2)
    credit$NumberExistingCredits2[i] <- 1
  if(credit$NumberExistingCredits[i] == 3)
    credit$NumberExistingCredits3[i] <- 1
  if(credit$NumberExistingCredits[i] == 4)
    credit$NumberExistingCredits4[i] <- 1
}
credit$NumberExistingCredits <- NULL

samp_size <- floor(0.1 * nrow(credit))
set.seed(123)
train_ind <- sample(seq_len(nrow(credit)), size = samp_size)
test <- credit[train_ind, ]
train <- credit[-train_ind, ]

write.csv(train, "train_cat.csv")
write.csv(test, "test_cat.csv")