library(httr)
library(jsonlite)
library(dplyr)

myBearerToken <- "AAAAAAAAAAAAAAAAAAAAAKRrQQEAAAAANoDVos%2BQ%2BlMnm5ImVn09xXQo8jM%3DWvelibFkKNjvQ1o03EWwhIyBv0FRG5ooopsTCNwvuij4ENOwzH"
myApiKey <- "IwbDZkdg8V1Lqp1f93q5AO9xY"
myApiSecretKey <- "W0CuAzV8PJX4KV3QZ1lAaOJNGdoqTVcxigSr0IOSQg4aXnEMz6"
myAccessToken <- "784096391526227968-Fz6je6rdWzECKqIxovhbvrN7My07O8W"
myAccessTokenSecret <- "b5ztDvrhial4cAho2Z8WfuqmenET8x7KJPJevqIV4ytfZ"


Sys.setenv(BEARER_TOKEN = myBearerToken)

bearer_token <- Sys.getenv(myBearerToken)
headers <- c(`Authorization` = sprintf('Bearer %s', bearer_token))


params <- list(`user.fields` = 'description',
               `expansion` = 'pinned_tweet_id')



handle <- readline('DavutLava')

url_handle <-
    sprintf('https://api.twitter.com/2/users/by?usernames=%s', handle)


response <-
    httr::GET(url = url_handle,
              httr::add_headers(.headers = headers),
              query = params)
obj <- httr::content(response, as = "text")
print(obj)

json_data <- fromJSON(obj, flatten = TRUE) %>% as.data.frame
View(json_data)

final <-
    sprintf(
        "Handle: %s\nBio: %s\nPinned Tweet: %s",
        json_data$data.username,
        json_data$data.description,
        json_data$includes.tweets.text
    )

cat(final)
