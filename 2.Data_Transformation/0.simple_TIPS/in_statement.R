1: Using %in% to Compare two Sequences of Numbers (vectors)
In this example, we will use %in% to check if two vectors contain overlapping numbers. Specifically, we will have a look at how we can get a logical value for more specific elements, whether they are also present in a longer vector. Here’s the first example of an excellent usage of the operator:
    
    # sequence of numbers 1:
    a <- seq(1, 5)
# sequence of numbers 2:
b <- seq(3, 12)

# using the %in% operator to check matching values in the vectors
a %in% b


# shorter vector:
a <- seq(12, 19)
# longer vector:
b <- seq(1, 16)

# test if elements in longer vector is in shorter:
b %in a


# Using the operator together with the which() function
which(seq(1:10) %in% seq(4:12))

# Sequences of Letters:
a <- LETTERS[1:10]

# Second seq of ltters
b <- LETTERS[4:10]

# longer in shorter
a %in% b

b %in% a


g <-  c("C", "D", "E")

h <- c("A", "E", "B", "C", "D", "E", "A", "B", "C", "D", "E")

which(h %in% g)

# %in% vs == the equal operator wrong!
which(g == h)

library(readxl)
library(httr)

#URL to Excel File:
xlsx_URL <- 'https://mathcs.org/statistics/datasets/titanic.xlsx'

# Get the .xlsx file as an temporary file
GET(xlsx_URL, write_disk(tf <- tempfile(fileext = ".xlsx")))

# Reading the temporary .xlsx file in R:
dataf <- read_excel(tf)

# Checkiing dataframe:
head(dataf)

# %in% column 
2 %in% dataf$boat



# Creating a dataframe:
dataf2 <- data.frame(Type = c("Fruit","Fruit","Fruit","Fruit","Fruit",
                              "Vegetable", "Vegetable", "Vegetable", "Vegetable", "Fruit"),
                     Name = c("Red Apple","Strawberries","Orange","Watermelon","Papaya",
                              "Carrot","Tomato","Chili","Cucumber", "Green Apple"),
                     Color = c(NA, "Red", "Orange", "Red", "Green",
                               "Orange", "Red", "Red", "Green", "Green"))


# Adding a New Column:
dataf2 <- within(dataf2, {
    Red_Fruit = "No"
    Red_Fruit[Type %in% c("Fruit")] = "No"
    Red_Fruit[Type %in% "Vegetable"] = "No"
    Red_Fruit[Name %in% c("Red Apple", "Strawberries", "Watermelon", "Chili", "Tomato")] = "Yes"
})




library(dplyr)

home.dests <- c("St Louis, MO", "New York, NY", "Hudson, NY")

# Subsetting using %in% in R:
dataf %>%
    filter(home.dest %in% home.dests)




# Drop columns using %in% operator in R
dataf[, !(colnames(dataf) %in% c("pclass", "embarked", "boat"))]


# Select columns using %in%:
dataf[, (colnames(dataf) %in% c("pclass", "embarked", "boat"))]

# Creating a not in operator:
`%notin%` <- Negate(`%in%`)


# Generating a sequence of numbers:
numbs <- rep(seq(3), 4)

# Using the not in operator:
4 %notin% numbs
# Output: [1] TRUE




