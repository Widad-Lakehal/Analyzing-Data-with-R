library("tidyverse")
sub_airline <-read.csv("lax_to_jfk/lax_to_jfk.csv")
sub_airline
#Check missing value 
is.na(sub_airline)
#Counting missing values in specific colomn
sub_airline%>%   
  summarise(count=sum(is.na(CarrierDelay))) 
 
#sum() counts how many TRUE values
#Wraps the result into a data frame with a column named count.

#using purrr::map to count missing values in all colomns 
#::=Use the function map() from the package purrr
sub_airline%>%
  map(~sum(is.na(.))) #map()=It applies a function to each column of your dataset.
head(sub_airline)
#Drop rows 
sub.airline[-c(2,4,6),] #[rows,colomns]
#Drop colomns
sub_airline[,-c(2,4,6)] # only by colomn position we can not use names 
sub_airline%>%select(-CarrierDelay) #using the function select from the Dplyr package
#Drop missing values 
CarrierDelays<-sub.airline%>%
  drop_na(CarrierDelay) 
dim(sub.airline)#=2855   21
dim(CarrierDelays) #= 369  21 less rows 
#This is because for every row that had CarrierDelay equal to NA, that entire row was dropped.
#----------------------------------------------------------------------
#Replace missing values in five colomns 
#Since “CarrierDelay = NA” means there is no delay in Carrier, the delay in minutes is zero, or “CarrierDelay = 0”.
replace_nas<- sub.airline%>%
  replace_na(list(
    CarrierDelay =0,
    WeatherDelay= 0,
    NASDelay= 0,
    SecurityDelay=0,
    LateAircraftDelay=0))
replace_nas
getwd() # get the work directory="C:/Users/Morsi Store DZ/Desktop/R/R.IBM/Analyzing Data with R/Module 2. Data wrangling"
setwd("C:/Users/Morsi Store DZ/documents") #set new work directory 
list.files()



