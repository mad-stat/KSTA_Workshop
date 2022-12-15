
####################### Installation of R and RStudio #########################
# (editor comment symbol in R is # )

# Download R software from http://cran.r-project.org/bin/windows/base/
# Run the R set up (exe) file and follow instructions
# Double click on the R icon in the desktop and R window will open
# Download RStudio from http://www.rstudio.com/
# Run R studio set up file and follow instructions
# Click on R studio icon, R Studio IDE Studio will load
# Go to R-Script (Ctrl + Shift + N)
# Write 'Hello World'
# Save & Run (Ctrl + Enter)

################################################################################

'Hello World'

############ Simple Maths in R ####################
#
3+5
(12+3/4-5)+3*8
pi*2^3-sqrt(4)
factorial(4)
log(2,10)

x = 3+5
x
y = 12+3/4-5+3*8
y
z = (12+3/4-5)+3*8
z

######## R is case sensitive and no space should be between '<' & '-' ##########

A <- 6+8
a
A

########## Write numeric / text data ################

data1 = c(3, 6, 9, 12, 78, 34, 5, 7, 7) ## numerical data
data1
data2.text = c(data1 , 'Thu' , "Fri") ## Single or double quote works
data2.text

############ Scan command for Read Data Values ###############
### Double enter in Console to stop ###
data3 = scan(what = 'character')
mon
tue
wed 
thur 
data3
data3[2]
data3[2] = 'mon'
data3
data3[6]= 'sat'
data3
data3[2] = 'tue'
data3[5] = 'fri'
data3

############# Working directory ################

getwd() ### Session - Get Working Directory - To Source File Location ###
# setwd() ### Session - Set Working Directory - To Source File Location
dir()  ### working directory listing
ls()   ### Work space listing of objects
rm('object')  ### Remove an element "object", if exist
rm(list = ls(all = TRUE)) ### Cleaning

###################### Use different packages after installation  ###########

install.packages('MASS')
library('MASS')

################### R Arithmetic operators #############################

# + : Addition
# - : subtraction
# * : multiplication
# / : division
# ^ or ** : exponentiation
# x%%y : Modulus (Remainder from division) (x mod y) : exam; 5%%2 is 1
# x%/%y : integer division 

##### Define variables and array to do the above Arithmetic operations #####

x <- 6
y <- 20
print(x+y)
print(x-y)
print(x*y)
print(y/x)
print(y%%x)
print(y%/%x)
print(y^x)

##################  R Relational Operators #########################

# < : Less than
# > : Greater than
# <= : Less than or equal to
# >= : Greater than or equal to
# == : Equal to
# != : Not equal to

print(x<y)
print(x>y)
print(x<=y)
print(x>=y)
print(x==y)
print(x!=y)

###############  Operation on Vectors  ##################

x1 <- c(1,4,5)
y1 <- c(2,3,6)
print(x1+y1)
print(x1 > y1)

################# R Logical Operators ##########################

# ! : Logical NOT 
# & : Element-wise logical AND
# && : Logical AND
# | : Element-wise logical OR
# || : Logical OR

# Operators & and | perform element-wise operation producing result having length of the longer operand.
# But && and || examines only the first element of the operands resulting into a single length logical vector.
# Zero is considered FALSE and non-zero numbers are taken as TRUE. An example run.

x2 <- c(TRUE,FALSE,TRUE)
y2 <- c(FALSE,TRUE,TRUE)
print(!x2)
print(x2&y2)
print(x2&&y2)
print(x2|y2)
print(x2||y2)


######### R Assignment Operators #########################

# <-, = : Leftwards assignment
# -> : Rightwards assignment
x3=4
print(x3 <- 3)
print(10->x3)

########## Data Frame in R ##########

d <- c(1,2,3,4)
e <- c("Tanujit", "Subhajit", "Indrajit", NA)
f <- c(TRUE,TRUE,TRUE,FALSE)
myframe <- data.frame(d,e,f)
names(myframe) <- c("ID","Name","Passed") # Variable names
myframe
myframe[1:3,] # Rows 1,2,3 of data frame
myframe[,1:2] # Columns 1,2 of data frame
myframe[c("ID","Name")] #Columns ID and color from data frame
myframe$ID # Variable ID in the data frame

################## Descriptive Statistics #####################

# The monthly credit card expenses of an individual in 1000 rupees is 
# given in the file Credit_Card_Expenses.csv.
# Q1. Read the dataset
# Q2. Compute mean, median minimum, maximum, range, variance, standard
# deviation, skewness, kurtosis and quantiles of Credit Card Expenses
# Q3. Compute default summary of Credit Card Expenses
# Q4. Draw Histogram of Credit Card Expenses


#### read the csv file using read.csv() function 


Credit_Card_Expenses <- read.csv("Credit_Card_Expenses.csv")
Credit_Card_Expenses ## This is a data frame
mydata = Credit_Card_Expenses ### load it to another variable
print(mydata) ### print the data frame


### To read a particular column or variable of data set to a new variable Example: 
### Read CC_Expenses to CC

CC=mydata$CC_Expenses
print(CC)

######  Descriptive statistics for variable #####

Mean = mean(CC)
print(Mean)
Median=median(CC)
print(Median)
StandaradDeviation=sd(CC)
print(StandaradDeviation)
Variance=var(CC)
print(Variance)
Minimum=min(CC)
print(Minimum)
Maximum=max(CC)
print(Maximum)
Range=range(CC)
print(Range)
Quantile=quantile(CC)
print(Quantile)

Summary=summary(CC)
print(Summary)

##### Another way to calculate Descriptive statistics #####

# install.packages("psych")
library('psych')
data_descriptive=describe(CC)
print(data_descriptive)

#####  Plotting of the Descriptive Statistics #####

hist(CC)
hist(CC,col="blue")
dotchart(CC)
boxplot(CC)
boxplot(CC, col="dark green")

##### plot function : ggplot2 #####

#install.packages("ggplot2")
# Library Call (for use)
library("ggplot2")

################### Data Visualization techniques ################

data_mart = read.csv("Big_Mart_Dataset.csv")
print(data_mart) # Read and Print BigMart dataset

library(ggplot2) # Scatter Plot of Item_Visibility & Item_MRP 
print(ggplot(data_mart, aes(Item_Visibility, Item_MRP)) + geom_point() +
        scale_x_continuous("Item Visibility", breaks = seq(0,0.35,0.05))+
        scale_y_continuous("Item MRP", breaks = seq(0,270,by = 30))+ theme_bw())


# Now, we can view a third variable also in same chart, say a categorical variable (Item_Type) which will give the characteristic (item_type)
# of each data set. Different categories are depicted by way of different color for
# item_type in below chart. Another scatter plot using function ggplot() with geom_point().


print(ggplot(data_mart, aes(Item_Visibility, Item_MRP)) + 
        geom_point(aes(color = Item_Type)) + scale_x_continuous("Item Visibility", breaks = seq(0,0.35,0.05)) + 
        scale_y_continuous("Item MRP", breaks = seq(0,270,by = 30))+ theme_bw() + 
        labs(title="Scatterplot"))

# We can even make it more visually clear by creating separate
# scatter plots for each separate Item_Type as shown below.
# Another scatter plot using function ggplot() with geom_point().

print(ggplot(data_mart, aes(Item_Visibility, Item_MRP)) + 
        geom_point(aes(color = Item_Type)) + 
        scale_x_continuous("Item Visibility", breaks = seq(0,0.35,0.05)) + 
        scale_y_continuous("Item MRP", breaks = seq(0,270, by = 30))+ 
        theme_bw() + labs(title="Scatterplot") + facet_wrap( ~ Item_Type))

########## Histogram Plot ########################

# For Big_Mart_Dataset, if we want to know the count of items on basis of their
# cost, then we can plot histogram using continuous variable Item_MRP as shown below.
# Histogram plot using function ggplot() with geom_ histogram()

print(ggplot(data_mart, aes(Item_MRP)) + geom_histogram(binwidth = 2)+
        scale_x_continuous("Item MRP", breaks = seq(0,270,by = 30))+
        scale_y_continuous("Count", breaks = seq(0,200,by = 20))+ labs(title = "Histogram"))


############ Box Plot  ##########################################

# For Big_Mart_Dataset, if we want to identify each outlet's detailed item sales
# including minimum, maximum & median numbers, box plot can be helpful. In
# addition, it also gives values of outlier of item sales for each outlet as shown
# in below chart.

print(ggplot(data_mart, aes(Outlet_Identifier, Item_Outlet_Sales)) + 
        geom_boxplot(fill = "red")+ 
        scale_y_continuous("Item Outlet Sales", breaks= seq(0,15000, by=500))+
        labs(title = "Box Plot", x = "Outlet Identifier"))

### To save these charts, click on Export - Save as ... ###


######################  Heat Map: ############################################

# For Big_Mart_Dataset, if we want to know cost of each item on every outlet,
# we can plot heatmap as shown below using three variables Item MRP, Outlet
# Identifier & Item Type from our mart dataset

print(ggplot(data_mart, aes(Outlet_Identifier, Item_Type))+ 
        geom_raster(aes(fill = Item_MRP))+ 
        labs(title ="Heat Map", x = "Outlet Identifier", y = "Item Type")+
        scale_fill_continuous(name = "Item MRP"))

# The dark portion indicates Item MRP is close 50. The brighter portion indicates
# Item MRP is close to 250.

##################### Correlogram  ##########################

# For Big_Mart_Dataset, check co-relation between Item cost, weight, visibility
# along with Outlet establishment year and Outlet sales from below plot.
# install.packages("corrgram")

install.packages("corrgram")
library(corrgram)
print(corrgram(data_mart, order=NULL, panel=panel.shade, text.panel=panel.txt,
               main="Correlogram"))

# Darker the color, higher the co-relation between variables. Positive co-
# relations are displayed in blue and negative correlations in red color. Color
# intensity is proportional to the co-relation value.

# We can see that Item cost & Outlet sales are positively correlated while Item
# weight & its visibility are negatively correlated.


################# Data Pre-processing ##################

### Use Import Dataset - From Text (base) - Missing_Values_Telecom - Heading - Yes ###
mydata = read.csv("Missing_Values_Telecom.csv")
mean(mydata) # Mean cannot be computed due to missing values
newdata = na.omit(mydata) # Discard all records with missing values
write.csv(newdata, file = 'newdata.csv',row.names = TRUE)

### Compute the means excluding the missing values
cmusage = mydata[,2] 
l3musage = mydata[,3] 
avrecharge = mydata[,4]
cmusage_mean = mean(cmusage, na.rm = TRUE) 
l3musage_mean = mean(l3musage, na.rm = TRUE)
avrecharge_mean = mean(avrecharge, na.rm = TRUE)

### Replace the missing values with mean
cmusage[is.na(cmusage)]=cmusage_mean
l3musage[is.na(l3musage)]= l3musage_mean 
avrecharge[is.na(avrecharge)]=avrecharge_mean

mynewdata = cbind(cmusage, l3musage, avrecharge, mydata[,5],mydata[,6]) 
mydata
mynewdata
write.csv(mynewdata, file = 'Missing_Values_Telecom_mod.csv',row.names = TRUE)

############## Data Normalization and Random Sampling #################

mydata = read.csv("Supply_Chain.csv")
# mydata = Supply_Chain
mystddata = scale(mydata)
mystddata

mydata= read.csv("bank_data.csv")
nrow(mydata)
sample = sample(2, nrow(mydata), replace = TRUE, prob = c(0.750, 0.250))
sample1 = mydata[sample ==1,]
nrow(sample1)
sample2 = mydata[sample ==2,]
nrow(sample2)

##################### Statistical Modeling in RStudio #####################

########  Testing of Hypothesis  ########

# Installing all the required packages for the R Notebook

install.packages("car")
install.packages("ggplot2")
install.packages("gplots")
install.packages("qqplotr")
library(car)
library(gplots)
library(qqplotr)
library(ggplot2)

######## One Sample t Test #######

# Problem: Testing whether the average Processing Time of PO_Processing 
# data set is less than equal to 40.

# Step 1: Reading the data as mydata

# SESSION -> SET WORKING DIRECTORY -> TO SOURCE FILE LOCATION

mydata = read.csv('PO_Processing.csv',header = T,sep = ",")

# IMPORT DATASET -> FROM TEXT -> CHOOSE DATA -> HEADING = YES, RENAME THE DATA

PT = mydata$Processing_Time

# Step 2: Using the t Test function to test our hypothesis

# ?t.test

t.test(PT, alternative = 'greater', mu = 40)

# p-value < 0.05 => Reject H0.

######## Normality Test ########

# Problem: Checking whether the Processing Time Data is Normally Distributed

qqnorm(PT)
qqline(PT)

# Normality Check using Shapiro-Wilk test

shapiro.test(PT) 

################# Simple Linear Regression Analysis in RStudio #################

################ Fitting Linear Regression using lm function ###################

# Installing all the required packages for the R Notebook

install.packages("car")
install.packages("pls")
install.packages("ggplot2")
install.packages("gplots")
install.packages("glmnet")
install.packages("DAAG")
install.packages("boot")
install.packages("MASS")
library(DAAG)
library(glmnet)
library(car)
library(MASS)
library(gplots)
library(ggplot2)
library(pls)
library(boot)

#### Simple Linear Regression ####
# (dependent variable is regressed upon one predictor variable)

# Reading the data and variables

mydata = read.csv('DC_Simple_Reg.csv',header = T,sep = ",")
Temp = mydata$Dryer.Temperature 
DContent = mydata$Dry.Content

# Constructing Scatter Plot
plot(Temp, DContent)

# Computing Correlation Matrix
cor(Temp, DContent)
# Correlation between y & x need to be high (preferably 0.8 to 1 to -0.8 to -1.0)

# Fitting Regression Model
model = lm(DContent ~ Temp) 
summary(model)

# DContent = 2.183813 + 1.293432*Temp

# Regression Performance
anova(model)

# Residual Analysis
pred = fitted(model) 
Res = residuals(model) 

# write.csv(pred,"Pred.csv") # Stores the predicted values in 'Pred.csv' file at your working directory
# write.csv(Res,"Res.csv") # Stores the residual values in 'Res.csv' file at your working directory

# Visualizing Actual vs Predicted Values
plot(DContent, pred)

# Checking whether the distribution of the Residuals is bell shaped (Normality Test)
qqnorm(Res) 
qqline(Res)

# Normality Check using Shapiro-Wilk test
shapiro.test(Res) 

# Visualizing the relationship between Residuals and Predicted values
plot(pred,Res)

# Visualizing the relationship between Residuals and Predictor
plot(Temp,Res)

################################################################################

################# Fitting Simple Linear Regression Manually #################

# Reading the data and variables
df = data.frame(DContent = c(73.3,74.6,74,78.5,74.6,74,75.2,77.2,75.9,74.6,73.3,75.9,76,74.6,74.7,74.5,70.7,72,72.1,72.2,70.7,
                             74.6,75.2,74,75.9,75.3,74,78.5,76.5,74.5,76,76.5,76.7,76,75.8,73.8,73.3,74.6,73.4,76,74,75.2), 
                Temp = c(55,56,55.5,59,56,55.5,56.5,58,57,56,55,57,57,56,56,56,53,54,54,54,53,56,56.5,55.5,57,56.5,55.5,59,
                         57.5,56,57,57.5,57.5,57,57,55.5,55,56,55,57,55.5,56.5))

# Constructing Scatter Plot
plot(Temp, DContent)

# Computing Correlation Matrix
cor(Temp, DContent)
# Correlation between y & x need to be high (preferably 0.8 to 1 to -0.8 to -1.0)

# Fitting Regression Model

# y_hat = beta_0_hat + beta_1_hat*x
# beta_1_hat = S_xy / S_xx
# beta_0_hat = y_bar - beta_1_hat*x_bar

be1_hat = cov(Temp,DContent) / var(Temp)
be0_hat = mean(DContent) - (be1_hat * mean(Temp))

pred = be0_hat + (be1_hat *Temp)

A = data.frame (DContent, Temp, pred)
names(A)=c("Observed DContent","Observed Temp ","Fitted DContent")
print(A)

cat("\n The fitted linear regression model is : DContent=",be0_hat,"+",be1_hat,"Temp\n")
# DContent = 2.183813 + 1.293432*Temp

# Regression Performance

Res = DContent - pred # Calculating the residuals

# Performing ANOVA

# SS_Res = Sum (Res^2) | MS_Res = SS__Res/df_Res
SS_Res =sum(Res^2)
df_Res = length(DContent)-2  # Number of observations - No of predictors - 1
MS_Res = SS_Res / df_Res

# SS_Total = Sum(y - y_bar)^2 | MS_Total = SS_Total/df_total
SS_Total = sum((DContent - mean(DContent))^2)
df_Total = length(DContent) - 1 # Number of observations - 1
MS_Total = SS_Total / df_Total

# SS_Reg = SS_Total - SS_Res | MS_Reg = SS_Reg/df_Reg
SS_Reg = SS_Total - SS_Res
df_Reg = 1 # No of predictors
MS_Reg = SS_Reg / df_Reg

# Calculating F statistic values
F_obs = MS_Reg / MS_Res

# Tabulated F vlaue 
F_pvalue = 1 - pf(F_obs, df_Reg, df_Res)

# ANOVA Table

cat("\n \t\t\t Analysis of Variance Table\t\t\t\t\n")+
  cat("\nSource","\t\t","Df","\t","Sum Sq","\t","Mean Sq","\t","F value","\t","Pr(>F)","\n")+
  cat("\n Temp","\t\t",df_Reg,"\t",SS_Reg,"\t",MS_Reg,"\t",F_obs,"\t",F_pvalue,"\n")+
  cat("\n Residual","\t",df_Res,"\t",SS_Res,"\t",MS_Res,"\n")+
  cat("\n Total","\t\t",df_Total,"\t",SS_Total,"\t",MS_Total,"\n")

# Visualizing Actual vs Predicted Values
plot(DContent, pred)

# Checking whether the distribution of the Residuals is bell shaped (Normality Test)
qqnorm(Res) 
qqline(Res)

# Normality Check using Shapiro-Wilk test
shapiro.test(Res) 

# Visualizing the relationship between Residuals and Predicted values
plot(pred,Res)

# Visualizing the relationship between Residuals and Predictor
plot(Temp,Res)

################################################################################


