 # Public repos does not require key

library(jsonlite)
data <- fromJSON('https://api.github.com/users/jtleek/repos')



# another way
library(curl)
data <- curl("https://api.github.com/users/jtleek/repos?client_id=xxxx&client_secret=yyyy")
