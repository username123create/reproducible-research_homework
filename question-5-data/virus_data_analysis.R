VirusData <- read.csv("Cui_etal2014.csv")

# Question 5a
str(VirusData)
## 33 rows and 13 columns

# To linearise the equation we can take logs of the virion volume and genome length

# Question 5b
VirionVolumeLog <- log(VirusData$Virion.volume..nm.nm.nm.)
GenomeLengthLog <- log(VirusData$Genome.length..kb.)

# Question 5c
LinearModel <- lm(VirionVolumeLog ~ GenomeLengthLog, data = VirusData)
LinearModel

# Find Beta (slope) and logAlpha (intercept) values
summary(LinearModel)

# logAlpha (Intercept) = 7.0748
# Therefore alpha = e^7.0748
exp(7.0748)
# Alpha (intercept) = 1181.807
# Beta (Slope) = 1.5152

#Now find the p values 
summary(LinearModel)
# The p value for the intercept (alpha) is 2.28e-10
# The p value for the slope (Beta) is 6.44e-10. 


# Question 5d
## Write code to reproduce figure
library(ggplot2)

AllometricPlot <- ggplot(data = VirusData, aes(x = GenomeLengthLog, y = VirionVolumeLog)) + 
  geom_point(size = 2) + 
  xlab("log [Genome length (kb)]") + 
  ylab("log [Virion volume (nm3)]") + 
  theme_bw() + 
  geom_smooth(method = lm) + 
  theme(
    axis.title.x = element_text(face = "bold"),
    axis.title.y = element_text(face = "bold")
  )
AllometricPlot

ggsave("AllometricPlot.png", width = 8, height = 5)


#Question 5e
## V = alpha * L^Beta
## Log(V) = Log(alpha) + Beta * Log(L)

#Where L = 300kb

# V = 1181.807 * 300^1.5152

1181.807 * (300^1.5152)
# 6,697,006


