install.packages("gtrendsR")
library(gtrendsR)
install.packages('ggplot2')
library(ggplot2)
options(max.print=1000000)
#Getting dataset
data<-gtrends(keyword = 'Machine Learning',geo='',time='all',gprop = c("web", "news", "images", "froogle", "youtube"))
#Extracting data on basics of interest by country
countries_data<-data$interest_by_country
#Removing 'NA' values from dataset
countries_data<-na.omit(countries_data)
countries_data<-head(countries_data)
#Plotting histogram
barplot(countries_data$hits,xlab = 'Countries',ylab = 'Hits',names.arg = countries_data$location,main="Google Trends of 'Machine Learning' in Countries",col='blue',border='black',las=2)


