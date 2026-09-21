## Worksheet 1: Sampson's Monks
## Omar Abdelsalam, 3042974730

## Section 1: Matrices + Operations

# Q1: Create a matrix containing their scores

scores <- matrix(c(12, 23, 34, 45, 56, 67, 78, 89, 64), nrow=3, ncol=3, byrow = T)

# Q2: Name the rows and columns

colnames(scores) <- c("Score 1", "Score 2", "Score 3")
rownames(scores) <- c("Student A", "Student B", "Student C")

# Q3: Compute each student's average score

sort(rowMeans(scores), decreasing=T)
# Based on the results, Student C has the highest average.

## Section 2: Plots

# Q4: How can we make simple graphs in Base R?

exData <- sample(x=-10:10, size=20, replace=T) # drawing a 20 size sample from -10 to 10 with replacement
plot(x=1:20, y=exData) # 20 x-values for 20 samples
boxplot(exData)
hist(exData)

# Q5: Create a histogram using the matrix scores

scoresV <- as.vector(scores) #converts scores to vector
hist(scoresV)

# Q6: Use the built-in airquality dataset
data("airquality")

# a) Construct a histogram of Ozone
hist(airquality$Ozone)

# b) Construct a scatterplot of Ozone vs Temperature
plot(airquality$Ozone, airquality$Temp)

# c) Construct a boxplot of Temperature by Month
boxplot(airquality$Temp ~ airquality$Month) # y~x used to display boxplot correctly with each month

## Intro to Packages

# Q7: Install and load the packages

install.packages("igraph")
install.packages("networkD3")
library("igraph")
library("networkD3")

# Q8: What are igraph and networkD3?

# igraph is a package used to create network graphs and web maps.
# networkD3 is also used to create network graphs and visualizations, but with D3 JavaScript data.
# Both packages are useful for data visualization as they provide detailed information and maps to help display how data is connected.

# Q9: Explore usage

# a) igraph example

g <- make_graph(edges = c(1,2, 2,3, 3,1), n = 3, directed = FALSE)
plot(g)
# This example shows a graph with three edges that connect using three lines. It makes a triangle shape.

# b) networkD3 example

simpleNetwork(data.frame(source = c("A", "B", "C"), 
                         target = c("B", "C", "A")))
# This example also displays a triangle like the igraph example, but is a little more interactive as hovering over each data point allows you to see the branches that connect them.