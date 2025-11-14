#This is the first time you have used tidyverse, so you must first install it.
#installs the package
install.packages("tidyverse")
#loads the package 
library(tidyverse) #loading tidyverse library automatically loads:
#the readr,dplyr,tidyr,purr and ggplot2 packages

#The readr package include read_csv function 
read_csv(file)
#When you use the readr package in R to read data, you need to check 2 things:
#1.File format → the type of file you are reading.
#2.File path → the location of the file on your computer.
#To get working directory use the function getwd(),
#Working directory=where R is looking for files and where it will save files by default.
getwd() #"C:/Users/Morsi Store DZ/Documents"=That means R is currently working in the Documents folder.


#Example:
read_csv("lax_to_jfk/data.csv")
#This example tells the function to find the “data.csv” file in
#a folder called “lax_to_jfk” on your computer.
?read_csv #Adding question mark (?)before the function for documentation 

#Import dataset from a URL 
url<- "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/WmJTNZlA5hEqXzFUOxCu8w/lax-to-jfk-tar.gz"
#Download the file locally using the function download.file
download.file(url,destfile="lax-to-jfk-tar.gz") #first argument loads the url variable,
#the second argument provides a local name for the downloaded file 
#Unzip the content using the Untar function 
untar("lax-to-jfk-tar.gz") # untar the file so we can get the csv only
#Read the data from the local file
sub_airline<-read.csv("lax_to_jfk/lax_to_jfk.csv")
sub_airline

sub_airline<-read_csv("lax_to_jfk/lax_to_jfk.csv",
                     col_types = cols(
                      'DivDistance' = col_number(),
                      'DivArrDelay' = col_number()
                      ))

sub_airline
# show the first 6 rows
head(sub_airline)  
# show the first n = 3 rows
head(sub_airline,3)
# show the last 6 rows
tail(sub_airline)
# show the last n = 3 rows
tail(sub_airline,3)
#show the last n=10 rows 
tail(sub_airline,10)
#Dataset complete
untar("airline_2m.tar.gz")
airlines<-read.csv("airline_2m.csv")
airlines
dim(airlines)
#using URL
url <- "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/WmJTNZlA5hEqXzFUOxCu8w/lax-to-jfk-tar.gz"
download.file(url, destfile = "airline_2m.tar.gz")
untar("airline_2m.tar.gz")
airlines <- read_csv("airline_2m.csv")
airlines
sub_airline<-airlines%>% # pipe operator=%>% read it as = then 
  filter(origin=="LAX",dest=="JFK", # filter works on rows 
         Cancelled!=1,Diverted!=1)%>%
  select(Month, DayOfWeek, FlightDate,  # select works on colomns 
         Reporting_Airline, Origin, Dest, 
         CRSDepTime, CRSArrTime, DepTime, 
         ArrTime, ArrDelay, ArrDelayMinutes, 
         CarrierDelay, WeatherDelay, NASDelay,
         SecurityDelay, LateAircraftDelay, DepDelay, 
         DepDelayMinutes, DivDistance, DivArrDelay)
sub_airline
# The function dim() shows the dimensions of df,matrix....
dim(sub_airline) # 2855   22 = Number of rows and Number of columns
# shows  the names of columns in data frame
colnames(sub_airline)
write.csv(sub_airline,"lax_to_jfk.csv")
#The type of data stored in each column
sapply(sub_airline, typeof) 
head(sub_airline)
sub_airline%>%  
  group_by(Reporting_Airline)%>%
  summarise(airline_delay=mean(ArrDelay,na.rm=TRUE))
#Quick overview of your dataset (rows, columns, types, and sample values).
glimpse(sub_airline)
sub_airline
str(sub_airline)
