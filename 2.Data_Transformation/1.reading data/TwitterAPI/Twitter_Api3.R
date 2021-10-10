# Standalone App: version1.1
# Appname: DavutOldApp

rm(list=ls())

# Retweet Package
library(rtweet)
library(tidytext)

appname <- "DavutOldApp"
oldAPIkey <- "SxwBNtojA4dPutA37io7qF188"
oldAPIsecretKey <- "sQQ16pvbVaHY74cxpPBMfbdmWyJ0Oqy8S1ykhfQmtucUwohp9u"
oldBearerToken <- "AAAAAAAAAAAAAAAAAAAAAOaQQQEAAAAA0q%2FXCWkdi3pcSQW64EDGqqAze8k%3Dc2C43AYx5GyYkDzLXkht7NP4Kvw8Y0MfYh9SleJ3NSwxfmAFFD"
oldAccessToken <- "784096391526227968-klXu4xEuSa1uNIAGkQZLxxDP9Stp2hE"
oldAccessTokenSecret <- "P69qbkTLyfwtvhrIbKTrYcP9929qwG7w3NNzgSrmpOIyQ"

twitter_token <- create_token(
    app = appname,
    consumer_key = oldAPIkey,
    consumer_secret = oldAPIsecretKey,
    access_token = oldAccessToken,
    access_secret = oldAccessTokenSecret)

twitter_token

# post a tweet
post_tweet("Look, Im tweeting using R @DavutLava")


rstats_tweets <- search_tweets(q = "#rstats",
                               n = 500)



popstars <- get_timelines(
    user = c("katyperry", "KimKardashian", "ArianaGrande"),
    n = 1000
)


rt <- search_tweets(
    q = "#rstats",
    n = 3000,
    include_rts = FALSE
)
rt