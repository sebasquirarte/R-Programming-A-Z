# Movie Ratings Project 
# Part of the UDEMY Course: 'R Programming A-Z: R For Data Science With Real Exercises!' by Kirill Eremenko
# Sebastian Quirarte | 21 Feb 2023 | sebastianquirajus@gmail.com 

# Import data from csv file 
movie_data <- read.csv(file.choose())

head(movie_data)
# Change column names 
colnames(movie_data) = c("Film", "Genre", "CriticRating", "AudienceRating", 
                         "BudgetMillions", "Year")
# Change years to ctegorical variable (factor)
movie_data$Year <- factor(movie_data$Year)

# ------------------------------ Using ggplot -------------------------------- #

library(ggplot2)

# Aesthetics 
ggplot(data = movie_data, aes(x = CriticRating, y = AudienceRating))
# Geometry 
ggplot(data = movie_data, aes(x = CriticRating, y = AudienceRating)) + 
  geom_point()
# Add color 
ggplot(data = movie_data, aes(x = CriticRating, y = AudienceRating, color = Genre)) +
  geom_point()
# Add size 
ggplot(data = movie_data, aes(x = CriticRating, y = AudienceRating, color = Genre,
                              size = BudgetMillions)) + geom_point()

# ----------------------- Histograms and Density Charts ---------------------- #

# Plot histogram 
ggplot(data = movie_data, aes(x = BudgetMillions)) + geom_histogram()
# Change bar size 
ggplot(data = movie_data, aes(x = BudgetMillions)) + geom_histogram(binwidth = 10)
# Add color 
ggplot(data = movie_data, aes(x = BudgetMillions)) + geom_histogram(binwidth = 10, aes(fill=Genre))
# Add border 
ggplot(data = movie_data, aes(x = BudgetMillions)) + geom_histogram(binwidth = 10, aes(fill=Genre), color = "black")

# Using qplot()
qplot(data = movie_data, x = BudgetMillions, fill = Genre, color = I("black"))

# Density chart 
ggplot(data = movie_data, aes(x = BudgetMillions)) + geom_density(aes(fill = Genre), position = "stack")

# ---------------------------------- Layers ---------------------------------- #

# User reviews 
t <- ggplot(data = movie_data, aes(x = AudienceRating))
t + geom_histogram(binwidth = 10, fill = "white", color = "blue")
                                                
# Critic reviews 
t <- ggplot(data = movie_data, aes(x = CriticRating))
t + geom_histogram(binwidth = 10, fill = "white", color = "blue")

# 'Skeleton' plot 
t <- ggplot()

# ------------------------ Statistical Transformations ----------------------- #

# geom_smooth()
u <- ggplot(data = movie_data, aes(x = CriticRating, y = AudienceRating, 
                                   color = Genre))
u + geom_point(size = 1) + geom_smooth(fill = NA)

# Box plots 

# Audience Rating 
u <- ggplot(data = movie_data, aes(x = Genre, y = AudienceRating, color = Genre))
u + geom_point() + geom_boxplot(alpha = 0.7) + labs(x = "Genre", y = "Audience Rating")
# Critic Rating 
c <- ggplot(data = movie_data, aes(x = Genre, y = CriticRating, color = Genre))
c + geom_point() + geom_boxplot(alpha = 0.7) + labs(x = "Genre", y = "Critic Rating")

# Adding 'jitter' 

# Audience Rating 
u <- ggplot(data = movie_data, aes(x = Genre, y = AudienceRating, color = Genre))
u + geom_jitter() + geom_boxplot(alpha = 0.7) + labs(x = "Genre", y = "Audience Rating")
# Critic Rating 
c <- ggplot(data = movie_data, aes(x = Genre, y = CriticRating, color = Genre))
c + geom_jitter() + geom_boxplot(alpha = 0.7) + labs(x = "Genre", y = "Critic Rating")

# ----------------------------------- Facets --------------------------------- #

v <- ggplot(data = movie_data, aes(x = BudgetMillions))
v + geom_histogram(binwidth = 10, aes(fill = Genre), color = "Black") + 
  facet_grid(Genre~., scale="free")

# Facets in scatterplots

# By genre 
s <- ggplot(data = movie_data, aes(x = CriticRating, y = AudienceRating, 
                                   color = Genre))
s + geom_point(size = 1) + facet_grid(Genre~., scale = "free") + labs(x = "Critic Rating",                                                                 y = "Audience Rating")
# By year 
s + geom_point(size = 1) + facet_grid(.~Year, scale = "free") + labs(x = "Critic Rating",                                                            y = "Audience Rating")
# By genre and year
s + geom_point(size = 1) + facet_grid(Genre~Year, scale = "free") + labs(x = "Critic Rating",
                                                                     y = "Audience Rating")

# ------------------------------- Coordinates -------------------------------- #

# Setting axis limits 
s <- ggplot(data = movie_data, aes(x = CriticRating, y = AudienceRating, 
                                   size = BudgetMillions, color = Genre))
s + geom_point() + xlim(50, 100) + ylim(50, 100)

# Zoom in 
v <- ggplot(data = movie_data, aes(x = BudgetMillions))
v + geom_histogram(binwidth = 10, aes(fill = Genre), color = "Black") +
  coord_cartesian(ylim = c(0,50))


