##-----  Puzzle 1  -----

# Find minimums and locations of minimums

library(dplyr)

input <- c(
"2199943210
3987894921
9856789892
8767896789
9899965678"
)

input <- as.numeric(unlist(strsplit(input, split = "\n")))

# Define length of numbers
leng <- nchar(input[1])

# Split into a matrix, using modulo division and integer rounding
split <- as.data.frame(outer(input, 10^c((leng-1):0), function(x, y) x %/% y %% 10))


# This aint' it - not looking for outright minimums by row, looking for points where the digit is lower than its neighbours
# This includes looking vertically!

# Find the minimum value in each row
#split <- split %>% rowwise() %>% mutate(min = min(c(V1, V2, V3, V4, V5, V6, V7, V8, V9, V10)))
  


#! These puzzles are getting tough successively tougher