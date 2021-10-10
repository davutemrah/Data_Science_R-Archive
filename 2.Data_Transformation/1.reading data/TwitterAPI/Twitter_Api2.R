# Standalone App: version1.1
Appname: DavutOldApp

# Some Other way to use Twitter API

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


# post a tweet
post_tweet("Look, Im tweeting using R @DavutLava")

