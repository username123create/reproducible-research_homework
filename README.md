# Reproducible research: version control and R

## Questions 1,2 and 3

Here is the link to my logistic_growth repo containing my answers for questions 1,2 and 3: [Logistic Growth repo](https://github.com/username123create/logistic_growth)

## Question 4

***a)** A script for simulating a random_walk is provided in the `question-4-code` folder of this repo. Execute the code to produce the paths of two random walks. What do you observe? (10 points)*

The script simulates the paths of two random walks in 2D space with x and y coordinates. The size of each step is constant (*h = 0.25*), but the direction of each step is generated as a random angle between 0 and 2 pi due to the `runif()` function. Both random walks show 500 steps and start at the coordinates (0,0).

Each time the code is rerun, 2 different random paths are produced. This is because the angles are coded to generate random values for each step and this will change every time the code is run resulting in different and random paths both between the two, and between every other version generated.

When each set of two paths are produced, they show unpredictability and do not demonstrate any trends or patterns. Both paths will show clustering in regions where the angles generated have led to the steps being closer together and not much distance is travellled. They will also show areas of spreading out where angles remain more similar allowing movement in a certain direction rather than tracking back on itself.

***b)** Investigate the term **random seeds**. What is a random seed and how does it work? (5 points)*

Random seeds are number values used to initialise a pseudo-random number generator (PRNG). Using a pseudo-random generator rather than a random generator allows for results to be reproduced. This is because using a same random seed will produce a sequence of random events that will be the same each time this random seed is used.

In the past, there would be books of random numbers published where each page would have a list of random numbers, but each book had the same random numbers on each page. This is the same concept but through computers. It allows experiments that use randomness to be replicated and reproduced.

In our random walk simulator example, it will mean that each time the same random seed number is used to generate angles, the two paths will look the same. This is because the random sequence of angles generated between each of the 500 steps will be the same each time the sequence is rerun as long as the random seed is the same. This allows reproducibility and repeatability.

In R, this works through setting a random seed initially using the `set.seed()` function. The numbers that are put in the brackets will correspond to a different sequence of random numbers. For example, `set.seed(123)` will produce a different sequence of random numbers than `set.seed(456)`.

***c)** Edit the script to make a reproducible simulation of Brownian motion. Commit the file and push it to your forked `reproducible-research_homework` repo. (10 points)*

The edited script can be found here: [Reproducible simulation](https://github.com/username123create/reproducible-research_homework/blob/dev/question-4-code/random_walk.R), or in the `question-4-code section` in the`random_walk.R file`.

***d)** Go to your commit history and click on the latest commit. Show the edit you made to the code in the comparison view (add this image to the **README.md** of the fork). (5 points)*

Below is the comparison of my latest commit showing the insertion of the `set.seed()` function to the script to make a reproducible simulation of Brownian motion. 

<p align="center">

<img src="https://github.com/username123create/reproducible-research_homework/blob/dev/SeedCommitComparison.png" width="600" height="500"/>

</p>

## Question 5

***a)** Import the data for double-stranded DNA (dsDNA) viruses taken from the Supplementary Materials of the original paper into Posit Cloud (the csv file is in the `question-5-data` folder). How many rows and columns does the table have? (3 points)*

There are 33 rows and 13 columns in the table.

***b)** What transformation can you use to fit a linear model to the data? Apply the transformation. (3 points)*

To fit a linear model to the data we need to apply a logarithmic transformation. I used a logarithmic transformation on the values of virion volume and genome length. This can be found in the file I created called `virus_data_analysis.R` in the `Question-5-data` folder

This changes the equation from:

$`V = \alpha L^{\beta}`$

To:

$`log(V() = log(\alpha) + \beta log(L)`$

This now resembles the linear equation $y = c + mx$ and so a linear model can be applied.

***c)** Find the exponent (*$\beta$) and scaling factor ($\alpha$) of the allometric law for dsDNA viruses and write the p-values from the model you obtained, are they statistically significant? Compare the values you found to those shown in **Table 2** of the paper, did you find the same values? (10 points)

In order to find the exponent ($\beta$) and scaling factor ($\alpha$) of the allometric law for dsDNA viruses, I calculated a linear model analysis and used the `summary()` function.

**Value of** $\alpha$:

Log($\alpha$) represents the *intercept* of our model. According to the linear model analysis, the intercept is:

log($\alpha$) = 7.0748.

Therefore:

$\alpha$ = 1181.807

**Value of** $\beta$:

$\beta$ represents the *slope* of our model. According to the linear model analysis, the slope is:

($\beta$) = 1.5152

**The p-values:**

The p-value for the intercept (log($\alpha$) is **2.28e-10**.

The p value for the slope ($\Beta$) is **6.44e-10**.

These are both below 0.01 and so are highly statistically significant values.

**Comparison to Table 2 in paper**

In Table 2 of the paper, the value of $\beta$ (Allometric exponent) of the virus' dsDNA is 1.52. This is the same as the rounded version of our value 1.5152. The table value has a 95% confidence interval of (1.16-1.87) so they are not significantly different.

In table 2 of the paper, the value of $\alpha$ (Scaling factor) of the virus' dsDNA is 1182 which is the same as the rounded version of our value 1181.807. The table value has a 95% confidence interval of 246-5675 and so they are not significantly different.

***d)** Write the code to reproduce the figure shown below. (10 points)*

This code can be found in the `virua_data_analysis.R file` in the `Question-5-data` folder.

\*\**e)* What is the estimated volume of a 300 kb dsDNA virus? (4 points)\*

To calculated the estimated volume of a 300kb dsDNA virus, we can return to our initial equation of:

\$V = $\alpha$ L\^{$\beta$}\$

We can substitute the following values into the equation:

-   $L = 300$
-   \$$/alpha$ = 1181.807\$
-   \$$/beta$ = 1.5152\$

And so:

$V = 1181.807 * 300^1.5152$

$V = 6,697,006$

Therefore, the estimated volume of a 300kb dsDNA virus is 6.697e+06 $nm^3$
