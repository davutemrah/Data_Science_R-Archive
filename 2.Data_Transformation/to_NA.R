
# It is useful if you want to convert an annoying value to NA

na_if(x, y)


# See also
coalesce() # to replace missing values with a specified value.

tidyr::replace_na() # to replace NA with a value.

recode() # to more generally replace values.

starwars %>%
mutate(eye_color = na_if(eye_color, "unknown"))

starwars %>%
    mutate(across(where(is.character), ~na_if(., "unknown")))