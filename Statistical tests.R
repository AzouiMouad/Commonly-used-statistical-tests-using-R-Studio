### Libraries loading : 

library(tidyverse)
library(skimr)
library(moderndive)

### Data-set loading :

View(mtcars)
view(iris)
 
# T-test :
################################################################################

# # Comparison to mu = 5 :

### Data wrangling : 

T.test.df <- iris %>% 
  filter(Species %in% c("setosa", "versicolor")) %>% 
  select(Species, Sepal.Length)
View(T.test.df)

### Data distribution : 

T.test.df %>% 
  group_by(Species) %>% 
  skim(Sepal.Length)

### Data visualization : 

ggplot(T.test.df) +
  aes(x = Species, y = Sepal.Length) +
  geom_boxplot() +
  geom_hline(yintercept = 5, linetype = "dashed", color = "red") +
  labs(x = "Species", y = "Sepal lentgh", title = "Sepal length of setosa and versicolor")

# H0 : There is no significant difference between the observable and theoretical mean.
# H1 : There exists a significant difference between the observable and theoretical mean.

T.test.df %>% 
  filter(Species == "setosa") %>% 
  select(Sepal.Length) %>% 
t.test(mu = 5, conf.level = 0.95)

T.test.df %>% 
  filter(Species == "versicolor") %>% 
  select(Sepal.Length) %>% 
  t.test(mu = 5, conf.level = 0.95)


# # Two sided T-test :  

### Data wrangling : 

T.test.df <- iris %>% 
  filter(Species %in% c("setosa", "versicolor")) %>% 
  select(Species, Sepal.Length)
View(T.test.df)

### Data distribution : 

T.test.df %>% 
  group_by(Species) %>% 
  skim(Sepal.Length)
  
### Data visualisation : 

ggplot(T.test.df) +
  aes(x = Species, y = Sepal.Length) +
  geom_boxplot() +
  labs(x = "Species", y = "Sepal lentgh", title = "Sepal length of setosa and versicolor")

# H0 : There is no significant difference between the two means.
# H1 : There exists a significant difference between the two means.

t.test(Sepal.Length ~ Species, T.test.df, conf.level = 0.95, alternative = "two.sided")


# # Paired t-test :

### Data wrangling : 
T.test.df.paired <- iris %>% 
  select(Species, Sepal.Length, Petal.Length) %>% 
  filter(Species == "setosa")

### Data distribution : 

T.test.df.paired %>% 
  group_by(Species) %>% 
  skim(Sepal.Length, Petal.Length)

### Data visualization :
ggplot(T.test.df.paired) +
  geom_density(aes(x = Sepal.Length), color = "red") +
  geom_density(aes(x = Petal.Length), color = "blue") +
  geom_vline(aes(xintercept = mean(Petal.Length)), color = "blue", linetype = "dashed") + 
  geom_vline(aes(xintercept = mean(Sepal.Length)), color = "red", linetype = "dashed") +
  labs(x = "Length", title = "Length of Setosa flower's sepals and petals")

# H0 : There is no significant difference between the paired means of petal and sepal length?
# H1 : There exists a significant difference between the paired means of petal and sepal length.

t.test(T.test.df.paired$Sepal.Length, T.test.df.paired$Petal.Length, conf.level = 0.95, paired = TRUE)


################################################################################

# ANOVA : 
################################################################################

# # 1-Way ANOVA : 

### Data wrangling : 

ANOVA.df <- iris %>% 
  select(Species, Petal.Length)
View(ANOVA.df)

### Data distribution : 

ANOVA.df %>% 
  group_by(Species) %>% 
  skim(Petal.Length)

### Data visualization : 

ggplot(ANOVA.df) +
  aes(x = Species, y = Petal.Length) +
  geom_boxplot() +
  labs(x = "Species", y = "Petal length", title = "Petal length for differenet Iris species")

# H0 : There's no significant difference between the three means.
# H1 : There exists a significant difference between the three means.

ANOVA.1 <- aov(Petal.Length ~ Species, ANOVA.df)
summary(ANOVA.1)
TukeyHSD(ANOVA.1)

# # 2-Way ANOVA : 

### Data wrangling : 

ANOVA2.df <- iris %>% 
  select(Species, Petal.Width, Sepal.Length)
View(ANOVA2.df)

### Data distribution : 

ANOVA2.df %>% 
  group_by(Species) %>% 
  skim(Petal.Width, Sepal.Length)

### Data visualization : 

ggplot(ANOVA2.df) +
  aes(x = Species, y = Sepal.Length) +
  geom_boxplot() +
  labs(x = "Species", y = "Sepal Length", title = "Sepal Length for different Iris species")

# H0 : There's no significant interaction between Species and Petal Width on Sepal Length.
# H1 : There's a significant interaction between Species and Petal Width on Sepal Length.

ANOVA.2 <- aov(Sepal.Length ~ Species * Petal.Width, data = ANOVA2.df)
summary(ANOVA.2)
TukeyHSD(ANOVA.2)

################################################################################

# Correlation :
################################################################################

### Data wrangling :

Corr.df <- mtcars %>% 
  select(wt, hp)

View(Corr.df)

### Data distribution :

Corr.df %>% 
  skim()

### Correlation coefficient factor calculation :

# The further the coefficient factor is from 0, the stronger the correlation is.

get_correlation(Corr.df, hp ~ wt)

### Regression table :

regr.model <- lm(hp ~ wt, Corr.df)

regr.model %>% 
  get_regression_table()

### Data visualization : 

ggplot(Corr.df) +
  aes(x = wt, y = hp) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(x = "Weight", y = "Horse power", 
       title = "Relationship between the car's weight and gross horespower")

################################################################################

# Chi square test :
################################################################################

# # Goodness of fit test :

### Data Wrangling : 

View(iris)

Chi.df <- iris %>% 
  mutate(Size = cut(Sepal.Length, 
                    breaks = 3, 
                    labels = c("Small", "Medium", "Large"))) %>% 
  select(Species, Size)

View(Chi.df)

### Data distribution :

table(Chi.df$Size)

### Data Visualization :

ggplot(Chi.df) +
  aes(x = Size) +
  geom_histogram(stat = "count") +
  labs(x = "Size", y = "Proportion", title = "Proportion of each size")

# H0 : There's no significant difference between the tested proportions.
# H1 : There exists a significant difference between the tested proportions.

Chi.df %>% 
  select(Size) %>% 
  table() %>% 
  chisq.test()

# The calculated p_value < alpha value (0.05), the null hypothesis (H0) is then rejected.


# # Test of independence :

### Data distribution : 

table(Chi.df)

### Data Visualization :

Chi.df %>% 
  group_by(Species) %>% 
  ggplot() +
  aes(x = Size, fill = Species) %>% 
  geom_bar() +
  labs(x = "Size", y = "Proportion", title = "Proportion of each petal size for different Iris species")

# H0 : The 2 tested qualitative variables are independent.
# H1 : The 2 tested qualitative variables are not independent.

Chi.df %>% 
  table() %>% 
  chisq.test() %>% 
  .$expected

# The calculated p_value < alpha value (0.05), the null hypothesis (H0) is then rejected.
# Also, none of the table cell's values is less than 5, a Fisher's exact test is not required.

################################################################################