#1
names(x) <- c("C","w","D")
#2
colnames(x) <- c("A","w","B")
#3
names(x)[2:3] <- c("E","F")
#4
colnames(df) <- paste("renamed_",colnames(df),sep="")
#5
colnames(data)[colnames(data) == "b"] <- "d"
#6
nameVec <- names(labWide)
nameVec <- gsub("Lab","LabLat",nameVec)
names(labWide) <- nameVec
#7 
# data table
setnames(d, old = c('a','d'), new = c('anew','dnew'))
setnames(DT, "b", "d")
#8
### DPLYR
oldnames = c("q","e")
newnames = c("A","B")

df %>% rename(A = q, B = e)

df %>% rename_at(vars(oldnames), ~ newnames)

df %>% rename_with(~ newnames[which(oldnames == .x)], .cols = oldnames)

df %<% rename_with(toupper)
df %>% rename_with(tolower)

df %>% rename_with(~ gsub(pattern = " ", replacement = '_', .x))
---------------------------------------------------------------
#9
oldnames = c("q","e")
newnames = c("A","B")
for(i in 1:2) names(x)[names(x) == oldnames[i]] <- newnames[i]
#10
# Use purrr::set_names() with annonymous function of stringr operations
data %>%
    set_names(~ str_to_lower(.) %>%
                  str_replace_all(" ", "_") %>%
                  str_replace_all("bad", "good"))



