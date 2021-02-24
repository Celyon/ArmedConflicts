#####Strategy a+ Onset-OneYear sample#####
RI_data <- data.frame(t(c("", "", "")))
names(RI_data) <- c("Modelorder", "Var", "Relative_importance")
for (Modelorder in 1:20) {
  modelname <-
    paste("E:\\Conflict\\Model\\BRT_StrategyA_24M_Onset_OneYear_AllSample_",
          Modelorder,
          ".Rdata",
          sep = "")
  load(modelname)
  tempcontrib <- BRT_model$contributions
  vars <- tempcontrib$var
  temp_predname <- BRT_model$gbm.call$predictor.names
  for (var in 1:nrow(tempcontrib)) {
    tempnum <- vars[var]
    k <- match(vars[var], temp_predname)
    row_data <-
      c(Modelorder, temp_predname[k], tempcontrib[var, 2])
    RI_data <- t(data.frame(t(RI_data), row_data))
  }
}
write.csv(RI_data, file = "E:\\Conflict\\Tables\\Var_RI_StrategyA-24M_Onset_OneYear.csv", row.names = F)

##Calculate 95% CI relative importance of covariates##
data <- read.csv(file="E:\\Conflict\\Tables\\Var_RI_StrategyA-24M_Onset_OneYear.csv",header=TRUE,encoding="utf-8")

RI_data <- data.frame(t(c("","","","","")))
names(RI_data) <- c("Varname","Relative_importance_mean","Relative_importance_sd","Relative_importance_95CI_low","Relative_importance_95CI_top")
for(var in 1:length(temp_predname)){
  tempvarname <- temp_predname[var]
  tempdata <- subset(data,Var == tempvarname)
  temp_relative_importance <- tempdata[,3]
  sd_relative_importance <- sd(temp_relative_importance)
  relative_importance<- t.test(temp_relative_importance)
  relative_importance_conf_int_low <- relative_importance$conf.int[1]
  relative_importance_conf_int_top <- relative_importance$conf.int[2]
  relative_importance_mean <- relative_importance$estimate
  row_data <-
    c(tempvarname, relative_importance_mean, sd_relative_importance,relative_importance_conf_int_low,relative_importance_conf_int_top)
  RI_data <- t(data.frame(t(RI_data), row_data))
}
write.csv(RI_data, file="E:\\Conflict\\Tables\\Var_RI_StrategyA-24M-95CI_Onset_OneYear.csv",row.names = F)


#####Strategy a Onset-OneYear sample#####
RI_data <- data.frame(t(c("", "", "")))
names(RI_data) <- c("Modelorder", "Var", "Relative_importance")
for (Modelorder in 1:20) {
  modelname <-
    paste("E:\\Conflict\\Model\\BRT_StrategyA_12M_Onset_OneYear_AllSample_",
          Modelorder,
          ".Rdata",
          sep = "")
  load(modelname)
  tempcontrib <- BRT_model$contributions
  vars <- tempcontrib$var
  temp_predname <- BRT_model$gbm.call$predictor.names
  for (var in 1:nrow(tempcontrib)) {
    tempnum <- vars[var]
    k <- match(vars[var], temp_predname)
    row_data <-
      c(Modelorder, temp_predname[k], tempcontrib[var, 2])
    RI_data <- t(data.frame(t(RI_data), row_data))
  }
}
write.csv(RI_data, file = "E:\\Conflict\\Tables\\Var_RI_StrategyA-12M_Onset_OneYear.csv", row.names = F)

##Calculate 95% CI relative importance of covariates##
data <- read.csv(file="E:\\Conflict\\Tables\\Var_RI_StrategyA-12M_Onset_OneYear.csv",header=TRUE,encoding="utf-8")

RI_data <- data.frame(t(c("","","","","")))
names(RI_data) <- c("Varname","Relative_importance_mean","Relative_importance_sd","Relative_importance_95CI_low","Relative_importance_95CI_top")
for(var in 1:length(temp_predname)){
  tempvarname <- temp_predname[var]
  tempdata <- subset(data,Var == tempvarname)
  temp_relative_importance <- tempdata[,3]
  sd_relative_importance <- sd(temp_relative_importance)
  relative_importance<- t.test(temp_relative_importance)
  relative_importance_conf_int_low <- relative_importance$conf.int[1]
  relative_importance_conf_int_top <- relative_importance$conf.int[2]
  relative_importance_mean <- relative_importance$estimate
  row_data <-
    c(tempvarname, relative_importance_mean, sd_relative_importance,relative_importance_conf_int_low,relative_importance_conf_int_top)
  RI_data <- t(data.frame(t(RI_data), row_data))
}
write.csv(RI_data, file="E:\\Conflict\\Tables\\Var_RI_StrategyA-12M-95CI_Onset_OneYear.csv",row.names = F)


