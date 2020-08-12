1.Description

We adopted a formal machine learning-based modelling framework to infer potential mechanisms from high-frequency time-series data and simulate the risk of armed conflicts worldwide from 2000-2015. 



2.Acknoledgemnet

We acknowledge to authors of R packages used in this study. 



3.System requirements

Operating systems: Win 7/8/10.

Software: R (Version X64 3.3/3.4/3.5) and Python (Version X64 3.6)

Memory capacity: 16G/32G/64G

Note: There must be an E disk, and the remaining capacity of the disk must be higher than 450G. It is recommended to build an operating environment on a workstation or server.



4.Installation

Firstlly, we need to install some packages in R platform:

install.packages("caret")

install.packages("ggplot2")

install.packages("nnet")

install.packages("e1071")

install.packages("ROCR")

install.packages("RColorBrewer")

install.packages("MLmetrics")

install.packages("ggthemes")

install.packages("coin")

install.packages("plotrix")

install.packages("dismo")

install.packages("gbm")

install.packages("car")

Secondly, create a series of folders:

Running the code in "CreatDir.R"



5.Dataset

The dataset that support the findings of this study is available on the website of Figshare (DOI: https://doi.org/10.6084/m9.figshare.12756491.v1), and unzip the dataset under the folder (Tables). Then, the RevisedVersion folder can be found in the Tables folder.



6.Examples

Running the code (Steps 1,2,3 and 4 section) in "StrategyA-12M-modelling.R", "StrategyA-24M-modelling.R", "StrategyB-12M-modelling.R" and "StrategyB-24M-modelling.R". 

Running the code in "StatisticalTest.R" to make a statistical analysis (collinearity test and significance analysis).

Running the code in "Performance-Estimated.R" to analyze the performance of the ensemble models.

Running the code in "RelativeContribution.R" to analyze the relative contribution of covariates.

Running the code in "Csv-to-raster.py" to rasterize simulation results.

Running the code in "Mean-SD-Estimated.R" to estimate the mean and standard deviation of simulation results.



