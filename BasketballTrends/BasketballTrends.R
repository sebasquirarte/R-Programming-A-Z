# 'BASKETBALL TRENDS' Project - Analyzes stats from 10 best earning NBA players from 2005-2014.
# Part of the UDEMY Course: 'R Programming A-Z™: R For Data Science With Real Exercises!' by Kirill Eremenko
# Sebastian Quirarte | 4 Feb 2023 | sebastianquirajus@gmail.com 

# NOTE: Run 'BasketBallData.R' first

# View statistics 
Salary
Games 
MinutesPlayed 
FieldGoals
FieldGoalAttempts
Points

# Getting specific value from matrix 
Games
rownames(Games)
colnames(Games)
Games["LeBronJames", "2012"] # > 76

# Matrix operations 
FieldGoals / Games

# Rounding 
round(FieldGoals / Games, 1) # Rounds to one decimal place 
round(MinutesPlayed / Games, 1)

# Plotting columns of matrices using matplot() function 
matplot(FieldGoals) # Plots columns
t(FieldGoals) # Transposes matrix 
matplot(t(FieldGoals)) # Plots columns of transposed matrix 

# Format graph 
matplot(t(FieldGoals), type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft", cex=0.6, inset=0.01, legend=Players, col=c(1:4,6), pch=15:18, horiz=F)

# Plotting player accuracy
matplot(t(FieldGoals/FieldGoalAttempts), type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft", cex=0.5, inset=0.01, legend=Players, col=c(1:4,6), pch=15:18, horiz=F)

# Subsetting 
Games[1:3,6:10] # Subset matrix of the first three rows and columns 6 through 10 
Games[c(1,10),] # Subset of first and tenth rows 
Games[,c("2008","2009")] # Subset of values in columns "2008" and "2009"

# Visualizing subsets 
data <- MinutesPlayed[1,,drop=F]
matplot(t(data), type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players[1], col=c(1:4,6), pch=15:18, horiz=F)

# Creating a function 
myplot <- function(stat, player){
  data <- stat[player,,drop=F]
  matplot(t(data), type="b", pch=15:18, col=c(1:4,6))
  legend("bottomleft", inset=0.01, legend=Players[player], col=c(1:4,6), pch=15:18, horiz=F)
}

# Plots statistic of interest of desired players
myplot(Salary, 1:10)
myplot(Points, 1:10)
myplot(MinutesPlayed, 1:10)






