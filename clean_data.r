library(Hmisc)
library(corrplot)

raw<-read.csv("./Data/2015-11-06.csv")

sapply(raw,levels)

#droplist: suggestions, shipping_day, title_s, orderby_short, title, valid, receiveby_short,X_version,