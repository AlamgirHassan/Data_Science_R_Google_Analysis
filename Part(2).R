library(tidyverse)
library(gtrendsR)
#Getting dataset
my_data<-gtrends(keyword = 'Machine Learning',geo='',time='today+5-y',gprop = c("web", "news", "images", "froogle", "youtube"))
#Extracting dataset on basics of interest over time
yearly_data<-data.frame(my_data$interest_over_time)
#Creating graph on basics of dates and hits

ggplot(yearly_data,aes(x=date,y=hits))+geom_line(stat="identity",color="blue")+labs(title="Machine Learning Searches on Google",x="Years",y="Total Counts",color="Legend Title\n")+theme_minimal()
