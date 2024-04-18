# Commonly used statistical tests using R Studio (T-test, ANOVA, Chi², Correlation)

This script was made as an introduction to statistical tests, using R Studio in the Tidyverse environment. ***"Tidyverse"*** is a combination of different packages with multiple uses, ranging from data importation (readr), data tidying (tidyr), and data wrangling (dplyr), to data visualization (ggplot2). In addition to the Tidyverse, this script relies on the ***"skimr"*** package to take a quick glimpse at the distribution of the variables in question, and on the ***"moderndive"*** package to conduct some statistical tests.

The statistical tests are presented as examples, and the datasets used in this script are (mtcars) and (iris), both are available within base R. The iris dataset gives the measurements in centimeters of sepal and petal dimensions of 3 iris species, while the mtcars dataset represents 11 aspects of automobile design and performance for 32 automobiles. The datasets used are simple and can be further examined using the ?dataset_name function for more details.

## T-test:

The T-test is one of the most basic statistical tests; it's a simplified version of the more commonly used ANOVA test. The written code gives 3 variations of the T-test. The first variation (*Comparison to mu*) is used to compare a theoretical mean value (mu) to a real experimental value and determine if there exists a significant difference between the two values. The second variation (*Two-sided*) compares the means of two groups to determine, statistically, if there exists a significant difference between the two group's means or not. The final iteration of the t-test (*paired*) aims to compare the means of 2 variables linked to the same group of observations, hence the paired annotation.

The data were visualized using boxplots and density plots via the ggplot2 package (Tidyverse), while the statistical inference and hypothesis testing were conducted using the **t.test()** function, available in base R, with minor variations to suit each iteration of the t-test.

## ANOVA: 

ANOVA is basically a more complex T-test. While the T-test is used to compare the means of 2 groups, ANOVA is used when the number of groups is more than or equal to 3. *One-Way ANOVA* is used when there's only one independent variable (factor) that divides the dataset into three or more groups, while the *Two-Way ANOVA* is used when there are two independent variables (factors) that categorize the data into multiple groups, creating a grid or matrix of combinations.

The data were visualized using boxplots via the ggplot2 package (Tidyverse), while the statistical inference was examined by first fitting the data into an ANOVA model (**aov()**), doing a summary of the ANOVA model (**summary()**), and finally using the (**TukeyHSD()**) function to do a post hoc test to examine the differences between the groups.

## Correlation:

Correlation is used to describe the strength and direction of the relationship (in case there is a relationship) between two quantitative variables. It helps to predict a variable (explained variable) based on the values of another variable (explanatory variable). This written script follows the Pearson's correlation model.

The data were visualized using a dot plot and geomsmooth plot, fitted onto a linear model (method = "lm") to give a more representative visualization of the correlation factor, via the ggplot2 package (Tidyverse). The correlation coefficient and table were obtained using the **get_correlation()** and **get_correlation_table()** functions, respectively. Both functions are from the "moderndive" package.

## Chi-square:

The chi-square test is a statistical test used to determine whether there is a significant association between categorical variables. The code in question provides two variations of the chi-square test: *the Goodness of Fit test*, used to determine how well an observed frequency distribution fits a theoretical or expected distribution, and a **Test of Independence* test, used to determine whether there is a significant association between two categorical variables in a contingency table.

The data were visualized using histogram plots and bar plots via the ggplot2 package (Tidyverse), while the statistical tests were conducted using the Base R function **chisq.test()**.

### Perspective:

There wasn't much emphasis put onto the datasets used, as I believe this script can be used with any datasets, granted they fit the right type of variables specific to each test, and assuming they go through the right data wrangling procedure before proceeding with the visualization and hypothesis testing.

This code was my first attempt at tackling script writing. As a person coming from a different background than IT, I learned so many things writing this script. It helped me get used to working with R in the Tidyverse environment, to go through biostatistics once again on my own, and to try to better understand its concepts. It also helped me get my GitHub account ready and running, hoping to add more repositories and projects to my humble account in the future.

### References : 

https://moderndive.com/foreword.html

https://www.youtube.com/@RProgramming101
