VirusData <- read.csv("Cui_etal2014.csv")

str(VirusData)
## 33 rows and 13 columns

# To linearise the equation we can take logs of the virion volume and genome length

VirionVolumeLog <- log(VirusData$Virion.volume..nm.nm.nm.)
GenomeLengthLog <- log(VirusData$Genome.length..kb.)

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
# The p value for the intercept (alpha) is 2.28e-10
# The p value for the slope (Beta) is 6.44e-10. 

#In Table 2 of the paper, the value of Beta (Allometric exponent) of the dsDNA of the viruses is 1.52 which is very similar to our value of 1.5152. In the table it has a 95% confidence interval of (1.16-1.87) so they are not statistically significantly different. 
#In table 2 of the paper, the value of alpha (Scaling factor) is 1,182 of the dsDNA of the viruses which is very similar to our value of 1181.807. In the table, it has a 95% confidence interval of 246-5675 and so they are not statistically significantly different. 

#Both are highly significant as smaller than 0.05.

## V = alpha * L^Beta

## Log(V) = Log(alpha) + Beta * Log(L)

# Want to find Beta and Alpha and write the p-values from model to see if stat sig. 
# Compare to table 2 of paper 

# Write code to reproduce figure

library(ggplot2)

ggplot(data = VirusData, aes(x = GenomeLengthLog, y = VirionVolumeLog)) + 
  geom_point(size = 2) + 
  xlab("log [Genome length (kb)]") + 
  ylab("log [Virion volume (nm3)]") + 
  theme_bw() + 
  geom_smooth(method = lm) + 
  theme(
    axis.title.x = element_text(face = "bold"),
    axis.title.y = element_text(face = "bold")
  )

## V = alpha * L^Beta
## Log(V) = Log(alpha) + Beta * Log(L)

#Where L = 300kb

# V = 1181.807 * 300^1.5152

1181.807 * (300^1.5152)
# 6,697,006


