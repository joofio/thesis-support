install.packages("charlatan")
library("charlatan")
x<-fraudster()
x

install.packages("fabricatr")
set.seed(1)
library(fabricatr)
data<-read.csv("data/dataR2 (2).csv")
data
simulated_cancer_data <- fabricate(
  data = data)

simulated_cancer_data

hist(simulated_cancer_data$Age)
hist(data$Age)



set.seed(1234)
install.packages("fakeR")
library(fakeR)
cancer_sim <- as.data.frame(simulate_dataset(data))
cancer_sim
hist(data$Age)
min(data$Age)
hist(cancer_sim$Age)
hist(data$BMI)
min(data$BMI)
hist(cancer_sim$BMI)

hist(data$Glucose)
hist(data$MCP.1)
library(SimMultiCorrData)
calc_theory(data)
# testar





library(sdglinkage)
set.seed(1234)
data$Age<-as.numeric(data$Age) #does not work with int
data$Glucose<-as.numeric(data$Glucose)
data$Classification<-as.factor(data$Classification)
cancer_data <- split_data(data, 70)

bn_evidence <- "Age >=18 & Age<100 & BMI>=18 & Glucose>=50 & MCP.1>0"

bn_learn <- gen_bn_learn(cancer_data$training_set, "hc", bn_evidence)

plot_bn(bn_learn$structure)
head(bn_learn$gen_data)
hist(bn_learn$gen_data$Age)
hist(data$Age)


plot_compared_sdg(target_var = "Glucose", training_set = cancer_data$training_set,
                  syn_data_names = c( "BN_learn"),
                  generated_data1 = bn_learn$gen_data)





library(simPop)
