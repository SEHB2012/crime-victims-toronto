#### Preamble ####
# Purpose: Cleans up the dataset for use
# Author: Sehar Bajwa 
# Date: 23 January 2023 
# Contact: sehar.bajwa@mail.utoronto.ca
#### Workspace setup ####
library(tidyverse)
library(knitr)
library(janitor)
library(lubridate)
library(opendatatoronto)
library(tidyverse)



#Basic cleaning and selecting relevant columns
read_csv(
  file = "/cloud/project/inputs/data/raw_crimedata_toronto.csv",
  show_col_types = FALSE
)

finale_data <- clean_names(raw_crimedata_toronto)
finale_data <-
  finale_data |>
  select(
    report_year,
    subtype,
    sex,
    age_cohort,
    count
  )

#removing all rows with unknown data points
finale_data <-
  finale_data |>
  filter(!grepl("Unknown", age_cohort, ignore.case = TRUE))
#only retaining Female data
finale_data <-
  finale_data |>
  filter(
    sex == "F",
  )
finale_data <- select(finale_data, -sex)

head(finale_data)

#finale_data |>
# summarise(n = n(),
#            .by = sex)

# Convert 'count' to numeric (assuming it's currently a character)
finale_data <- mutate(finale_data, count = as.numeric(count))


# Manipulating data for first section : crimes are grouped by the type of crime, and summed for each type per year
# Group by report_year and crime type, then calculate the sum of counts
#How have different crime type rates changed over the years?
data_groupsbycrime <- finale_data %>%
  group_by(report_year, subtype) %>%
  summarise(sum_count = sum(count))


# Manipulating data for first section : crimes are grouped by age, and summed for each crime type 
# Group by report_year and age, then calculate the sum of counts
#Which age groups have been most susceptible to crime over the years?
data_groupsbyage <- finale_data %>%
  group_by(report_year, age_cohort) %>%
  summarise(sum_count = sum(count))
# Custom order vector since <12 was originally at the bottom
custom_order <- c("<12", "12 to 17", "18 to 24", "25 to 34","35 to 44","45 to 54","55 to 64","65+")
data_groupsbyage <- data_groupsbyage %>%
  arrange(factor(age_cohort, levels = custom_order))
write_csv(
  x = data_groupsbycrime,
  file = "/cloud/project/outputs/data/data_groupsbycrime.csv"
)
write_csv(
    x = data_groupsbyage,
    file = "/cloud/project/outputs/data/data_groupsbyage.csv"
)
write_csv(
  x = finale_data,
  file = "/cloud/project/outputs/data/final_crimedata_toronto.csv"
)

