# Demographic Analysis Project & Basics of Dataframes 
# Part of the UDEMY Course: 'R Programming A-Z: R For Data Science With Real Exercises!' by Kirill Eremenko
# Sebastian Quirarte | 21 Feb 2023 | sebastianquirajus@gmail.com 

# Project Brief: 
# Analyzes the World's demographic trends by producing a scatterplot illustrating birth rate and internet usage statistics by country. 
# Scatterplot is also categorized by each country's income groups. 

# Data source: https://www.superdatascience.com/pages/rcourse

# Import data from 'Demographic-Data.csv' with 'read.csv(file.choose())'

stats <- read.csv(file.choose())
stats

# Import data from 'Demographic-Data.csv' by setting working directory (wd) and reading data

# View current wd 
getwd()
# Set wd (Mac)
setwd("C:\\Users\\Sebas\\Desktop\\R\\R Programming A-Z\\Project - Demographic Analysis")
# Set wd (Windows)
setwd("/Users/sebas/desktop/R/R Programming A-Z/Project - Demographic Analysis")
# Open file from wd 
stats <- read.csv("Demographic-Data.csv")
stats 

# ------------------------------- Exploring Data ----------------------------- #

# Number of rows in dataframe 
nrow(stats) # > 195
# Number of columns in dataframe 
ncol(stats) # > 5

# Outputs first rows of dataframe, default value = 6
head(stats)
# Outputs first 10 rows of dataframe
head(stats,10)

# Outputs last rows of dataframe, default value = 6
tail(stats)
# Outputs last 10 rows of dataframe
tail(stats,10)

# Stucture (str) of a dataframe 
str(stats)

# Summary of data in dataframe 
summary(stats)

# Make variables (columns) into factor data type
stats$Income.Group <- factor(stats$Income.Group)

# ---------------------------- Using the '$' sign ---------------------------- #

# Outputs one specific variable (column) 
stats$Country.Name
stats$Birth.rate
stats$Income.Group

# Outputs a specific value from a variable (column)
stats$Country.Code[3] # > "AGO"

# Outputs levels of a factor data type 
levels(stats$Income.Group)

# ----------------------------- Basic Operations ----------------------------- #

# Subsetting 
stats[1:10,]
stats[1:30,]
stats[c(9,45),]

# Multiply or add column values 
stats$Birth.rate * stats$Internet.users
stats$Birth.rate + stats$Internet.users

# Add a new column 
stats$My.Calc <- stats$Birth.rate * stats$Internet.users
stats # View modified dataframe 
# Add vector as a new column 
stats$Vect <- 1:5
stats

# Remove a column
stats$My.Calc <- NULL
stats$Vect <- NULL
stats

# --------------------------- Filtering a Dataframe -------------------------- #

# Create a filter 
filter <- stats$Internet.users < 2
# Outputs dataframe values that pass filter 
stats[filter,]

# The filter condition can also be set directly 
stats[stats$Birth.rate > 40,]

# Multiple simultaneous filters
stats[stats$Birth.rate > 40 & stats$Internet.users < 2,]

# Filter by categorical values 
stats[stats$Income.Group == "Low income",]
levels(stats$Income.Group) # View levels 

# Find information about a specific country 
stats[stats$Country.Name == "Malta",]

# ------------------------- Introduction to qplot() -------------------------- #

# qplot() is part of the ggplot2 package 
install.packages("ggplot2")
library(ggplot2)
stats

# CREATING GRAPHS 

# Setting x axis value, creates bar graph
qplot(data = stats, x = Internet.users)
# Setting x and y axis values, creates strip plot
qplot(data  = stats, x = Income.Group, y = Birth.rate, 
      xlab = "Income Group", ylab = "Birth Rate")
# Change size
qplot(data = stats, x = Income.Group, y = Birth.rate, size = I(3)) # Add I() to size value to avoid creating a legend 
# Change color
qplot(data = stats, x = Income.Group, y = Birth.rate, xlab = "Income Group", 
      ylab = "Birth Rate", color = Income.Group) + theme(legend.position="none") 
# Create box plot
qplot(data = stats, x = Income.Group, y = Birth.rate, geom = "boxplot", 
      color = Income.Group, xlab = "Income Group", 
      ylab = "Birth Rate") + theme(legend.position="none")
# Create violin plot 
qplot(data = stats, x = Income.Group, y = Birth.rate, geom = "violin", 
      color = Income.Group, xlab = "Income Group", 
      ylab = "Birth Rate") + theme(legend.position="none") 
# Modify violin plot
qplot(data = stats, x = Income.Group, y = Birth.rate, geom = "violin", 
      trim = F, color = Income.Group, xlab = "Income Group", 
      ylab = "Birth Rate") + theme(legend.position="none") 

# ---------------------- Visualizing Data with qplot() ----------------------- #

# Creates scatterplot 
qplot(data = stats, x = Internet.users, y = Birth.rate)
# Modify scatterplot, changing size, and modifying color by income group 
qplot(data = stats, x = Internet.users, y = Birth.rate,
      size = I(2), color = Income.Group)

# --------------------------- Creating dataframes ---------------------------- #

# Execute below code to generate three new vectors
Countries_2012_Dataset <- c("Aruba","Afghanistan","Angola","Albania","United Arab Emirates","Argentina","Armenia","Antigua and Barbuda","Australia","Austria","Azerbaijan","Burundi","Belgium","Benin","Burkina Faso","Bangladesh","Bulgaria","Bahrain","Bahamas, The","Bosnia and Herzegovina","Belarus","Belize","Bermuda","Bolivia","Brazil","Barbados","Brunei Darussalam","Bhutan","Botswana","Central African Republic","Canada","Switzerland","Chile","China","Cote d'Ivoire","Cameroon","Congo, Rep.","Colombia","Comoros","Cabo Verde","Costa Rica","Cuba","Cayman Islands","Cyprus","Czech Republic","Germany","Djibouti","Denmark","Dominican Republic","Algeria","Ecuador","Egypt, Arab Rep.","Eritrea","Spain","Estonia","Ethiopia","Finland","Fiji","France","Micronesia, Fed. Sts.","Gabon","United Kingdom","Georgia","Ghana","Guinea","Gambia, The","Guinea-Bissau","Equatorial Guinea","Greece","Grenada","Greenland","Guatemala","Guam","Guyana","Hong Kong SAR, China","Honduras","Croatia","Haiti","Hungary","Indonesia","India","Ireland","Iran, Islamic Rep.","Iraq","Iceland","Israel","Italy","Jamaica","Jordan","Japan","Kazakhstan","Kenya","Kyrgyz Republic","Cambodia","Kiribati","Korea, Rep.","Kuwait","Lao PDR","Lebanon","Liberia","Libya","St. Lucia","Liechtenstein","Sri Lanka","Lesotho","Lithuania","Luxembourg","Latvia","Macao SAR, China","Morocco","Moldova","Madagascar","Maldives","Mexico","Macedonia, FYR","Mali","Malta","Myanmar","Montenegro","Mongolia","Mozambique","Mauritania","Mauritius","Malawi","Malaysia","Namibia","New Caledonia","Niger","Nigeria","Nicaragua","Netherlands","Norway","Nepal","New Zealand","Oman","Pakistan","Panama","Peru","Philippines","Papua New Guinea","Poland","Puerto Rico","Portugal","Paraguay","French Polynesia","Qatar","Romania","Russian Federation","Rwanda","Saudi Arabia","Sudan","Senegal","Singapore","Solomon Islands","Sierra Leone","El Salvador","Somalia","Serbia","South Sudan","Sao Tome and Principe","Suriname","Slovak Republic","Slovenia","Sweden","Swaziland","Seychelles","Syrian Arab Republic","Chad","Togo","Thailand","Tajikistan","Turkmenistan","Timor-Leste","Tonga","Trinidad and Tobago","Tunisia","Turkey","Tanzania","Uganda","Ukraine","Uruguay","United States","Uzbekistan","St. Vincent and the Grenadines","Venezuela, RB","Virgin Islands (U.S.)","Vietnam","Vanuatu","West Bank and Gaza","Samoa","Yemen, Rep.","South Africa","Congo, Dem. Rep.","Zambia","Zimbabwe")
Codes_2012_Dataset <- c("ABW","AFG","AGO","ALB","ARE","ARG","ARM","ATG","AUS","AUT","AZE","BDI","BEL","BEN","BFA","BGD","BGR","BHR","BHS","BIH","BLR","BLZ","BMU","BOL","BRA","BRB","BRN","BTN","BWA","CAF","CAN","CHE","CHL","CHN","CIV","CMR","COG","COL","COM","CPV","CRI","CUB","CYM","CYP","CZE","DEU","DJI","DNK","DOM","DZA","ECU","EGY","ERI","ESP","EST","ETH","FIN","FJI","FRA","FSM","GAB","GBR","GEO","GHA","GIN","GMB","GNB","GNQ","GRC","GRD","GRL","GTM","GUM","GUY","HKG","HND","HRV","HTI","HUN","IDN","IND","IRL","IRN","IRQ","ISL","ISR","ITA","JAM","JOR","JPN","KAZ","KEN","KGZ","KHM","KIR","KOR","KWT","LAO","LBN","LBR","LBY","LCA","LIE","LKA","LSO","LTU","LUX","LVA","MAC","MAR","MDA","MDG","MDV","MEX","MKD","MLI","MLT","MMR","MNE","MNG","MOZ","MRT","MUS","MWI","MYS","NAM","NCL","NER","NGA","NIC","NLD","NOR","NPL","NZL","OMN","PAK","PAN","PER","PHL","PNG","POL","PRI","PRT","PRY","PYF","QAT","ROU","RUS","RWA","SAU","SDN","SEN","SGP","SLB","SLE","SLV","SOM","SRB","SSD","STP","SUR","SVK","SVN","SWE","SWZ","SYC","SYR","TCD","TGO","THA","TJK","TKM","TLS","TON","TTO","TUN","TUR","TZA","UGA","UKR","URY","USA","UZB","VCT","VEN","VIR","VNM","VUT","PSE","WSM","YEM","ZAF","COD","ZMB","ZWE")
Regions_2012_Dataset <- c("The Americas","Asia","Africa","Europe","Middle East","The Americas","Asia","The Americas","Oceania","Europe","Asia","Africa","Europe","Africa","Africa","Asia","Europe","Middle East","The Americas","Europe","Europe","The Americas","The Americas","The Americas","The Americas","The Americas","Asia","Asia","Africa","Africa","The Americas","Europe","The Americas","Asia","Africa","Africa","Africa","The Americas","Africa","Africa","The Americas","The Americas","The Americas","Europe","Europe","Europe","Africa","Europe","The Americas","Africa","The Americas","Africa","Africa","Europe","Europe","Africa","Europe","Oceania","Europe","Oceania","Africa","Europe","Asia","Africa","Africa","Africa","Africa","Africa","Europe","The Americas","The Americas","The Americas","Oceania","The Americas","Asia","The Americas","Europe","The Americas","Europe","Asia","Asia","Europe","Middle East","Middle East","Europe","Middle East","Europe","The Americas","Middle East","Asia","Asia","Africa","Asia","Asia","Oceania","Asia","Middle East","Asia","Middle East","Africa","Africa","The Americas","Europe","Asia","Africa","Europe","Europe","Europe","Asia","Africa","Europe","Africa","Asia","The Americas","Europe","Africa","Europe","Asia","Europe","Asia","Africa","Africa","Africa","Africa","Asia","Africa","Oceania","Africa","Africa","The Americas","Europe","Europe","Asia","Oceania","Middle East","Asia","The Americas","The Americas","Asia","Oceania","Europe","The Americas","Europe","The Americas","Oceania","Middle East","Europe","Europe","Africa","Middle East","Africa","Africa","Asia","Oceania","Africa","The Americas","Africa","Europe","Africa","Africa","The Americas","Europe","Europe","Europe","Africa","Africa","Middle East","Africa","Africa","Asia","Asia","Asia","Asia","Oceania","The Americas","Africa","Europe","Africa","Africa","Europe","The Americas","The Americas","Asia","The Americas","The Americas","The Americas","Asia","Oceania","Middle East","Oceania","Middle East","Africa","Africa","Africa","Africa")

# Create a new dataframe (slower method)
mydf <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset, Regions_2012_Dataset)
# View dataframe
mydf
# Set column names 
colnames(mydf) <- c("Country", "Code", "Region")
# View updated datframe
head(mydf)

rm(mydf)

# Create a dataframe (faster method)
mydf <- data.frame(Countries=Countries_2012_Dataset, Codes=Codes_2012_Dataset, Regions=Regions_2012_Dataset)
head(mydf)

# --------------------------- Merging dataframes ----------------------------- #

head(stats)
head(mydf)

# Using the merge() function 
merged_df <- merge(stats, mydf, by.x = "Country.Code", by.y = "Codes")
head(merged_df)
# Remove extra 'Countries' column (has same data as 'Country.name')
merged_df$Countries <- NULL
head(merged_df)
str(merged_df)

# ------------------- Visualizing Data with qplot() pt.2 --------------------- #

qplot(data = merged_df, x = Internet.users, y = Birth.rate, color = Regions,
      xlab = "Internet Users", ylab = "Birth Rate")


