acc <- read.csv("Accidents.csv")
acc$tot <- as.numeric(gsub(",","", acc[,3])) + as.numeric(gsub(",","", acc[,4])) + as.numeric(gsub(",","", acc[,5])) + as.numeric(gsub(",","", acc[,6])) + as.numeric(gsub(",","", acc[,7])) + as.numeric(gsub(",","", acc[,8])) + as.numeric(gsub(",","", acc[,9])) + as.numeric(gsub(",","", acc[,10]))
mymap <- gvisGeoMap(acc,locationvar = 'States',numvar = 'tot',, options = list(region = 'IN', height = 350,dataMode = 'regions'))
print(mymap,file = "accident.html")
