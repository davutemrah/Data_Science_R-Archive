library(tidyverse)
library(repurrrsive)

## look at Star Wars data frames
# View(sw_people)
# View(sw_films)
# View(sw_species)
# View(sw_planets)
# View(sw_starships)
# View(sw_vehicles)

# Generate a visualization of the distribution of
# average height for each species in the Star Wars universe.

## clean up sw_species so it is one-row-per-species
sw_height <- tibble(sw_species) %>%
  # each row is a separate species - need to extract the average_height variable
  hoist(sw_species,
        height = "average_height") %>%
  # fix height to be a numeric column
  mutate(height = parse_number(height))
sw_height

# generate a histogram
ggplot(data = sw_height, mapping = aes(x = height)) +
  geom_histogram() +
  labs(x = "Height (in centimeters)",
       y = "Number of species")

# Generate a bar chart showing the number of film appearances made
# by each character in `sw_people` who made at least three film appearances

## unnest the data
sw_people_df <- tibble(sw_people) %>%
  # each row is a character - extract to one column per variable
  unnest_wider(sw_people) %>%
  # films is a list-column with character vectors containing the 
  # movies in which the character appeared. Make the data frame
  # longer so we have one-row-per-character-per-film
  unnest_longer(films)
sw_people_df

## summarize the data frame and graph the bar chart
sw_people_df %>%
  count(name) %>%
  filter(n >= 3) %>%
  ggplot(mapping = aes(x = fct_reorder(.f = name, .x = n), y = n)) +
  geom_col() +
  coord_flip() +
  labs(title = "Number of appearances in the Star Wars cinematic universe",
       subtitle = "As of December 31, 2015",
       x = NULL,
       y = "Number of film appearances")
