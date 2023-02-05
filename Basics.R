# Basic concepts in R (Variables, Loops, Vectors)
# Based on the UDEMY Course: 'R Programming A-Z™: R For Data Science With Real Exercises!' by Kirill Eremenko
# Sebastian Quirarte | 30 Jan 2023 | sebastianquirajus@gmail.com 


### TYPES OF VARIABLES ###

# Integer 
x <- 5L # Adding 'L' makes this an integer type 
typeof(x) # > "integer"

# Double (decimal)
y <- 2.4
typeof(4) # > "double" 

# Complex 
z <- 3 + 2i 
typeof(z) # > "complex"

# Character 
a <- "h"
typeof(a) # > "character"

# Logical 
logical_1 <- TRUE 
typeof(logical_1) # > logical 
logical_2 <- F
typeof(logical_2) # > logical 

### USING VARIABLES & OPERATORS ###

var1 <- 4
sqrt(var1)

greeting = "Hello"
name = "Sebas"
print(paste(greeting, name)) # > "Hello Sebas"

# Using logical operators 

4 < 6 # Less than | > TRUE
4 <= 6 # Less than or equal to | > TRUE
10 > 100 # Greater than | > FALSE 
10 >= 100 # Greater than ot equal to | > FALSE 
4 == 5 # Equal to | > FALSE 
4 != 5 # Not equal to | > TRUE 
!(4 == 5) # Not | TRUE
4 == 5 & 5 == 5 # & And | > FALSE
4 == 5 | 5 == 5 # Or | > TRUE
isTRUE(4 == 5) # isTRUE(x) | > FALSE 
isFALSE(4 == 5) # isFALSE() | > TRUE 

### LOOPS ###

# While loops 

# Basic structure 
while(condition) {
  body 
}

# Press 'esc' to break infinite loop 
while(TRUE) {
  print("hello")
}

# Add a counter 
counter = 1
while(counter <= 10) {
  print(counter)
  counter <- counter + 1
}

# For loops 

# Prints the same amount of times as the length of the vector used as condition 
for(i in 1:5){
  print("Hello R!")
}

for(i in 5:15){
  print("Hello R!")
}

# If, else, else if 

# Outputs random number using standard distribution 
rnorm(1)

# Removes a certain variable 
rm(variable)

# If and else if statement example 
rm(answer)
x <- rnorm(1)
if(x > 1){
  answer = "Greater than 1"
} else if (x >= -1){
  answer = "Between -1 and 1"
} else {
  answer = "Less than -1"
}

### VECTORS ### 

# The c function combines values into a vector. A vector in R must contain the same data type in all values. 
v1 <- c(3, 2, 4, 1)
v2 <- c("a", "b", "c", "d")
v3 <- c("hello", "z", "hi")

seq() # sequence function (similar to using ':')
rep() # replicate function 

seq(1,15) # > 1  2  3  4  5  6  7  8  9 10 11 12 13 14 15
1:15 # > 1  2  3  4  5  6  7  8  9 10 11 12 13 14 15

seq(1,15,2) # 1 to 15 with a step 2 | > 1  3  5  7  9 11 13 15
z <- seq(1,15,4) # Generates vector and saves to variable 
z # >  1  5  9 13

rep(2,6) # Generates vector with '2' 6 times | > 2 2 2 2 2 2
rep("a", 10) # > "a" "a" "a" "a" "a" "a" "a" "a" "a" "a"

# You can also replicate vectors 
x <- c(8,10)
rep(x,5) # > 8 10  8 10  8 10  8 10  8 10

# Specific values from vectors using [ ]
numbers = c(3, 5 , 2, 1, 10, 54, 20)
numbers[1] # > 3
numbers[2] # > 5
numbers[3] # > 2

# Vector with specific value removed 
numbers[-1] # > 5  2  1 10 54 20
numbers[-2] # > 3  2  1 10 54 20
numbers[-3] # > 3  5  1 10 54 20

# Range of elements 
numbers[1:3] # > 3 5 2

# Specifies multiple values based on another vector 
numbers[c(3,6,7)] # > 2 54 20
numbers[c(-1,-3,-7)] # > 5  1 10 54

-3:-5 # > -3 -4 -5
numbers[-3:-5] # > 3  5 54 20

### VECTIRIZED OPERATIONS ### 

# Vector arithmetics

v1 <- c(54, 675, 28, 39, 25)
v2 <- c(632, 76, 980, 45, 7)

v3 <- v1 + v2 
v3 # > 686  751 1008   84   32

v1 - v2 # > -578  599 -952   -6   18
v1 * v2 # > 34128 51300 27440  1755   175
v1 / v2 # > 0.08544304 8.88157895 0.02857143 0.86666667 3.57142857
v1 > v2 # > FALSE  TRUE FALSE FALSE  TRUE

# Comparing Vectorized and De-vectorized 

n <- 100
a <- rnorm(n) # Creates vector with n values using rnorm
b <- rnorm(n) # Creates vector with n values using rnorm

# Vectorized approach (faster)
c <- a * b # Creates vector of multiplied values 

# De-vectorized approach (slower)
d <- rep(NA, n) # Creates empty vector of length 'n'
# Creates vector of multiplied values 
for (i in 1:n){
  d[i] <- a[i] * b[i]
}

### FUNCTIONS ### 

rnorm()
c()
seq()
rep()
print()

is.numeric()
is.integer()
is.double()
is.character()

typeof()

sqrt()
paste()

#? function or data set /  help(function or dataset)   > info about function or dataset

### PACKAGES ### 

# Packages are collections of R functions, data, and compiled code in a well-defined format. 
# The directory where packages are stored is called the library. 

# ggplot2 
install.packages("ggplot2") # Installs package
library(ggplot2) # Activates package 

data("diamonds") # Loads dataset
View(diamonds) # Allows to view dataset 
help(diamonds)

? qplot # qplot() is now deprecated in order to encourage the users to learn ggplot() as it makes it easier to create complex graphics.

# Using qplot 
qplot(data=diamonds, carat, price, 
      colour=clarity, facets=.~clarity)

### MATRICES ###

# Creating a basic matrix 

data <- c("a", "b", "c", "d", "e", "f", "g", "h")
basic_matrix <- matrix(data, 2, 4) # data, rows, columns
basic_matrix
# >
#      [,1] [,2] [,3] [,4]
# [1,] "a"  "c"  "e"  "g" 
# [2,] "b"  "d"  "f"  "h" 

# Indexing Matrices 

# Matrix index is [ROW, COLUMN] ex. A[3,4] is 3rd row 4th column 
# To index a whole row or column: A[1,] selects the full first row and A[,1] selects the full first column 
# A Matrix can only have elements of the same type 

# Creating a matrix | Populates by columns by default 
A <- matrix(
  # Taking sequence of elements 
  c(1, 2, 3, 4, 5, 6, 7, 8, 9),
  # No of rows
  nrow = 3,  
  # No of columns
  ncol = 3,        
)

A 
#     [,1]  [,2] [,3]
# [1,]  1    4    7
# [2,]  2    5    8
# [3,]  3    6    9

# Row 1, column 3 
A[1, 3] # > 7
# Row 3, column 2
A[3, 2] # > 6

# To populate by rows: 
A <- matrix(
  # Taking sequence of elements 
  c(1, 2, 3, 4, 5, 6, 7, 8, 9),
  # No of rows
  nrow = 3,  
  # No of columns
  ncol = 3,
  # By default matrices are in column-wise order
  # So this parameter decides how to arrange the matrix
  byrow = TRUE  
)

A 
# >
#       [,1] [,2] [,3]
# [1,]    1    2    3
# [2,]    4    5    6
# [3,]    7    8    9

# Using the rbind() or cbind() function to combine vectors into a matrix 

# Vectors
v1 <- c("a", "b", "c", "d", "e", "f")
v2 <- c("g", "h", "i", "j", "k", "l")
v3 <- c("m", "n", "o", "p", "q", "r")
v4 <- c("s", "t", "u", "v", "w", "x")
v5 <- c("y", "z", "aa", "bb", "cc", "dd")

# Combining vectors into ROWS in a matrix
matrix <- rbind(v1, v2, v3, v4, v5)
matrix
# >
#    [,1] [,2] [,3] [,4] [,5] [,6]
# v1 "a"  "b"  "c"  "d"  "e"  "f" 
# v2 "g"  "h"  "i"  "j"  "k"  "l" 
# v3 "m"  "n"  "o"  "p"  "q"  "r" 
# v4 "s"  "t"  "u"  "v"  "w"  "x" 
# v5 "y"  "z"  "aa" "bb" "cc" "dd"


# Adding columns and rows names
columns <- c("col1", "col2", "col3", "col4", "col5", "col6")
rows <- c("row1", "row2", "row3", "row4", "row5")

colnames(matrix) <- columns 
rownames(matrix) <- rows 

matrix
# >
#      col1 col2 col3 col4 col5 col6
# row1 "a"  "b"  "c"  "d"  "e"  "f" 
# row2 "g"  "h"  "i"  "j"  "k"  "l" 
# row3 "m"  "n"  "o"  "p"  "q"  "r" 
# row4 "s"  "t"  "u"  "v"  "w"  "x" 
# row5 "y"  "z"  "aa" "bb" "cc" "dd"

# Combining vectors into COLUMNS in a matrix
matrix <- cbind(v1, v2, v3, v4, v5)
matrix
# >
#       v1  v2  v3  v4  v5  
# [1,] "a" "g" "m" "s" "y" 
# [2,] "b" "h" "n" "t" "z" 
# [3,] "c" "i" "o" "u" "aa"
# [4,] "d" "j" "p" "v" "bb"
# [5,] "e" "k" "q" "w" "cc"
# [6,] "f" "l" "r" "x" "dd"

# Change values in matrix 
matrix[3, 3] <- "00"
matrix
#       v1  v2  v3   v4  v5  
# [1,] "a" "g" "m"  "s" "y" 
# [2,] "b" "h" "n"  "t" "z" 
# [3,] "c" "i" "00" "u" "aa"
# [4,] "d" "j" "p"  "v" "bb"
# [5,] "e" "k" "q"  "w" "cc"
# [6,] "f" "l" "r"  "x" "dd"






