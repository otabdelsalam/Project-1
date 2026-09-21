## Project 1: Sampson's Monks
## Omar Abdelsalam, 3072974730

## Part 0: Setting Up

# Run this lines once to install packages on your machine
install.packages("lda")
install.packages("igraph")
install.packages("networkD3")

# Run these lines once per session to load packages
library(lda)
library(igraph)
library(networkD3)

data(sampson)              # load the monks data from lda
samplk1 <- sampson$SAMPLK1 # extract one of the matrices

## Part 1: Visualizing the Network

# a) Static plot
monk_mat1 <- sampson$SAMPLK2
monk_mat1 <- graph_from_adjacency_matrix(monk_mat1)
plot.igraph(monk_mat1)

# b) Interactive plot

monk_mat2 <- sampson$SAMPLK2
nodes <- data.frame(name = rownames(monk_mat2), group = 1)
edges <- which(monk_mat2 > 0, arr.ind = TRUE)

links <- data.frame(
  source = edges[, "row"] - 1,
  target = edges[, "col"] - 1,
  value  = monk_mat2[edges] 
)

forceNetwork(links, nodes, Source = "source", Target = "target", Value = "value", NodeID = "name", Group = "group")

## Part 2: Summary Statistics on a Sociomatrix

# 1: Report the matrix you have selected

chosenMatrix <- sampson$SAMPIN 
# The matrix I chose was sampin (or the positive influence matrix). This matrix is formatted the same way as like and dislike (as in 0 to 3), but is used to...
#...describe who the monks choose to have the most positive influence in the set.

# 2: Compute the out and in degrees

votingValues <- chosenMatrix > 0
outDegree <- rowSums(votingValues)
inDegree <- colSums(votingValues)

# 3: Compute the out and in strength

outStrength <- rowSums(chosenMatrix)
inStrength <- colSums(chosenMatrix)

# 4: Make a histogram of in-degree and a histogram of in-strength and compare to an out degree histogram
hist(inDegree)
hist(inStrength)
hist(outDegree)
# When looking at all three histograms, we can see that most of out degree's values fall at 3. Out-degree's matrix is much narrower as most people only vote three times, with...
# ...an exception being that one person didn't vote at all and another voted an extra time. It only records how many votes they sent out, which should usually add up to 3.
# As for in-degree, it is a lot more narrower than in-strength as in-strength marks values up to 3 while in degree only checks if there is a vote or not (with values 1 or 0).

# 5: Make a scatter plot of in-degree against in-strength. What would it mean for a monk to fall well above or below the general trend?

plot(inDegree, inStrength)
# If a monk were to fall above or below the trend line, this means that despite their in-degree value, they have received a lot more critical values (such as either a 3 or a 1)...
# ... For example, if a monk were to receive an in-degree of 2 but an in-strength of 6, this means they received two 3 votes, which falls above the average of a strength of 3 or 4.
# Falling below the trend line means they received multiple votes of low scores (such as in-degree equalling in-strength (3 votes of 1s, etc)).

# 6: Which monk received the most nominations on your chosen relation, and which received the fewest? Do you get the same answer using in-degree as you do using in-strength?

sort(inStrength, decreasing=TRUE)
sort(inDegree, decreasing=TRUE)
# According to both sorted matrices, Greg received the most nominations (with a 24 in-strength and 11 in-degree), and Victor received the least nominations (0 in-strength and 0 in-degree).
# The answer is the same using both matrices; however, there are a few changes between their ranks (like Peter receiving a higher score than Mark but having a lesser in-degree score).
# The best way to determine this is to use the in-strength matrix as it provides the higher score rather than how many votes they received.

## Part 3: A simple model of a social network

# 1: Generate a network according to the rule that each monk assigns their likes completely at random

monkCount <- nrow(chosenMatrix)
allSamples <- matrix(0, nrow = monkCount, ncol = monkCount)

for(i in 1:monkCount){
  rankedMonks <- rep(0, times=monkCount) #blank vector
  choices <- (1:monkCount)[-i] #1 through 17, minus one for self
  randomMonks <- sample(choices, size = 3) #selecting 3 monks from the list
  rankedMonks[randomMonks] <- c(3,2,1) #uses random sample above to convert those monks' spots to 3, 2, and 1
  allSamples[i, ] <- rankedMonks #sets row i to the rank created
}

## Part 4: Model vs Observations

# a) Static plot
newSampleGraph <- graph_from_adjacency_matrix(allSamples)
plot.igraph(newSampleGraph)

# b) Interactive plot

rownames(allSamples) <- rownames(chosenMatrix)
colnames(allSamples) <- colnames(chosenMatrix)

nodes <- data.frame(name = rownames(allSamples), group = 1)
edges <- which(allSamples > 0, arr.ind = TRUE)

links <- data.frame(
  source = edges[, "row"] - 1,
  target = edges[, "col"] - 1,
  value  = allSamples[edges] 
)

forceNetwork(links, nodes, Source = "source", Target = "target", Value = "value", NodeID = "name", Group = "group")

# 2: Compute the out and in degrees

votingValues2 <- allSamples > 0
outDegree2 <- rowSums(votingValues2)
inDegree2 <- colSums(votingValues2)

# 3: Compute the out and in strength

outStrength2 <- rowSums(allSamples)
inStrength2 <- colSums(allSamples)

# 4: Make a histogram of in-degree and a histogram of in-strength and compare to an out degree histogram
hist(inDegree2)
hist(inStrength2)
hist(outDegree2) #in this specific case, outDegree is always 3 because everyone is voting thrice.

# 5: Make a scatter plot of in-degree against in-strength. What would it mean for a monk to fall well above or below the general trend?

plot(inDegree2, inStrength2)

# 6: Which monk received the most nominations on your chosen relation, and which received the fewest? Do you get the same answer using in-degree as you do using in-strength?

sort(inStrength2, decreasing=TRUE)
sort(inDegree2, decreasing=TRUE)

# When comparing the data and graphs collected from sampin and monk_mat, we can see that sampin has a lot more data points and movement. There are some similarities, like the in-degree and in-strength charts having a trend line,
# both in degree graphs having roughly the same data (peaking around 0-2 and decreasing afterward), and a similar flowing static graph.
# Some differences include a tighter network graph with more connections, less spread apart values (like in-strength and in-degree), and a consistent out degree.
# The patterns I noticed appeared in the observed network was a wider spread and less connections, while the generated network is a lot more tightly knit and closer together, which is probably due to the...
# more consistent out degree and closer data points rather than the spread apart data in the observed network.