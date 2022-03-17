# Histograms
barplot(table(data$Class), col = "red", main = "Class graph")
barplot(table(credit$NumberPeopleMaintenance), xlab = "NumberPeopleMaintenance", main = "NumberPeopleMaintenance graph", col = "red")
barplot(table(credit$ForeignWorker), xlab = "ForeignWorker", main = "ForeignWorker graph", col = "red")
barplot(table(credit$CheckingAccountStatus.lt.0), xlab = "CheckingAccountStatus.lt.0", main = "CheckingAccountStatus.lt.0 graph", col = "red")
barplot(table(credit$CheckingAccountStatus.0.to.200), xlab = "CheckingAccountStatus.0.to.200", main = "CheckingAccountStatus.0.to.200 graph", col = "red")
barplot(table(credit$CheckingAccountStatus.gt.200), xlab = "CheckingAccountStatus.gt.200", main = "CheckingAccountStatus.gt.200 graph", col = "red")
barplot(table(credit$CheckingAccountStatus.none), xlab = "CheckingAccountStatus.none", main = "CheckingAccountStatus.none graph", col = "red")
barplot(table(credit$CreditHistory.NoCredit.AllPaid), xlab = "CreditHistory.NoCredit.AllPaid", main = "CreditHistory.NoCredit.AllPaid graph", col = "red")
barplot(table(credit$CreditHistory.ThisBank.AllPaid), xlab = "CreditHistory.ThisBank.AllPaid", main = "CreditHistory.ThisBank.AllPaid graph", col = "red")
barplot(table(credit$CreditHistory.PaidDuly), xlab = "CreditHistory.PaidDuly", main = "CreditHistory.PaidDuly graph", col = "red")
barplot(table(credit$CreditHistory.Delay), xlab = "CreditHistory.Delay", main = "CreditHistory.Delay graph", col = "red")
barplot(table(credit$CreditHistory.Critical), xlab = "CreditHistory.Critical", main = "CreditHistory.Critical graph", col = "red")
barplot(table(credit$Purpose.NewCar), xlab = "Purpose.NewCar", main = "Purpose.NewCar graph", col = "red")
barplot(table(credit$Purpose.UsedCar), xlab = "Purpose.UsedCar", main = "Purpose.UsedCar graph", col = "red")
barplot(table(credit$Purpose.Furniture.Equipment), xlab = "Purpose.Furniture.Equipment", main = "Purpose.Furniture.Equipment graph", col = "red")
barplot(table(credit$Purpose.Radio.Television), xlab = "Purpose.Radio.Television", main = "Purpose.Radio.Television graph", col = "red")
barplot(table(credit$Purpose.DomesticAppliance), xlab = "Purpose.DomesticAppliance", main = "Purpose.DomesticAppliance graph", col = "red")
barplot(table(credit$Purpose.Repairs), xlab = "Purpose.Repairs", main = "Purpose.Repairs graph", col = "red")
barplot(table(credit$Purpose.Education), xlab = "Purpose.Education", main = "Purpose.Education graph", col = "red")
barplot(table(credit$Purpose.Vacation), xlab = "Purpose.Vacation", main = "Purpose.Vacation graph", col = "red")
barplot(table(credit$Purpose.Retraining), xlab = "Purpose.Retraining", main = "Purpose.Retraining graph", col = "red")
barplot(table(credit$Purpose.Business), xlab = "Purpose.Business", main = "Purpose.Business graph", col = "red")
barplot(table(credit$Purpose.Other), xlab = "Purpose.Other", main = "Purpose.Other graph", col = "red")
barplot(table(credit$SavingsAccountBonds.lt.100), xlab = "SavingsAccountBonds.lt.100", main = "SavingsAccountBonds.lt.100 graph", col = "red")
barplot(table(credit$SavingsAccountBonds.100.to.500), xlab = "SavingsAccountBonds.100.to.500", main = "SavingsAccountBonds.100.to.500 graph", col = "red")
barplot(table(credit$SavingsAccountBonds.500.to.1000), xlab = "SavingsAccountBonds.500.to.1000", main = "SavingsAccountBonds.500.to.1000 graph", col = "red")
barplot(table(credit$SavingsAccountBonds.gt.1000), xlab = "SavingsAccountBonds.gt.1000", main = "SavingsAccountBonds.gt.1000 graph", col = "red")
barplot(table(credit$SavingsAccountBonds.Unknown), xlab = "SavingsAccountBonds.Unknown", main = "SavingsAccountBonds.Unknown graph", col = "red")
barplot(table(credit$EmploymentDuration.lt.1), xlab = "EmploymentDuration.lt.1", main = "EmploymentDuration.lt.1 graph", col = "red")
barplot(table(credit$EmploymentDuration.1.to.4), xlab = "EmploymentDuration.1.to.4", main = "EmploymentDuration.1.to.4 graph", col = "red")
barplot(table(credit$EmploymentDuration.4.to.7), xlab = "EmploymentDuration.4.to.7", main = "EmploymentDuration.4.to.7 graph", col = "red")
barplot(table(credit$EmploymentDuration.gt.7), xlab = "EmploymentDuration.gt.7", main = "EmploymentDuration.gt.7 graph", col = "red")
barplot(table(credit$EmploymentDuration.Unemployed), xlab = "EmploymentDuration.Unemployed", main = "EmploymentDuration.Unemployed graph", col = "red")
barplot(table(credit$Personal.Female.NotSingle), xlab = "Personal.Female.NotSingle", main = "Personal.Female.NotSingle graph", col = "red")
barplot(table(credit$Personal.Male.Single), xlab = "Personal.Male.Single", main = "Personal.Male.Single graph", col = "red")
barplot(table(credit$Personal.Male.Married.Widowed), xlab = "Personal.Male.Married.Widowed", main = "Personal.Male.Married.Widowed graph", col = "red")
barplot(table(credit$Personal.Female.Single), xlab = "Personal.Female.Single", main = "Personal.Female.Single graph", col = "red")
barplot(table(credit$Personal.Male.Divorced.Seperated), xlab = "Personal.Male.Divorced.Seperated", main = "Personal.Male.Divorced.Seperated graph", col = "red")
barplot(table(credit$OtherDebtorsGuarantors.None), xlab = "OtherDebtorsGuarantors.None", main = "OtherDebtorsGuarantors.None graph", col = "red")
barplot(table(credit$OtherDebtorsGuarantors.CoApplicant), xlab = "OtherDebtorsGuarantors.CoApplicant", main = "OtherDebtorsGuarantors.CoApplicant graph", col = "red")
barplot(table(credit$OtherDebtorsGuarantors.Guarantor), xlab = "OtherDebtorsGuarantors.Guarantor", main = "OtherDebtorsGuarantors.Guarantor graph", col = "red")
barplot(table(credit$Property.RealEstate), xlab = "Property.RealEstate", main = "Property.RealEstate graph", col = "red")
barplot(table(credit$Property.Insurance), xlab = "Property.Insurance", main = "Property.Insurance graph", col = "red")
barplot(table(credit$Property.CarOther), xlab = "Property.CarOther", main = "Property.CarOther graph", col = "red")
barplot(table(credit$Property.Unknown), xlab = "Property.Unknown", main = "Property.Unknown graph", col = "red")
barplot(table(credit$OtherInstallmentPlans.Bank), xlab = "OtherInstallmentPlans.Bank", main = "OtherInstallmentPlans.Bank graph", col = "red")
barplot(table(credit$OtherInstallmentPlans.Stores), xlab = "OtherInstallmentPlans.Stores", main = "OtherInstallmentPlans.Stores graph", col = "red")
barplot(table(credit$OtherInstallmentPlans.None), xlab = "OtherInstallmentPlans.None", main = "OtherInstallmentPlans.None graph", col = "red")
barplot(table(credit$Housing.Rent), xlab = "Housing.Rent", main = "Housing.Rent graph", col = "red")
barplot(table(credit$Housing.Own), xlab = "Housing.Own", main = "Housing.Own graph", col = "red")
barplot(table(credit$Housing.ForFree), xlab = "Housing.ForFree", main = "Housing.ForFree graph", col = "red")
barplot(table(credit$Job.UnemployedUnskilled), xlab = "Job.UnemployedUnskilled", main = "Job.UnemployedUnskilled graph", col = "red")
barplot(table(credit$Job.UnskilledResident), xlab = "Job.UnskilledResident", main = "Job.UnskilledResident graph", col = "red")
barplot(table(credit$Job.SkilledEmployee), xlab = "Job.SkilledEmployee", main = "Job.SkilledEmployee graph", col = "red")
barplot(table(credit$Job.Management.SelfEmp.HighlyQualified), xlab = "Job.Management.SelfEmp.HighlyQualified", main = "Job.Management.SelfEmp.HighlyQualified graph", col = "red")
barplot(table(credit$InstallmentRatePercentage), xlab = "InstallmentRatePercentage", main = "InstallmentRatePercentage graph", col = "red")
barplot(table(credit$NumberExistingCredits), xlab = "NumberExistingCredits", main = "NumberExistingCredits graph", col = "red")
barplot(table(credit$ResidenceDuration), xlab = "ResidenceDuration", main = "ResidenceDuration graph", col = "red")
barplot(table(credit$Telephone), xlab = "Telephone", main = "Telephone graph", col = "red")
barplot(table(credit$Age), xlab = "Age", main = "Age graph", col = "red")
barplot(table(credit$Amount), xlab = "Amount", main = "Amount graph", col = "red")
barplot(table(credit$Duration), xlab = "Duration", main = "Duration graph", col = "red")


# Count
library(plyr)
sum(count(data$InstallmentRatePercentage)["freq"])
sum(count(data$ResidenceDuration)["freq"])
sum(count(data$NumberExistingCredits)["freq"])
sum(count(data$Class)["freq"])
sum(count(data$Duration)["freq"])
sum(count(data$Amount)["freq"])
sum(count(data$Age)["freq"])

# % Missing values
missing_value <- function(ogg) {
  x = 0
  for(i in 1:length(ogg)) {
    t <- is.na(ogg[i])
    if(t == TRUE)
      x <- x + 1
  }
  x
}

all_column <- function(ogg) {
  x = 0
  for(i in colnames(data)) {
    res <- missing_value(data[i])
    if(res > 0)
      x <- x + 1
  }
  x
}

res <- all_column(data)
res

result_install <- missing_value(data$InstallmentRatePercentage)
result_install
result_residence <- missing_value(data$ResidenceDuration)
result_residence
result_number <- missing_value(data$NumberExistingCredits)
result_number
result_class <- missing_value(data$Class)
result_class
result_duration <- missing_value(data$Duration)
result_duration
result_amount <- missing_value(data$Amount)
result_amount
result_age <- missing_value(data$Age)
result_age
result_number_people <- missing_value(data$NumberPeopleMaintenance)
result_number_people
result_foreign <- missing_value(data$ForeignWorker)
result_foreign
result_telephone <- missing_value(data$Telephone)
result_telephone
result_checking0 <- missing_value(data$CheckingAccountStatus.lt.0)
result_checking0
result_checking200 <- missing_value(data$CheckingAccountStatus.0.to.200)
result_checking200
result_checking201 <- missing_value(data$CheckingAccountStatus.gt.200)
result_checking201
result_checking_none <- missing_value(data$CheckingAccountStatus.0.to.200)
result_checking_none

# Cardinality
library(plyr)
sum(count(unique(data$InstallmentRatePercentage))["freq"])
sum(count(unique(data$ResidenceDuration))["freq"])
sum(count(unique(data$NumberExistingCredits))["freq"])
sum(count(unique(data$Class))["freq"])
sum(count(unique(data$Duration))["freq"])
sum(count(unique(data$Amount))["freq"])
sum(count(unique(data$Age))["freq"])

# Summary
summary(data$InstallmentRatePercentage)
summary(data$ResidenceDuration)
summary(data$NumberExistingCredits)
summary(data$Class)
summary(data$Duration)
summary(data$Amount)
summary(data$Age)

# Standard deviation
sd(data$Duration)
sd(data$Amount)
sd(data$Age)

# Mode
my_mode <- function(x) {
  u <- unique(x)
  u[which.max(tabulate(match(x, u)))]
}
mode_install <- my_mode(data$InstallmentRatePercentage)
mode_install
mode_residence <- my_mode(data$ResidenceDuration)
mode_residence
mode_number <- my_mode(data$NumberExistingCredits)
mode_number
mode_class <- my_mode(data$Class)
mode_class

# Mode Frequency
library(plyr)
max(count(data$InstallmentRatePercentage)["freq"])
max(count(data$ResidenceDuration)["freq"])
max(count(data$NumberExistingCredits)["freq"])
max(count(data$Class)["freq"])

# 2nd Mode Frequency
library(plyr)
count(data$InstallmentRatePercentage)
count(data$ResidenceDuration)
count(data$NumberExistingCredits)
count(data$Class)

# Remove outliers
data2 <- data
# Duration
q1 <- quantile(data$Duration, 0.25)
q3 <- quantile(data$Duration, 0.75)
mean <- mean(data$Duration)
for(j in 1:length(data$Duration)) {
  if(data$Duration[j] > (q3 + 1.5 * IQR(data$Duration)) || data$Duration[j] < (q1 - 1.5 * IQR(data$Duration))) {
    data2$Duration[j] <- NA
  }
}
# Age
q1 <- quantile(data$Age, 0.25)
q3 <- quantile(data$Age, 0.75)
mean <- mean(data$Age)
for(j in 1:length(data$Age)) {
  if(data$Age[j] > (q3 + 1.5 * IQR(data$Age)) || data$Age[j] < (q1 - 1.5 * IQR(data$Age))) {
    data2$Age[j] <- NA
  }
}
# Amount
q1 <- quantile(data$Amount, 0.25)
q3 <- quantile(data$Amount, 0.75)
mean <- mean(data$Amount)
for(j in 1:length(data$Amount)) {
  if(data$Amount[j] > (q3 + 1.5 * IQR(data$Amount)) || data$Amount[j] < (q1 - 1.5 * IQR(data$Amount))) {
    data2$Amount[j] <- NA
  }
}

# Scatter plot
pairs(~Duration+Age+Amount, data = data, main = "Scatter plot")

# Covariance
cov(data$Duration, data$Duration)
cov(data$Duration, data$Amount)
cov(data$Duration, data$Age)

cov(data$Amount, data$Duration)
cov(data$Amount, data$Amount)
cov(data$Amount, data$Age)

cov(data$Age, data$Duration)
cov(data$Age, data$Amount)
cov(data$Age, data$Age)

#Correlation
cor(data$Duration, data$Duration)
cor(data$Duration, data$Amount)
cor(data$Duration, data$Age)

cor(data$Amount, data$Duration)
cor(data$Amount, data$Amount)
cor(data$Amount, data$Age)

cor(data$Age, data$Duration)
cor(data$Age, data$Amount)
cor(data$Age, data$Age)

# Graph
unempl <- subset(credit, EmploymentDuration.Unemployed > 0)
empl <- subset(credit, EmploymentDuration.Unemployed < 1)
barplot(table(unempl$NumberExistingCredits), col = "red", main = "Unemployed")
barplot(table(empl$NumberExistingCredits), col = "red", main = "Employed")
#
count(data$EmploymentDuration.lt.1)
count(data$EmploymentDuration.1.to.4)
count(data$EmploymentDuration.4.to.7)
count(data$EmploymentDuration.gt.7)
count(data$EmploymentDuration.Unemployed)
#

# Linearity
plot(data2$Amount, data2$Duration, xlab = "Amount", ylab = "Duration")
abline(lm(data2$Duration ~ data2$Amount), col = "red")
plot(data2$Age, data2$Duration, xlab = "Age", ylab = "Duration")
abline(lm(data2$Duration ~ data2$Age), col = "red")
plot(data2$Amount, data2$Age, xlab = "Amount", ylab = "Age")
abline(lm(data2$Age ~ data2$Amount), col = "red")