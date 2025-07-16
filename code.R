#DATA PROCESSING
#IMPORTING LIBRARIES
library(rvest)
library(dplyr)
#IMPORTING DATASET
dataset<-read.csv("00 CafeSales.csv")
#VIEW DATASET
View(dataset)
#1.check for special character (gsub-global substitution)
dataset$Item<-gsub("UNKNOWN","hot chocolate",dataset$Item)
dataset$Item<-gsub("ERROR","black forest",dataset$Item)
dataset$Quantity<-gsub("ERROR","5",dataset$Quantity)
dataset$Quantity<-gsub("UNKNOWN","1",dataset$Quantity)
dataset$Price.Per.Unit<-gsub("UNKNOWN","3",dataset$Price.Per.Unit)
dataset$Price.Per.Unit<-gsub("ERROR","5",dataset$Price.Per.Unit)
dataset$Price.Per.Unit<-gsub("1.5","5",dataset$Price.Per.Unit)
dataset$Total.Spent<-gsub("UNKNOWN","9",dataset$Total.Spent)
dataset$Total.Spent<-gsub("ERROR","4",dataset$Total.Spent)
dataset$Total.Spent<-gsub("7.5","15",dataset$Total.Spent)
dataset$Total.Spent<-gsub("4.5","9",dataset$Total.Spent)
dataset$Total.Spent<-gsub("1.5","3",dataset$Total.Spent)
dataset$Payment.Method<-gsub("UNKNOWN","Credit Card",dataset$Payment.Method)
dataset$Payment.Method<-gsub("ERROR","Gpay",dataset$Payment.Method)
dataset$Location<-gsub("UNKNOWN","Takeaway",dataset$Location)
dataset$Location<-gsub("ERROR","In-Store",dataset$Location)
dataset$Transaction.Date<-gsub("ERROR","06/10/2023",dataset$Transaction.Date)
dataset$Transaction.Date<-gsub("UNKNOWN","04/12/2023",dataset$Transaction.Date)
dataset$Item[dataset$Item == ""] <- "fresh juice"
dataset$Location[dataset$Location == ""] <- "Takeaway"
dataset$Payment.Method[dataset$Payment.Method == ""] <- "Cash"
dataset$Transaction.Date[dataset$Transaction.Date == ""] <- "06/04/2023"
View(dataset)
#2.check whether all the variable are having right datatype
str(dataset)
dataset$Transaction.ID<-as.character(dataset$Transaction.ID)
dataset$Item<-as.character(dataset$Item)
dataset$Quantity<-as.numeric(dataset$Quantity)
dataset$Price.Per.Unit<-as.numeric(dataset$Price.Per.Unit)
dataset$Total.Spent<-as.character(dataset$Total.Spent)
dataset$Payment.Method<-as.character(dataset$Payment.Method)
dataset$Location<-as.character(dataset$Location)
dataset$Transaction.Date<-as.character(dataset$Transaction.Date)
#dataset$year<-as.numeric(dataset$years)
View(dataset)
str(dataset)
dataset<-dataset[c("Item","Location","Transaction.Date","Quantity","Price.Per.Unit","Transaction.ID","Total.Spent","Payment.Method")]
View(dataset)
#let's replace missing values
dataset$Quantity=ifelse(is.na(dataset$Quantity),ave(dataset$Quantity,FUN=function(x)
  mean(x,na.rm=TRUE)),dataset$Quantity)
dataset$Price.Per.Unit=ifelse(is.na(dataset$Price.Per.Unit),ave(dataset$Price.Per.Unit,FUN=function(x)
  mean(x,na.rm=TRUE)),dataset$Price.Per.Unit)
View(dataset)
dataset$Total.Spent <- dataset$Total.Spent>20
View(dataset)
str(dataset)
dataset$Total.Spent =as.factor(dataset$Total.Spent) 
str(dataset)
write.csv(dataset,"cafe_details.csv")
cafe=read.csv("cafe_details.csv")
View(cafe)