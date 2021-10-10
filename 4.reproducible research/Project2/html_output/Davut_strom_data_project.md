---
title: "Storm Data in the U.S."
output:
    html_document:
        keep_md: true
        toc: true

knit: (function(inputFile, encoding) {
  rmarkdown::render(inputFile, encoding = encoding, 
  output_dir = "html_output") })
---

# Most Effective Disasters in the US

## Abstract

This project analyzes storm data from U.S. National Oceanic and Atmospheric Administration's (NOAA). Data covers years from 1950 till 2011. It contains detailed information on every type of events occurred in the US. Many of these severe weather conditions result in fatalities, injuries, economic damages on the households. In this study, I find that tornadoes have caused the most fatalities and injuries, on the other hand floods has had the most economic damage.



```r
rm(list = ls())
knitr::opts_chunk$set(echo = TRUE)

if (!dir.exists("rawdata")) {dir.create("rawdata")}
if (!dir.exists("docs")) {dir.create("docs")}
```


```r
library(dplyr, warn.conflicts = F)
library(ggplot2)
library(tidyr)
```


### Data Processing

Storm Data is downloaded from the website and stored in the local machine. For the sake of reproducibility, link to the dataset is stored as well in the document.

```r
data_url <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2" 
download.file(data_url, destfile = "./rawdata/rawdata.zip")
stormdata <- read.csv("./rawdata/rawdata.zip")
docurl <- "https://d396qusza40orc.cloudfront.net/repdata%2Fpeer2_doc%2Fpd01016005curr.pdf"
download.file(docurl, destfile = "docs/stormdata_docs.pdf")
```

Processing raw data is required before I analyze. Property and crop damage variables are recoded so that I can calculate the damage in dollar terms. Beginning date variable is also formatted. 


```r
df <-
stormdata %>%
    mutate( propexp = recode(PROPDMGEXP, 
                             K = 10^3, M = 10^6, B = 10^9,
                             m = 10^6, "+" = 10, "0" = 1,
                             "5" = 10^5, "6"= 10^6, "4" = 10^4,
                             "2" = 10^2, "3" = 10^3, h = 10^2,
                             "7" = 10^7, H = 10^2, "1" = 10, 
                             "8" = 10^8, .default = 1),
            PROPDMG = PROPDMG * propexp,
            cropexp = recode(CROPDMGEXP,
                             M = 10^6, K = 10^3, m = 10^6,
                             B = 10^9, k = 10^3, "2" = 10^2,
                             .default = 1),
            CROPDMG = CROPDMG * cropexp,
            EVTYPE = tolower(EVTYPE),
            year = format(as.Date(BGN_DATE, format = "%m/%d/%Y"), "%Y")) %>%
    select(year, EVTYPE, FATALITIES:PROPDMG, CROPDMG)
head(df, n=3)
```

```
##   year  EVTYPE FATALITIES INJURIES PROPDMG CROPDMG
## 1 1950 tornado          0       15   25000       0
## 2 1950 tornado          0        0    2500       0
## 3 1951 tornado          0        2   25000       0
```

## Results

Here I calculate the most fatal and harmful disasters. Both most fatal and harmful disaster is tornado. But in terms of economic damage, flood is the most harmful disaster.


```r
mostfatal <-
df %>%
    group_by(EVTYPE) %>%
    summarise(total_fatal = sum(FATALITIES),
              .groups = 'drop') %>%
    arrange(-total_fatal) %>%
    slice(1:20)
head(mostfatal, n=3)
```

```
## # A tibble: 3 × 2
##   EVTYPE         total_fatal
##   <chr>                <dbl>
## 1 tornado               5633
## 2 excessive heat        1903
## 3 flash flood            978
```

```r
mostinj <-
df %>%
    group_by(EVTYPE) %>%
    summarise(total_injuries = sum(INJURIES),
              .groups = 'drop') %>%
    arrange(-total_injuries) %>%
    slice(1:20)
head(mostinj, n=3)
```

```
## # A tibble: 3 × 2
##   EVTYPE    total_injuries
##   <chr>              <dbl>
## 1 tornado            91346
## 2 tstm wind           6957
## 3 flood               6789
```
### A. Most Fatalities by Event Type


```r
library(ggplot2)
ggplot(data = mostfatal, aes(x = as.factor(EVTYPE), 
                            y = total_fatal,
                            group = 1)) +
    geom_line() + geom_point() +
    theme(axis.text.x = element_text(angle = 90)) +
    ggtitle("Most Fatal Events in the US") +
    ylab("Total Fatalities") +
    xlab("Events")
```

![](/Users/d842a922/Desktop/R/B.Coursera_R/4.reproducible research/Project2/html_output/Davut_strom_data_project_files/figure-html/linegraph1-1.png)<!-- -->

### B. Most Injuries by Event Type

```r
ggplot(data = mostinj, aes(x = as.factor(EVTYPE), 
                            y = total_injuries,
                            group = 1)) +
    geom_line() + geom_point() +
    theme(axis.text.x = element_text(angle = 90)) +
    ggtitle("Most Injured Events in the US") +
    ylab("Total Injuries") +
    xlab("Events")
```

![](/Users/d842a922/Desktop/R/B.Coursera_R/4.reproducible research/Project2/html_output/Davut_strom_data_project_files/figure-html/linegraph2-1.png)<!-- -->

### C. Economic Consequencies of Disasters


```r
df_econ <-
df %>%
    select(-FATALITIES, -INJURIES) %>%
    group_by(EVTYPE) %>%
    summarise(total_propdmg = sum(PROPDMG, na.rm = T),
              total_cropdmg = sum(CROPDMG, na.rm = T),
              total_dmg = total_propdmg + total_cropdmg) %>%
    arrange(-total_dmg) %>%
    slice(1:20) %>%
    pivot_longer(c(total_propdmg:total_dmg), names_to = "type", values_to = "damage_value")

head(df_econ, n=3)
```

```
## # A tibble: 3 × 3
##   EVTYPE type          damage_value
##   <chr>  <chr>                <dbl>
## 1 flood  total_propdmg 144657709807
## 2 flood  total_cropdmg   5661968450
## 3 flood  total_dmg     150319678257
```

```r
ggplot(data = df_econ, aes(x = as.factor(EVTYPE), 
                            y = damage_value,
                            color = type,
                           group = type)) +
    geom_line() + geom_point() +
    theme(axis.text.x = element_text(angle = 90)) +
    ggtitle("Most Economically Harmful Events in the US") +
    ylab("Total Economic Damage") +
    xlab("Events")
```

![](/Users/d842a922/Desktop/R/B.Coursera_R/4.reproducible research/Project2/html_output/Davut_strom_data_project_files/figure-html/linegraph3-1.png)<!-- -->

