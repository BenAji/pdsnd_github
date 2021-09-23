
ny = read.csv('new_york_city.csv')
wash = read.csv('washington.csv')
chi = read.csv('chicago.csv')

head(ny)

head(wash)

head(chi)

#get the workspace directory
getwd()


#list all the files that are available in the workspace
list.files()

#read to file the csv dataset and assign variable  
ny = read.csv('new_york_city.csv')
#wash = read.csv('washington.csv')
#chi = read.csv('chicago.csv')

head(ny)

#call the ggplot library to have access to all the modules module 
library(ggplot2)

#use the ggplot library on New York dataset to plot histogram on how age and gender affects rental habbits
ggplot(aes(x=Birth.Year), data=subset(ny,!is.na(Gender))) +
  geom_histogram(binwidth=1, color = 'black', fill = '#F79420') + 
  ggtitle('Histogram of Birth Years of the user') +
  labs(x = "Year of Birth") + 
  scale_x_continuous(limits=c(1930,2000),breaks = seq(1930, 2000, 20)) + 
  facet_wrap(~Gender)

#get the exact number of gender doing bikerent in Newyork
table(ny$Gender)

#get the exact number of UserType doing bikerent in Newyork
table(ny$User.Type)

#plot the graph showing counts of users by gender for the New York dataset
ggplot(aes(x=Gender), data=subset(ny,!is.na(Gender))) +
  geom_histogram(stat='count',binwidth=1, color = 'black', fill = '#F79420') + 
  ggtitle('Histogram of Gender count of users') +
  labs(x = "Gender")

#plot the graph showing Age of the users in New York dataset
ggplot(aes(x=Birth.Year), data=subset(ny,!is.na(Gender))) +
  geom_histogram(stat='count',binwidth=1, color = 'black', fill = '#F79420') + 
  ggtitle('Histogram of Birth Years of the user') + 
  #scale_x_continuous(limits=c(1945,2000) +
  labs(x = "Year of Birth")

#display the top rows of the washinghton dataset
head(wash)

#plot the graph showing Type of the users in Washinghton dataset
ggplot(aes(x=User.Type), data=wash) +
  geom_histogram(stat='count',binwidth=1, color = 'black', fill = '#F79420') + 
  ggtitle('Histogram of User Type in washinghton') +
  labs(x = "Type of user")

#get the exact numbers of type-of-Users doing bikerent in Washinghton
table(wash$User.Type)

#summary statistics of washingthon dataset
by(wash$Trip.Duration, wash$User.Type, summary)

#this plots intends to show the station that clients usually starts their trip from
ggplot(aes(x=Start.Station), data=wash) +
  geom_histogram(stat='count') + 
  ggtitle('Histogram of Station for starttrip in Washinghton') +
  scale_y_discrete(limits=c(500,2000))+ #limit the y-axis to stations that has counts up to 500 and above
  labs(x = "Start Stations")

#display the top rows in the chicago dataset
head(chi)

#summary statistics of Chicago dataset
by(chi$Trip.Duration, chi$Gender, summary)

#plot the graph showing Tripduration in Chicago dataset
ggplot(aes(y=Trip.Duration, x=Gender), data=subset(chi,!is.na(Gender))) +
  geom_boxplot(outlier.colour="black", outlier.shape=16, outlier.size=2, notch=FALSE) + 
  ggtitle('Chicago Bike Rental:Gender Trip Duration') + coord_cartesian(ylim = c(0,2000))+
  labs(x = "Gender")

#get the exact number of users type doing bikerent in Chicago
table( chi$User.Type)

#get the exact number of gender doing bikerent in Chicago
table(chi$Gender)

system('python -m nbconvert Explore_bikeshare_data.ipynb')
