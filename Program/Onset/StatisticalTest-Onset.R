###StatisticalTest####
##Strategy a one-year Onset sample##
i = 1
set.seed(i)

filename <- paste("E:\\Conflict\\Tables\\Samples-Revisedversion-Third\\2000_",i,"_StrategyA_12M_Onset_OneYear_samples.csv",sep="")
Alldata <- read.csv(filename,header=T,encoding="utf-8")  
tempdata <- subset(Alldata, select = -Mask)

library(car)
lm1 <- lm(Risk ~ ., data = tempdata)
temp<-summary(lm1)
filename <- paste("E:\\Conflict\\Tables\\StatisticalTest\\Revisedversion-Third\\StrategyA-OneYear-12M-Onset-LM-",i,".csv",sep="")
write.csv(temp$coefficients, file=filename)

vif(lm1)
filename <- paste("E:\\Conflict\\Tables\\StatisticalTest\\Revisedversion-Third\\StrategyA-OneYear-12M-Onset-Multicollinearity-",i,".csv",sep="")
write.csv(vif(lm1), file=filename)

tempdata <- subset(tempdata, select = -Risk)  
res <- cor(tempdata)
round(res, 3)

filename <- paste("E:\\Conflict\\Tables\\StatisticalTest\\Revisedversion-Third\\StrategyA-OneYear-12M-Onset-Correlation-",i,".csv",sep="")
write.csv(round(res, 3), file=filename)

##Strategy a+ one-year Onset sample##
i = 1
set.seed(i)

filename <- paste("E:\\Conflict\\Tables\\Samples-Revisedversion-Third\\2000_",i,"_StrategyA_24M_Onset_OneYear_samples.csv",sep="")
Alldata <- read.csv(filename,header=T,encoding="utf-8")  
tempdata <- subset(Alldata, select = -Mask)

library(car)
lm1 <- lm(Risk ~ ., data = tempdata)
temp<-summary(lm1)
filename <- paste("E:\\Conflict\\Tables\\StatisticalTest\\Revisedversion-Third\\StrategyA-OneYear-24M-Onset-LM-",i,".csv",sep="")
write.csv(temp$coefficients, file=filename)

vif(lm1)
filename <- paste("E:\\Conflict\\Tables\\StatisticalTest\\Revisedversion-Third\\StrategyA-OneYear-24M-Onset-Multicollinearity-",i,".csv",sep="")
write.csv(vif(lm1), file=filename)

tempdata <- subset(tempdata, select = -Risk)  
res <- cor(tempdata)
round(res, 3)

filename <- paste("E:\\Conflict\\Tables\\StatisticalTest\\Revisedversion-Third\\StrategyA-OneYear-24M-Onset-Correlation-",i,".csv",sep="")
write.csv(round(res, 3), file=filename)


##Strategy b one-year Onset sample##
i = 1
set.seed(i)

filename <- paste("E:\\Conflict\\Tables\\Samples-Revisedversion-Third\\2000_",i,"_StrategyB_12M_Onset_OneYear_samples.csv",sep="")
Alldata <- read.csv(filename,header=T,encoding="utf-8")  
tempdata <- subset(Alldata, select = -Mask)

library(car)
lm1 <- lm(Risk ~ ., data = tempdata)
temp<-summary(lm1)
filename <- paste("E:\\Conflict\\Tables\\StatisticalTest\\Revisedversion-Third\\StrategyB-OneYear-12M-Onset-LM-",i,".csv",sep="")
write.csv(temp$coefficients, file=filename)

vif(lm1)
filename <- paste("E:\\Conflict\\Tables\\StatisticalTest\\Revisedversion-Third\\StrategyB-OneYear-12M-Onset-Multicollinearity-",i,".csv",sep="")
write.csv(vif(lm1), file=filename)

tempdata <- subset(tempdata, select = -Risk)  
res <- cor(tempdata)
round(res, 3)

filename <- paste("E:\\Conflict\\Tables\\StatisticalTest\\Revisedversion-Third\\StrategyB-OneYear-12M-Onset-Correlation-",i,".csv",sep="")
write.csv(round(res, 3), file=filename)

##Strategy b+ one-year Onset sample##
i = 1
set.seed(i)

filename <- paste("E:\\Conflict\\Tables\\Samples-Revisedversion-Third\\2000_",i,"_StrategyB_24M_Onset_OneYear_samples.csv",sep="")
Alldata <- read.csv(filename,header=T,encoding="utf-8")  
tempdata <- subset(Alldata, select = -Mask)

library(car)
lm1 <- lm(Risk ~ ., data = tempdata)
temp<-summary(lm1)
filename <- paste("E:\\Conflict\\Tables\\StatisticalTest\\Revisedversion-Third\\StrategyB-OneYear-24M-Onset-LM-",i,".csv",sep="")
write.csv(temp$coefficients, file=filename)

vif(lm1)
filename <- paste("E:\\Conflict\\Tables\\StatisticalTest\\Revisedversion-Third\\StrategyB-OneYear-24M-Onset-Multicollinearity-",i,".csv",sep="")
write.csv(vif(lm1), file=filename)

tempdata <- subset(tempdata, select = -Risk)  
res <- cor(tempdata)
round(res, 3)

filename <- paste("E:\\Conflict\\Tables\\StatisticalTest\\Revisedversion-Third\\StrategyB-OneYear-24M-Onset-Correlation-",i,".csv",sep="")
write.csv(round(res, 3), file=filename)


##Strategy a all Onset sample##
i = 1
set.seed(i)

filename <- paste("E:\\Conflict\\Tables\\Samples-Revisedversion-Third\\StrategyA_12M_Onset_OneYear_AllSamples_1.csv",sep="")
Alldata <- read.csv(filename,header=T,encoding="utf-8")  
tempdata <- subset(Alldata, select = -Mask)

library(car)
lm1 <- lm(Risk ~ ., data = tempdata)
temp<-summary(lm1)
filename <- paste("E:\\Conflict\\Tables\\StatisticalTest\\Revisedversion-Third\\StrategyA-All-12M-Onset-LM-",i,".csv",sep="")
write.csv(temp$coefficients, file=filename)

vif(lm1)
filename <- paste("E:\\Conflict\\Tables\\StatisticalTest\\Revisedversion-Third\\StrategyA-All-12M-Onset-Multicollinearity-",i,".csv",sep="")
write.csv(vif(lm1), file=filename)

tempdata <- subset(tempdata, select = -Risk)  
res <- cor(tempdata)
round(res, 3)

filename <- paste("E:\\Conflict\\Tables\\StatisticalTest\\Revisedversion-Third\\StrategyA-All-12M-Onset-Correlation-",i,".csv",sep="")
write.csv(round(res, 3), file=filename)

##Strategy a+ all Onset sample##
i = 1
set.seed(i)

filename <- paste("E:\\Conflict\\Tables\\Samples-Revisedversion-Third\\StrategyA_24M_Onset_OneYear_AllSamples_1.csv",sep="")
Alldata <- read.csv(filename,header=T,encoding="utf-8")  
tempdata <- subset(Alldata, select = -Mask)

library(car)
lm1 <- lm(Risk ~ ., data = tempdata)
temp<-summary(lm1)
filename <- paste("E:\\Conflict\\Tables\\StatisticalTest\\Revisedversion-Third\\StrategyA-All-24M-Onset-LM-",i,".csv",sep="")
write.csv(temp$coefficients, file=filename)

vif(lm1)
filename <- paste("E:\\Conflict\\Tables\\StatisticalTest\\Revisedversion-Third\\StrategyA-All-24M-Onset-Multicollinearity-",i,".csv",sep="")
write.csv(vif(lm1), file=filename)

tempdata <- subset(tempdata, select = -Risk)  
res <- cor(tempdata)
round(res, 3)

filename <- paste("E:\\Conflict\\Tables\\StatisticalTest\\Revisedversion-Third\\StrategyA-All-24M-Onset-Correlation-",i,".csv",sep="")
write.csv(round(res, 3), file=filename)


##Strategy b all Onset sample##
i = 1
set.seed(i)

filename <- paste("E:\\Conflict\\Tables\\Samples-Revisedversion-Third\\StrategyB_12M_Onset_OneYear_AllSamples_1.csv",sep="")
Alldata <- read.csv(filename,header=T,encoding="utf-8")  
tempdata <- subset(Alldata, select = -Mask)

library(car)
lm1 <- lm(Risk ~ ., data = tempdata)
temp<-summary(lm1)
filename <- paste("E:\\Conflict\\Tables\\StatisticalTest\\Revisedversion-Third\\StrategyB-All-12M-Onset-LM-",i,".csv",sep="")
write.csv(temp$coefficients, file=filename)

vif(lm1)
filename <- paste("E:\\Conflict\\Tables\\StatisticalTest\\Revisedversion-Third\\StrategyB-All-12M-Onset-Multicollinearity-",i,".csv",sep="")
write.csv(vif(lm1), file=filename)

tempdata <- subset(tempdata, select = -Risk)  
res <- cor(tempdata)
round(res, 3)

filename <- paste("E:\\Conflict\\Tables\\StatisticalTest\\Revisedversion-Third\\StrategyB-All-12M-Onset-Correlation-",i,".csv",sep="")
write.csv(round(res, 3), file=filename)

##Strategy b+ all Onset sample##
i = 1
set.seed(i)

filename <- paste("E:\\Conflict\\Tables\\Samples-Revisedversion-Third\\StrategyB_24M_Onset_OneYear_AllSamples_1.csv",sep="")
Alldata <- read.csv(filename,header=T,encoding="utf-8")  
tempdata <- subset(Alldata, select = -Mask)

library(car)
lm1 <- lm(Risk ~ ., data = tempdata)
temp<-summary(lm1)
filename <- paste("E:\\Conflict\\Tables\\StatisticalTest\\Revisedversion-Third\\StrategyB-All-24M-Onset-LM-",i,".csv",sep="")
write.csv(temp$coefficients, file=filename)

vif(lm1)
filename <- paste("E:\\Conflict\\Tables\\StatisticalTest\\Revisedversion-Third\\StrategyB-All-24M-Onset-Multicollinearity-",i,".csv",sep="")
write.csv(vif(lm1), file=filename)

tempdata <- subset(tempdata, select = -Risk)  
res <- cor(tempdata)
round(res, 3)

filename <- paste("E:\\Conflict\\Tables\\StatisticalTest\\Revisedversion-Third\\StrategyB-All-24M-Onset-Correlation-",i,".csv",sep="")
write.csv(round(res, 3), file=filename)
