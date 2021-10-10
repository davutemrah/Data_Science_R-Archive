# DPLYR / PLYR


library(readxl)

edu <- read_xlsx("./data/1.education.xlsx")
names(edu)

-------------------------------------------------------
# Subset examples (base R)

# first column; 5th row
edu[5, 1]

# select column by name of the column
edu[4:5, "region"]

edu[c(1, 3, 5), c("region", "max")]

# Logical
edu[(edu$max > 3 | is.na(edu$region)), ]

# which subset only NON-MISSING
x[which(x$var2 >8), ]
-------------------------------------------------------

-------------------------------------------------------
# Subset examples (DPLYR)

library(dplyr)

## subset columns
args(select)

ranges= : 
negetion= !
and or=  &  |
list =  c()

everything()
starts_with()
ends_with()
contains()   literal string
matches()   regular expression
where()

# range
edu %>% select(shangai_ind:max) %>% slice(1:3)

# negation (exlude max)
edu %>% select(!max) %>% slice(1:3)

# negation (exlude max)
edu %>% select(-max) %>% slice(1:3)

# select_all(data, function)
edu %>% select_all(toupper) %>% names

# select_at(data, vars, function)
edu %>% 
    select_at(vars(!contains("enrol")), tolower) %>%
    names

# select_if(data, logical, function)
select_if(.tbl  = edu, 
          .predicate = is.numeric,
          .funs = toupper)





