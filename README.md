---
editor_options: 
  markdown: 
    wrap: 72
---

# Reproducible research: version control and R

**Question 4**

a)  A script for simulating a random_walk is provided in the
    `question-4-code` folder of this repo. Execute the code to produce
    the paths of two random walks. What do you observe? (10 points)/ The
    script simulates the paths of two random walks in 2D space with x
    and y coordinates. The size of each stem is constant (h=0.25) but
    the direction of each step is generated as a random angle between 0
    and 2 pi. Both random walks show 500 steps and start at the
    coordinates (0,0).

Each time the code is rerun, 2 different plots are produced. This is
because the angles generated are random each time and so the paths will
always be random and different.

When each set of plots are produced, the show random, unpredictable
paths that don't demonstrate any trends or patterns. The paths are
generally not similar in terms of the direction they have travelled and
the overall shape of the path. Both graphs do show clustering in certain
regions where steps are close to eachother and not much distance is
travelled. Both also show areas of spreading out where angles remain
similar so more distance is travelled.

b)  Investigate the term **random seeds**. What is a random seed and
    howdoes it work? (5 points)\

Random seeds are used to initialise a pseudo-random number generator
(PRNG). Using a pseudo-random generator rather than a random generator
allows for results to be reproduced. This is because, when using the
same random seed, it will produce a sequence of random events that will
be the same each time. In the past, there would be books of random
numbers published where each page would have a list of random numbers,
but each book had the same random numbers on each page. This is the same
concept but through computers. It allows experiments that use randomness
to be replicated and reproduced.

In R, this works through setting a random seed initially using the
`set.seed()` function. c) Edit the script to make a reproducible
simulation of Brownian motion. Commit the file and push it to your
forked `reproducible-research_homework` repo. (10 points)\
The edited script can be found in the `question-4-code section` in
the`random_walk.R file`.

d)  Go to your commit history and click on the latest commit. Show the
    edit you made to the code in the comparison view (add this image to
    the **README.md** of the fork). (5 points)

Below is the comparison of my latest commit showing the changes I made to the script to make a reproducible sumulation of Brownian motion. The red boxes indicate where in the code these changes were made. I also added descriptions to the code so each step is clear to understand which represent the other changes between the two commits. 

  <p align="center">
     <img src="https://github.com/username123create/logistic_growth/blob/16a2f26b7ee8559340dda31d5f6dff86964ad744/images/CommitComparison.pdf" width="600" height="500">
  </p>



a)  Import the data for double-stranded DNA (dsDNA) viruses taken
    fromthe Supplementary Materials of the original paper into Posit
    Cloud(the csv file is in the `question-5-data` folder). How many
    rows andcolumns does the table have? (3 points)\
    There are 33 rows and 13 columns in the table.

b)  What transformation can you use to fit a linear model to the data?
    Apply the transformation. (3 points)\
    To fit a linear model to the data we need to apply a logarithmic
    transformation. I made logged values of the virion volume and genome
    length data points which can be found in the
    `virua_data_analysis.R file` in the `Question-5-data folder.`

This changes the equation from:

$`V = \alpha L^{\beta}`$

To:

$`Log(V)= Log(\alpha) + \beta^{\Log(L)}`$

This now resembles the linear equation $`y = c + mx`$ and so a linear
model can be applied.

c)  Find the exponent ($\beta$) and scaling factor ($\alpha$) of the
    allometric law for dsDNA viruses and write the p-values from the
    model you obtained, are they statistically significant? Compare the
    values you found to those shown in **Table 2** of the paper, did you
    find the same values? (10 points)\

In order to find the Find the exponent ($\beta$) and scaling factor
($\alpha$) of the allometric law for dsDNA viruses, I calculated the
linear model and used the $summary function$.

**Value of** \alpha: Log(\alpha) represents the Intercept in our model.

The intercept [log(\alpha)] = 7.0748.

Therefore \alpha = 1181.807

**Value of** \beta:

The slope (\beta) = 1.5152

**p values:**

The p value for the intercept (\alpha) is 2.28e-10

The p value for the slope (\Beta) is 6.44e-10.

These are both below 0.01 and so are highly statistically significant.

**Comparison to Table 2 in paper**

In Table 2 of the paper, the value of \beta (Allometric exponent) of the
virus' dsDNA is 1.52. This is the same as the rounded version of our
value 1.5152. The table value has a 95% confidence interval of
(1.16-1.87) so they are not significantly different.

In table 2 of the paper, the value of \alpha (Scaling factor) of the
virus' dsDNA is 1182 which is the same as the rounded version of our
value 1181.807. The table value has a 95% confidence interval of
246-5675 and so they are not significantly different.

d)  Write the code to reproduce the figure shown below. (10 points)/
    This code can be found in the `virua_data_analysis.R file` in the
    `Question-5-data folder.`

e)  What is the estimated volume of a 300 kb dsDNA virus? (4 points)/ We
    can return to our initial equation of:

$`V = \alpha L^{\beta}`$

We can substitute the following values into the equation: $L = 300$
$alpha = 1181.807$ $beta = 1.5152$

And so:

$V = 1181.807 * 300^1.5152$

$V = 6,697,006$
