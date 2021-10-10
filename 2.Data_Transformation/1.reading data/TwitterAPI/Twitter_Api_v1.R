# Standalone App: version1.1
# Appname: DavutOldApp

rm(list=ls())

appname <- "DavutOldApp"
oldAPIkey <- "SxwBNtojA4dPutA37io7qF188"
oldAPIsecretKey <- "sQQ16pvbVaHY74cxpPBMfbdmWyJ0Oqy8S1ykhfQmtucUwohp9u"
oldBearerToken <- "AAAAAAAAAAAAAAAAAAAAAOaQQQEAAAAA0q%2FXCWkdi3pcSQW64EDGqqAze8k%3Dc2C43AYx5GyYkDzLXkht7NP4Kvw8Y0MfYh9SleJ3NSwxfmAFFD"
oldAccessToken <- "784096391526227968-klXu4xEuSa1uNIAGkQZLxxDP9Stp2hE"
oldAccessTokenSecret <- "P69qbkTLyfwtvhrIbKTrYcP9929qwG7w3NNzgSrmpOIyQ"

# USING twitteR PACKAGE
library(twitteR)
# Change the next four lines based on your own consumer_key, consume_secret, access_token, and access_secret. 
consumer_key <- oldAPIkey
consumer_secret <- oldAPIsecretKey
access_token <- oldAccessToken
access_secret <- oldAccessTokenSecret

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

tw = searchTwitter('#nba',
                            n = 1e4, since = '2020-11-08', 
                            retryOnRateLimit = 100)
d = twListToDF(tw)


