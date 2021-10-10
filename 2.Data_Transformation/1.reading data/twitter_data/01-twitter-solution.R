library(tidyverse)
library(rtweet)

# Authenticate access to the Twitter API using the token
# provided for class today
api_key <- "r4UWPcaTY9JIa4w4Qr9lygsvR"
api_secret_key <- "XYZ5j2ZFzTASaVGJjEi98DKg2pjhlRTqm4xervTlZToAKAvWko"
access_token <- "3234588499-awSgTAungXRlOH5nrxGoqQWzdE0Q6VEM3HKwJSO"
access_token_secret <- "umeZS3B6Qj1SQuWkWZWOHQJji2xEukew9pAgvZ8CfsB38"

## store authentication information
token <- create_token(
  app = "CFSS test 2",
  consumer_key = api_key,
  consumer_secret = api_secret_key,
  access_token = access_token,
  access_secret = access_token_secret
)

# Find the 1000 most recent tweets by
## Katy Perry (https://twitter.com/katyperry)
## Kim Kardashian West (https://twitter.com/KimKardashian)
## Ariana Grande (https://twitter.com/ArianaGrande)
popstars <- get_timelines(
  user = c("katyperry", "KimKardashian", "ArianaGrande"),
  n = 1000
)

# Visualize their tweet frequency by week
popstars %>%
  group_by(screen_name) %>%
  ts_plot(by = "week")
