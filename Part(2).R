library(tidyverse)
library(gtrendsR)
#Getting dataset
my_data<-gtrends(keyword = 'Machine Learning',geo='',time='today+5-y',gprop = c("web", "news", "images", "froogle", "youtube"))
#Extracting dataset on basics of interest over time
yearly_data<-data.frame(my_data$interest_over_time)
#Creating data of dates on basic of their years
dates<-format(yearly_data$date,format = "%Y")
#Removing dulplcates from years
dates<-dates[!duplicated(dates)]
#Creating a vector
hits_counts <- c(rep(0, length(dates)))
#This loop will extract dates on basics of their year
#After that it will increment the value of hits of that year
for(i in 1:nrow(yearly_data))
{

  date1<-format(yearly_data[i,1],format = "%Y")

  for(j in 1:length(dates))
  {
    if(date1==dates[j])
    {
      
      hits_counts[j]=hits_counts[j]+1
      break
    }
  }

  
}
#Plotting graph
plot(dates, hits_counts, type = "l",ylim=c(0,100),xlab='Years',ylab='Hit counts',main="Hits with respect to years of 'Machine Learning'")
