#install.packages(devtools)
#IMPORTING LIBRARIES
library(rvest)
library(dplyr)
library(robotstxt)
library(stringr)

#scraping website
url <-"https://www.flipkart.com/search?q=mobiles+under+30k&as=on&as-show=on&otracker=AS_Query_HistoryAutoSuggest_1_5_na_na_na&otracker1=AS_Query_HistoryAutoSuggest_1_5_na_na_na&as-pos=1&as-type=HISTORY&suggestionId=mobiles+under+30k&requestId=75cbcc33-b075-4e9b-88ad-705edfe5d3ea&as-searchtext=mobil"

#allowability
path=paths_allowed(url)

#HTML from the website
web = read_html(url)
View(web)

#Segregating Names
name <- web %>% html_nodes(".KzDlHZ")%>% html_text()
View(name)

#Segregating storage
storage <-web %>% html_nodes(".J\\+igdf:nth-child(1)")%>% html_text()
View(storage)

#Segregating camera
camera <- web %>% html_nodes(".J\\+igdf:nth-child(3)")%>% html_text()
View(camera)

#segregating processor
processor <- web %>% html_nodes(".J\\+igdf:nth-child(5)")%>% html_text()
View(processor)

#Creating Dataframe
mobile = data.frame(name,storage,camera,processor)
View(mobile)

#Saving as CSV file
write.csv(mobile,"flipkart_mobiles1.csv")
