# QUIZ week 2

# GITHUB API

library(httr)
library(httpuv)
library(jsonlite)

rm(list=ls())

urlgit <- "https://api.github.com/users/jtleek/repos"

oauth_endpoints("github")
myapp <- oauth_app(appname = "davutquiz2",
                   key = "b677739daa4328f0818b",
                   secret = "52e27ba4e048a7e53da290abbdccbae91390c3e4")

# I could not work below code
# github_token <- oauth2.0_token(oauth_endpoints("github"), myapp, cache = F)

# this works well, there are other demos, if you leave out topic
demo(topic = "oauth2-github", package = "httr", ask = FALSE)

# 4. Use API
gtoken <- config(token = github_token)

req <- GET(urlgit, gtoken)
stop_for_status(req)
content(req)

# OR:
req <- with_config(gtoken, GET(urlgit))
stop_for_status(req)

# extract
json1 = content(req)

# convert to a dataframe
df <- fromJSON(toJSON(json1))

df_subset <- df[, c("full_name", "created_at")]

df_subset <- df_subset[df_subset$full_name == "jtleek/datasharing", "created_at"]





