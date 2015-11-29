library(Hmisc)
library(corrplot)
library(data.table)
library(kknn)
library(caret)
library(tree)
library(ggplot2)
setwd("./Data")
#file = list.files(pattern="*.csv")
#raw_wdups<-do.call(rbind,lapply(file,read.csv))
#sapply(raw_wdups,levels)

raw<-read.csv('2015-11-22.csv')
table(duplicated(raw))

#Define Measurements
raw$nlength = sapply(strsplit(as.character(raw$measurement)," x "),"[",1)
raw$nwidth = sapply(strsplit(as.character(raw$measurement)," x "),"[",2)
raw$nheight = sapply(strsplit(as.character(raw$measurement)," x "),"[",3)

#Drop Variables
raw_clean<-raw[,!names(raw) %in% c("suggestions","id")]

#What predicts price?
# KKNN
# Tree
raw_clean$lprice=log(price)
temp=tree(lprice~carat+cut+color+clarity+table+depth,data=raw_clean)
plot(temp)
text(temp,cex=0.8)
# Bagging/Random Forests
# Boosting

##What clusters can we find in the data? (use price to measure distance)
# KMeans
# Finding 'Communities'

#Drop Duplicates
length(unique(raw_wdups$id))
length(unique(c(raw_wdups$id,raw_wdups$price)))
##Diamonds that have different prices
raw_wdups2<-as.data.table(raw_wdups)
raw_wdups2<-

prch<-unique(raw_wdups2[,c("suggestions","shipping_day","orderby_short","orderby","receiveby","receiveby_short"):=NULL],with=FALSE)
x<-prch[unique(prch$id)==prch[,id],]

prch<-raw_wdups[duplicates(raw_wdups$id,raw_wdups$price),]
prch<-unique(c(raw_wdups$id,raw_wdups$cut,raw_wdups$clarity,raw_wdups$color,raw_wdups$price))
prch<-raw_wdups[matrix(unique(c(raw_wdups$id,raw_wdups$price))),]

#droplist: suggestions, shipping_day, title_s, orderby_short, title, valid, receiveby_short,X_version,


# Clean Measurements
diamonds<-raw_wdups
diamonds$nlength = sapply(strsplit(as.character(diamonds$measurement)," x "),"[",1)
diamonds$nwidth = sapply(strsplit(as.character(diamonds$measurement)," x "),"[",2)
diamonds$nheight = sapply(strsplit(as.character(diamonds$measurement)," x "),"[",3)

"10.42 x 4.25 x 13.22"