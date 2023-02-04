# Tests the law of large numbers 
# Exercise for the UDEMY Course: 'R Programming A-Z™: R For Data Science With Real Exercises!' by Kirill Eremenko
# Sebastian Quirarte | 30 Jan 2023 | sebastianquirajus@gmail.com 

# INSTRUCTIONS 
# Test the law of large numbers for n random normally distributed numbers with mean = 0, stdev = 1
# Create an R script that will count how many of these numbers fall between -1 and 1 and divide by the total quantity of n 
# You know that E(X) = 68.2%
# Check that mean(Xn) -> E(X) as you rerun your script while increasing n. 


n <- 0
counter <- 0

while(TRUE){
  # Generate random number (mean = 0, stdev = 1)
  x <- rnorm(1)
  # Count numbers generated
  n <- n + 1
  if(x > -1 & x < 1){
    # Count values between -1 and 1
    counter <- counter + 1
  }
  # Calculate mean
  mean <- counter / n
  print(paste("n: ", n, "  counter: ", counter, "  mean: ", mean))
}



