#install.packages("ggplot2")
#install.packages("gridExtra")

library(ggplot2)
library(gridExtra)

random_walk  <- function (n_steps) {
  
  set.seed(1234) # seed 1234 chosen
  
  df <- data.frame(x = rep(NA, n_steps), y = rep(NA, n_steps), time = 1:n_steps)
  
  df[1,] <- c(0,0,1) # Starting point of random walk 
  
  for (i in 2:n_steps) { # For loop starts at i = 2 and runs until i = n_steps
    
    h <- 0.25 # Constant height 
    
    angle <- runif(1, min = 0, max = 2*pi) # random angle generated between 0 and 2 pi
    
    df[i,1] <- df[i-1,1] + cos(angle)*h # cos() changes x-direction 
    
    df[i,2] <- df[i-1,2] + sin(angle)*h # sin() changes y direction
    
    df[i,3] <- i
    
  }
  
  return(df)
  
}

data1 <- random_walk(500) # 500 steps in this random walk (with seed set earlier)

plot1 <- ggplot(aes(x = x, y = y), data = data1) +
  
  geom_path(aes(colour = time)) +
  
  theme_bw() +
  
  xlab("x-coordinate") +
  
  ylab("y-coordinate")

data2 <- random_walk(500) # 500 steps in this random walk (with same seed set earlier)

plot2 <- ggplot(aes(x = x, y = y), data = data2) +
  
  geom_path(aes(colour = time)) +
  
  theme_bw() +
  
  xlab("x-coordinate") +
  
  ylab("y-coordinate")

grid.arrange(plot1, plot2, ncol=2)

