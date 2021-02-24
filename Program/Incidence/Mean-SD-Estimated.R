##Estimate the mean and standard deviation of simulation results##
##Data sources of Figure 3 and Supplementary Figures 7-14##
##Author:Fangyu Ding##
##Time:20210224##

##Strategy a+ all##

rm(list=ls())
library(sp)     
library(raster)
library(rgdal) 
library(modifiedmk)  

setwd('E:\\Conflict\\Product\\Step1\\')
years <- c(2000:2015)

timestart<-Sys.time();

p <- 1
for(p in 1:length(years)){
  
  fn_eg <- 'All_StrategyA_24M_ConflictRisk_simulated_2000_1.tif'
  tif_in_eg <- raster(fn_eg)  
  NROW_USED <- nrow(tif_in_eg)
  NCOL_USED <- ncol(tif_in_eg)
  
  TIFS_array <- array(-1,c(NROW_USED,NCOL_USED,20))
  
  tif_out_uncertain <- matrix(-1,ncol = NCOL_USED,nrow = NROW_USED)
  
  tif_out_95top <- matrix(-1,ncol = NCOL_USED,nrow = NROW_USED)
  tif_out_95low <- matrix(-1,ncol = NCOL_USED,nrow = NROW_USED)
  tif_out_mean <- matrix(-1,ncol = NCOL_USED,nrow = NROW_USED)
  
  
  for (i in 1:20){   
    fn <- paste("All_StrategyA_24M_ConflictRisk_simulated_",years[p],"_",i,".tif",sep='') 
    if(file.exists(fn)){
      tif_in <- raster(fn)
      dim3 <- i
      TIFS_array[,,dim3] <- as.matrix(tif_in)
    }
  }
  
  for(j in 1:NROW_USED){
    for(k in 1:NCOL_USED) {
      data_in <- c(TIFS_array[j,k,])
      num_uni <- length(unique(data_in))
      if( num_uni!=1  ){
        sd_risk <- sd(data_in)
        relative_risk<- t.test(data_in)
        relative_risk_95ci_low <- relative_risk$conf.int[1]
        relative_risk_95ci_top <- relative_risk$conf.int[2]
        relative_risk_mean <- relative_risk$estimate
        
        #calculate
        tif_out_uncertain[j,k] <- sd_risk
        tif_out_95top[j,k] <- relative_risk_95ci_top
        tif_out_95low[j,k] <- relative_risk_95ci_low
        tif_out_mean[j,k] <- relative_risk_mean
        
      }
    }
  }
  
  rr <- raster(nrows= NROW_USED,ncols=NCOL_USED)
  projection(rr) <- projection(tif_in_eg)
  extent(rr) <- extent(tif_in_eg)
  
  r_out <- setValues(rr,tif_out_uncertain)
  fn <- paste("E:\\Conflict\\Product\\Step2\\All_StrategyA_24M_",years[p],"_uncertain.tif",sep='') 
  writeRaster(r_out, filename=fn,format="GTiff", overwrite=TRUE,datatype='FLT4S')
  r_out <- setValues(rr,tif_out_95top)
  fn <- paste("E:\\Conflict\\Product\\Step2\\All_StrategyA_24M_",years[p],"_95CI_top.tif",sep='') 
  writeRaster(r_out, filename=fn,format="GTiff", overwrite=TRUE,datatype='FLT4S')
  r_out <- setValues(rr,tif_out_95low)
  fn <- paste("E:\\Conflict\\Product\\Step2\\All_StrategyA_24M_",years[p],"_95CI_low.tif",sep='') 
  writeRaster(r_out, filename= fn,format="GTiff", overwrite=TRUE,datatype='FLT4S')
  r_out <- setValues(rr,tif_out_mean)
  fn <- paste("E:\\Conflict\\Product\\Step2\\All_StrategyA_24M_",years[p],"_mean.tif",sep='') 
  writeRaster(r_out, filename=fn,format="GTiff", overwrite=TRUE,datatype='FLT4S')
  print("Completed!")
  
}



##Strategy a all##
rm(list=ls())
library(sp)     
library(raster)
library(rgdal) 
library(modifiedmk)  

setwd('E:\\Conflict\\Product\\Step1\\')
years <- c(2000:2015)

timestart<-Sys.time();

p <- 1
for(p in 1:length(years)){

  fn_eg <- 'All_StrategyA_ConflictRisk_simulated_2000_1.tif'
  tif_in_eg <- raster(fn_eg)  
  NROW_USED <- nrow(tif_in_eg)
  NCOL_USED <- ncol(tif_in_eg)
  
  TIFS_array <- array(-1,c(NROW_USED,NCOL_USED,20))
  
  tif_out_uncertain <- matrix(-1,ncol = NCOL_USED,nrow = NROW_USED)
  
  tif_out_95top <- matrix(-1,ncol = NCOL_USED,nrow = NROW_USED)
  tif_out_95low <- matrix(-1,ncol = NCOL_USED,nrow = NROW_USED)
  tif_out_mean <- matrix(-1,ncol = NCOL_USED,nrow = NROW_USED)
  
  
  for (i in 1:20){   
    fn <- paste("All_StrategyA_ConflictRisk_simulated_",years[p],"_",i,".tif",sep='') 
    if(file.exists(fn)){
      tif_in <- raster(fn)
      dim3 <- i
      TIFS_array[,,dim3] <- as.matrix(tif_in)
    }
  }
  
  for(j in 1:NROW_USED){
    for(k in 1:NCOL_USED) {
      data_in <- c(TIFS_array[j,k,])
      num_uni <- length(unique(data_in))
      if( num_uni!=1  ){
        sd_risk <- sd(data_in)
        relative_risk<- t.test(data_in)
        relative_risk_95ci_low <- relative_risk$conf.int[1]
        relative_risk_95ci_top <- relative_risk$conf.int[2]
        relative_risk_mean <- relative_risk$estimate
        
        #calculate
        tif_out_uncertain[j,k] <- sd_risk
        tif_out_95top[j,k] <- relative_risk_95ci_top
        tif_out_95low[j,k] <- relative_risk_95ci_low
        tif_out_mean[j,k] <- relative_risk_mean
        
      }
    }
  }
  
  rr <- raster(nrows= NROW_USED,ncols=NCOL_USED)
  projection(rr) <- projection(tif_in_eg)
  extent(rr) <- extent(tif_in_eg)
  
  r_out <- setValues(rr,tif_out_uncertain)
  fn <- paste("E:\\Conflict\\Product\\Step2\\All_StrategyA_12M_",years[p],"_uncertain.tif",sep='') 
  writeRaster(r_out, filename=fn,format="GTiff", overwrite=TRUE,datatype='FLT4S')
  r_out <- setValues(rr,tif_out_95top)
  fn <- paste("E:\\Conflict\\Product\\Step2\\All_StrategyA_12M_",years[p],"_95CI_top.tif",sep='') 
  writeRaster(r_out, filename=fn,format="GTiff", overwrite=TRUE,datatype='FLT4S')
  r_out <- setValues(rr,tif_out_95low)
  fn <- paste("E:\\Conflict\\Product\\Step2\\All_StrategyA_12M_",years[p],"_95CI_low.tif",sep='') 
  writeRaster(r_out, filename= fn,format="GTiff", overwrite=TRUE,datatype='FLT4S')
  r_out <- setValues(rr,tif_out_mean)
  fn <- paste("E:\\Conflict\\Product\\Step2\\All_StrategyA_12M_",years[p],"_mean.tif",sep='') 
  writeRaster(r_out, filename=fn,format="GTiff", overwrite=TRUE,datatype='FLT4S')
  print("Completed!")
  
}


##Strategy b+ all##
rm(list=ls())
library(sp)     
library(raster)
library(rgdal) 
library(modifiedmk)  

setwd('E:\\Conflict\\Product\\Step1\\')
years <- c(2000:2015)

timestart<-Sys.time();

p <- 1
for(p in 1:length(years)){
  
  fn_eg <- 'All_StrategyB_24M_ConflictRisk_simulated_2000_1.tif'
  tif_in_eg <- raster(fn_eg)  
  NROW_USED <- nrow(tif_in_eg)
  NCOL_USED <- ncol(tif_in_eg)
  
  TIFS_array <- array(-1,c(NROW_USED,NCOL_USED,20))
  
  tif_out_uncertain <- matrix(-1,ncol = NCOL_USED,nrow = NROW_USED)
  
  tif_out_95top <- matrix(-1,ncol = NCOL_USED,nrow = NROW_USED)
  tif_out_95low <- matrix(-1,ncol = NCOL_USED,nrow = NROW_USED)
  tif_out_mean <- matrix(-1,ncol = NCOL_USED,nrow = NROW_USED)
  
  
  for (i in 1:20){   
    fn <- paste("All_StrategyB_24M_ConflictRisk_simulated_",years[p],"_",i,".tif",sep='') 
    if(file.exists(fn)){
      tif_in <- raster(fn)
      dim3 <- i
      TIFS_array[,,dim3] <- as.matrix(tif_in)
    }
  }
  
  for(j in 1:NROW_USED){
    for(k in 1:NCOL_USED) {
      data_in <- c(TIFS_array[j,k,])
      num_uni <- length(unique(data_in))
      if( num_uni!=1  ){
        sd_risk <- sd(data_in)
        relative_risk<- t.test(data_in)
        relative_risk_95ci_low <- relative_risk$conf.int[1]
        relative_risk_95ci_top <- relative_risk$conf.int[2]
        relative_risk_mean <- relative_risk$estimate
        
        #calculate
        tif_out_uncertain[j,k] <- sd_risk
        tif_out_95top[j,k] <- relative_risk_95ci_top
        tif_out_95low[j,k] <- relative_risk_95ci_low
        tif_out_mean[j,k] <- relative_risk_mean
        
      }
    }
  }
  
  rr <- raster(nrows= NROW_USED,ncols=NCOL_USED)
  projection(rr) <- projection(tif_in_eg)
  extent(rr) <- extent(tif_in_eg)
  
  r_out <- setValues(rr,tif_out_uncertain)
  fn <- paste("E:\\Conflict\\Product\\Step2\\All_StrategyB_24M_",years[p],"_uncertain.tif",sep='') 
  writeRaster(r_out, filename=fn,format="GTiff", overwrite=TRUE,datatype='FLT4S')
  r_out <- setValues(rr,tif_out_95top)
  fn <- paste("E:\\Conflict\\Product\\Step2\\All_StrategyB_24M_",years[p],"_95CI_top.tif",sep='') 
  writeRaster(r_out, filename=fn,format="GTiff", overwrite=TRUE,datatype='FLT4S')
  r_out <- setValues(rr,tif_out_95low)
  fn <- paste("E:\\Conflict\\Product\\Step2\\All_StrategyB_24M_",years[p],"_95CI_low.tif",sep='') 
  writeRaster(r_out, filename= fn,format="GTiff", overwrite=TRUE,datatype='FLT4S')
  r_out <- setValues(rr,tif_out_mean)
  fn <- paste("E:\\Conflict\\Product\\Step2\\All_StrategyB_24M_",years[p],"_mean.tif",sep='') 
  writeRaster(r_out, filename=fn,format="GTiff", overwrite=TRUE,datatype='FLT4S')
  print("Completed!")
  
}



##Strategy b all##
rm(list=ls())
library(sp)     
library(raster)
library(rgdal) 
library(modifiedmk)  

setwd('E:\\Conflict\\Product\\Step1\\')
years <- c(2000:2015)

timestart<-Sys.time();

p <- 1
for(p in 1:length(years)){
  
  fn_eg <- 'All_StrategyB_ConflictRisk_simulated_2000_1.tif'
  tif_in_eg <- raster(fn_eg)  
  NROW_USED <- nrow(tif_in_eg)
  NCOL_USED <- ncol(tif_in_eg)
  
  TIFS_array <- array(-1,c(NROW_USED,NCOL_USED,20))
  
  tif_out_uncertain <- matrix(-1,ncol = NCOL_USED,nrow = NROW_USED)
  
  tif_out_95top <- matrix(-1,ncol = NCOL_USED,nrow = NROW_USED)
  tif_out_95low <- matrix(-1,ncol = NCOL_USED,nrow = NROW_USED)
  tif_out_mean <- matrix(-1,ncol = NCOL_USED,nrow = NROW_USED)
  
  
  for (i in 1:20){   
    fn <- paste("All_StrategyB_ConflictRisk_simulated_",years[p],"_",i,".tif",sep='') 
    if(file.exists(fn)){
      tif_in <- raster(fn)
      dim3 <- i
      TIFS_array[,,dim3] <- as.matrix(tif_in)
    }
  }
  
  for(j in 1:NROW_USED){
    for(k in 1:NCOL_USED) {
      data_in <- c(TIFS_array[j,k,])
      num_uni <- length(unique(data_in))
      if( num_uni!=1  ){
        sd_risk <- sd(data_in)
        relative_risk<- t.test(data_in)
        relative_risk_95ci_low <- relative_risk$conf.int[1]
        relative_risk_95ci_top <- relative_risk$conf.int[2]
        relative_risk_mean <- relative_risk$estimate
        
        #calculate
        tif_out_uncertain[j,k] <- sd_risk
        tif_out_95top[j,k] <- relative_risk_95ci_top
        tif_out_95low[j,k] <- relative_risk_95ci_low
        tif_out_mean[j,k] <- relative_risk_mean
        
      }
    }
  }
  
  rr <- raster(nrows= NROW_USED,ncols=NCOL_USED)
  projection(rr) <- projection(tif_in_eg)
  extent(rr) <- extent(tif_in_eg)
  
  r_out <- setValues(rr,tif_out_uncertain)
  fn <- paste("E:\\Conflict\\Product\\Step2\\All_StrategyB_12M_",years[p],"_uncertain.tif",sep='') 
  writeRaster(r_out, filename=fn,format="GTiff", overwrite=TRUE,datatype='FLT4S')
  r_out <- setValues(rr,tif_out_95top)
  fn <- paste("E:\\Conflict\\Product\\Step2\\All_StrategyB_12M_",years[p],"_95CI_top.tif",sep='') 
  writeRaster(r_out, filename=fn,format="GTiff", overwrite=TRUE,datatype='FLT4S')
  r_out <- setValues(rr,tif_out_95low)
  fn <- paste("E:\\Conflict\\Product\\Step2\\All_StrategyB_12M_",years[p],"_95CI_low.tif",sep='') 
  writeRaster(r_out, filename= fn,format="GTiff", overwrite=TRUE,datatype='FLT4S')
  r_out <- setValues(rr,tif_out_mean)
  fn <- paste("E:\\Conflict\\Product\\Step2\\All_StrategyB_12M_",years[p],"_mean.tif",sep='') 
  writeRaster(r_out, filename=fn,format="GTiff", overwrite=TRUE,datatype='FLT4S')
  print("Completed!")
  
}

