## PS 2
## Omar Abdelsalam, 3042974730

## Lists

## 1: Create a list called my_list with the three following items. Name them "char_vec", "char_mat", and 
# "list". Draw this list as a train with cargo in the space below.

list_el_1 <- "crane"
list_el_2 <- matrix(c("a", "b", "c", "d"))
list_el_3 <- list(c(3.2, 5.7, 9), c(FALSE, TRUE))

my_list <- list(char_vec = list_el_1, char_mat = list_el_2, list = list_el_3)
print(my_list)

# Train my_list: Car > char_vec[["crane"]] > char_mat[[matrix(c("a", "b", "c", "d"))]]
# > list[[Train list_el_3: Car > x1[[3.2, 5.7, 9]] > x2[[FALSE, TRUE]]]]

# 2: The same list but without char_mat
my_list[-2]

# 3: The character string "crane"
my_list$char_vec[[1]]

# 4: The element "d"
my_list$char_mat[[4]]

# 5: The element "d" repeated several times to form a character vector of length 4.
rep(my_list$char_mat[[4]], times=4)

# 6: The double vector as the sole element of the list
my_list$list[[1]]

# 7: The value TRUE
my_list$list[[2]][2]

## Control Flow

# 8: Write an if statement that takes an exam score like score <- 93 and returns "A" if the score is greater than 90.
score <- 93
if(score > 90)
  {
  print("A")
}

# 9. Write an if statement that takes a single integer n and prints “even” if n is divisible by 2, “odd” otherwise.
# Test your code with n <- 7 and n <- 16. (*Hint 1: experiment with the modulo operator %%, e.g 3 %% 2.)
n <- 7
if(n %% 2 == 0)
  {
  print("even")
} else {
  print("odd")
}

# 10. Extend your previous answer to return letters grades of A, B, C, or “no pass” if the score is in the 90s, 
# 80s, 70s, or less than 70, respectively.

if(score >= 90) {
  print("A")
} else if(score < 90 && score >= 80) {
  print("B")
} else if(score < 80 && score >= 70) {
  print("C")
} else {
  print("no pass")
}


# 11. On the lines provided below, complete the code to iterate through the vector x and print its contents.
# For this question, the iterator, i, should take as its values the character string elements of x. 
# (Hint: see Option 3 in the slides)
x <- c("apple", "banana", "cherry")

for(i in x) {
  print(i)
}

# 12. Repeat the question but this time, the iterator, i, should take as its values the integers from 1 to 3. 
# (Hint: see Option 1 in the slides)
for(i in 1:length(x)) {
  print(x[i])
}

# 13. Write a for loop that uses x and prints the following output: 
# Fruit 1: apple
# Fruit 2: banana
# Fruit 3: cherry
for(i in 1:length(x)){
  print(paste0("Fruit ", i, ": ", x[i]))
}

# 14. Using a for-loop (don’t cheat with vectorization!), change each of the temperatures of temps_c 
# one-by-one so that they are converted from degrees Celcius to Fahrenheit.
temps_c <- c(0, 10, 20, 30)
for(i in 1:length(temps_c)){
  temps_f <- temps_c[i] * (9/5) + 32
  temps_c[i] <- temps_f
}
print(temps_c)

# 15. For-loops, like if-else statments, can be nested: inside the two for-loops below, 
# your code has access to both of the iterators i and j. Fill in the code below to turn m from 
# a matrix of 0s to a multiplication table showing the products of the integers 1, 2, 3 with one another.
m <- matrix(rep(0, 9), nrow = 3)
for (i in 1:3) {
  for(j in 1:3) {
    m[i, j] <- i*j 
  }
}
rownames(m) <- c("1", "2", "3")
colnames(m) <- c("*1", "*2", "*3")
print(m)

# 16. For fun: Run the following code and view the result.
# plot(0, 0) makes a scatterplot with a single point at (0, 0). 
# points(x, y) will add a point to your plot at (x, y) and runif() works like rnorm() except 
# it generates 1 random uniform number between 0 and 1.
# Modify this code so that your random points appear uniformly along the unit circle 
# (a circle centered at (0, 0) with radius one) instead of uniformly in the upper right quadrant.
plot(0, 0)
for(i in 1:100) {
points(runif(1, min=0, max=1), runif(1, min=0, max=1))
}

# 17. For even more fun: Go onto the class JupyterHub to access the Data In Trees files. 
# Write an R script that uses a for loop to read all of the text file and forms a list 
# where the first element is a character vector named song and the second element is a double vector named distance. 
# The element index in each vector should correspond to the same student’s index card.
# If you figure it out, please share your R script on Ed!

## Functions

# 18: Define a function called f_to_c() that converts temperature in Fahrenheit to Celcius.
f_to_c <- function(temp_c)
{
  (temp_c-32) * (5/9)
}

# 19: Define a function that simulates the result of flipping a coin with sides “heads” and “tails”. 
# Generalize it to be able to simulate an unfair coin, i.e. a coin that does not land “heads” with probability 1/2. (see ?sample())

flipcoin <- function(heads = 0.5, tails = 0.5)
{
  coin <- c("heads", "tails")
  sample(coin, size=1, prob=c(heads, tails))
}
flipcoin()

# 20: Define a function called drop_n_lowest(x, n) that takes two arguments: 
# x, an atomic vector and n, the number of lowest elements to drop. It should return x with the lowest n elements removed. 
# Test your function on a short numeric vector to ensure it works

drop_n_lowest <- function(x = c(1), n = 0)
{
  x <- sort(x, decreasing=FALSE)
  x <- x[(n+1):length(x)]
  print(x)
}
drop_n_lowest(x=c(23, 22, 21, 20, 19), n = 2)

# 21. What are the pros and cons of defining this function with a default of n = 1?
# The pros of defining this function with n=1 means that it will always drop the lowest value if a specified amount of values is not
# given. However, if a vector is empty, it might cause an NA to appear and throw off the intention of the code.

# 22. Define a function called check_water_temp() that takes a temperature value and does the following:
#1. Returns "freezing" if the supplied temp is below 32 degrees F.
#2. Returns "boiling" if the supplied temp is above 212 degrees F¹.
#3. Returns the same numerical temperature that was input if its between 32 and 212 F.
#4. Allows the user to toggle between Fahrenheit or Celcius (but defaults to F) for the units of their input

check_water_temp <- function(temp = 0, celsius = F)
{
  if(celsius == TRUE)
    {
    temp <- f_to_c(temp)
    if(temp < f_to_c(32))
      {
      print("freezing")
    } else if(temp > f_to_c(212))
    {
      print("boiling")
    } else
    {
      print(temp)
    }
  }
  else if(temp < 32)
    {
    print("freezing")
  } else if(temp > 212)
  {
    print("boiling")
  } else
  {
    print(temp)
  }
}

## Factors and Data Frames

# 23. Convert the following character vector to a factor and make a barplot to visualize its distribution 
# (provide your code and sketch of the barplot if writing the PS by hand).

opinion <- c("dislike", "neutral", "dislike", "love", "like", "like")
opfactor <- factor(opinion)
print(opfactor)
barplot(summary(opfactor))

# 24. Add the possibility for an additional level named "despise". 
# Then, reorder the factor sensibly from most negative to most positive and remake your barplot.

newlevels <- c("despise", "dislike", "neutral", "like", "love")
opfactor <- factor(opinion, newlevels, ordered=TRUE)
barplot(summary(opfactor))

# 25. Consider the factor below. Without running the code, predict what as.integer(size) returns
# then explain why the answer would change if the factor had been created without the levels argument

size <- factor(c("M", "S", "L", "S"), levels = c("S", "M", "L"), ordered = TRUE)
# Expecting that as.integer(size) will return a list of 2, 1, 3, 1 (with the order of levels being S=1, M=2, L=3).
as.integer(size)
# This answer would change if the factor was created without levels as it would automatically assign default levels
# to the list, making L 1, M 2, and S 3 based on its order in the UTF8 language.
size <- factor(c("M", "S", "L", "S"))
as.integer(size)
summary(size)
# 26. summary() is a function whose behavior depends on the class of its argument. 
# Describe, in a sentence each, what summary() returns for 
# (a) a numeric vector
# (b) a factor
# (c) a data frame. 
# Why is it useful that one function name can do all three?

# A numeric vector's summary returns a minimum, 1st quarter, median, mean, 3rd quarter, and a maximum.
# A factor's summary returns the levels printed in a single vector and the frequency of each level.
# A data frame's summary returns both the frequency of a factor and the min/1stq and so on from a numeric vector.
# It's useful for one function name to do all three as it helps provide the necessary information for each structure.

# 27. What are the dimensions of the (iris) data frame?
summary(iris) # There are 150 values of 5 variables

# 28. What is the unit of observation (i.e. what is in each row)?
# They are sepal length, width, pedal length, width, and species).

# 29. What is the type of each of the atomic vectors?
# Each of the length vectors are doubles while the species vector is an integer as a factor.

# 30. How can you create a new data frame that has the same number of rows but excludes the columns dealing with sepals
# without using data.frame()?

iris[,3:5]

# 31. Shift the name column in star_wars to be the row names of that data frame. 
# That’s to say, use it to populate the row names and then remove it as a column.

star_wars <- data.frame(
name = c("Anakin", "Padme", "Luke", "Leia"),
gender = c("male", "female", "male", "female"),
height = c(1.88, 1.65, 1.72, 1.50),
weight = c(84, 45, 77, 49)
)

row.names(star_wars) <- star_wars[,1]
star_wars[,-1]

# 33. A data frame is a named list of vectors of the same length. 
# Given that, predict what happens for each of the following and explain your reasoning.
length(star_wars)
# I predict this will return the number of columns in the data frame as they are the arguments of declaring the data frame. 
data.frame(x = 1:4, y = c("a", "b"))
# This will return a new data frame with column 1 through 4 and another column with a b a b.
#data.frame(x = 1:4, y = c("a", "b", "c"))
# This will return an error since there are 4 items in the first vector and 3 in the second, which isn't divisible.

# 34. Convert star_wars to a tibble with as_tibble(), 
# then compare the output of star_wars[, "height"] to star_wars_tbl[, "height"]. 
# What class is each result? Which behavior do you find less surprising, and why?
library(tibble)
star_wars_tbl <- as_tibble(star_wars)
star_wars[, "height"]
star_wars_tbl[, "height"]
class(star_wars)
class(star_wars_tbl)
# The regular data frame returns a vector with the heights. The tibble returns a column with each height in a 4x1 graph.
# The data frame has a class of data frame, and the tibble has three classes: tbl_df, tbl, and data frame.
# I find the data frame behavior to be less surprising considering it's a data frame with its own declaration rather than a tibble
# which is a package of three separate classes.

## Data Wrangling I

day_at_cal <- data.frame(weekday = c("Mon", "Mon", "Tue", "Tue", "Wed", "Wed"), 
study_spot = c("Moffitt", "Doe", "Cory", "MLK", "CITRIS", "Soda"),
ai = c(1.2, 0.4, 2.1, 1, 0.8, 1.6),
steps_k = c(8.5, 6.2, 9.1, 7, 5.8, 10.3))

library(dplyr)

# 35. A data frame containing the 2nd and 5th students.
slice(day_at_cal, c(2, 5))

# 36. A data frame without the 3rd student
slice(day_at_cal, -3)

# 37. A data frame with only the AI hours column
select(day_at_cal, "ai")

# 38. A data frame with only the factor columns
select(day_at_cal, where(is.factor))

# 39. A data frame containing only the students with at least one hour of AI use
filter(day_at_cal, ai >= 1)

# 40. A data frame with students who study in either Moffitt or Doe
filter(day_at_cal, study_spot == c("Moffitt", "Doe"))

# 41. A data frame with a fifth column called ai_min with the AI use in minutes
mutate(day_at_cal, ai_min = ai * 60)

# 42. A data frame with a fifth (logical) column called active_day where the number of steps exceeds 8000
mutate(day_at_cal, active_day = steps_k > 8)

# 43. The same data frame sorted in descending order of number of hours of AI
arrange(day_at_cal, desc(ai))

# 44. The same data frame according to the day of the week. Within rows of the same day of the week,
# sort in descending order of the number of steps
arrange(day_at_cal, weekday, desc(steps_k))

# 45. A data frame with the overall mean hours of AI use. Name that statistic mean_ai
summarize(day_at_cal, mean_ai = mean(ai))

# 46. A data frame with the minimum steps walked (min_steps), the maximum steps walked (max_steps), 
# and the standard deviation of steps walked (sd_steps)
summarize(day_at_cal, min_steps = min(steps_k), max_steps = max(steps_k), sd_steps = sd(steps_k))

# 47. Skim the documentation for the tibble package then write down three ways in which tibbles behave differently than data frames
# Tibbles do less than data frames by avoiding partial matching and changing variables names and types, never creates row names,
# and always lists the variable type at the top of the column.