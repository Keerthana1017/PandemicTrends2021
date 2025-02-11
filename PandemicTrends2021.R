data_url<- read.csv("https://raw.githubusercontent.com/eparker12/nCoV_tracker/master/input_data/coronavirus_states.csv")

#summary of covid data from data_url
summary(data_url)

# (a) Write the R code to get the subset dataset
data_url$date<-as.Date(data_url$date, format = "%Y-%m-%d")
covid_data_2021<-data_url[data_url$date >= "2021-01-01" & data_url$date <= "2021-12-31", ]

# (b) Write the R code to check the first five observations
head(covid_data_2021, 5)

# (c) Convert the “date” field from character to factor, how many factor levels did you get?
# Answer the question and show your R code

data_url_2021<-read.csv("https://raw.githubusercontent.com/eparker12/nCoV_tracker/master/input_data/coronavirus_states.csv")
data_url_2021$date<- as.factor(data_url_2021$date)
class(data_url_2021$date)
nlevels(data_url_2021$date)
# ANSWER: I converted the date column to a factor and counted the levels. It has 751 levels.

# (d) How many people died from COVID (i.e., new deaths) in Florida in the month of August,2021?
Aug_deaths_fl<-covid_data_2021[covid_data_2021$state == "Florida" & format(covid_data_2021$date, "%Y-%m") == "2021-08", ]
sum(Aug_deaths_fl$new_deaths)


#(e) On June 1, 2021: Which state has the highest cumulative COVID cases? Which state has the 
#highest new COVID cases? Which state has the highest new deaths per 100,000 people?
till_june_01<- covid_data_2021[covid_data_2021$date == "2021-06-01",]
highest_cumulative_cases <- till_june_01 %>% filter(cases == max(cases)) %>% select(state)
highest_cumulative_cases$state
highest_new_cases <- till_june_01 %>% filter(new_cases == max(new_cases)) %>% select(state)
highest_new_cases$state  
highest_new_deaths_per_100k <- till_june_01 %>% filter(newdeathsper100k == max(newdeathsper100k)) %>% select(state)
highest_new_deaths_per_100k$state
# ANSWER:  I filtered the data for June 1, 2021, and then identified the states with the highest cumulative cases,new cases, and new deaths per 100,000 people.

#(f) In June, 2021: Which state has the highest cumulative COVID cases? Which state has the highest new COVID cases
till_june_30<- covid_data_2021[covid_data_2021$date == "2021-06-30",]
highest_cumulative_cases_june_30 <- till_june_01 %>% filter(cases == max(cases)) %>% select(state)
highest_cumulative_cases_june_30$state
highest_new_cases_june_30 <- till_june_01 %>% filter(new_cases == max(new_cases)) %>% select(state)
highest_new_cases_june_30$state 
# ANSWER: I filtered the data for June 2021, then identified the states with the highest cumulative cases and new cases during that month.

#weekly column
covid_data_2021$Weekday <- weekdays(covid_data_2021$date)
head(covid_data_2021, 5) #to check the table

