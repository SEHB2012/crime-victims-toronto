#### Preamble ####
# Purpose: Simulates a dataset regarding crimes in Toronto 
# Author: Sehar Bajwa 
# Date: 23 January 2023 
# Contact: sehar.bajwa@mail.utoronto.ca

#### Workspace setup ####

library(knitr)
library(janitor)
library(lubridate)
library(opendatatoronto)
library(tidyverse)
library(tibble)
library(dplyr)
  
#### Simulate data ####
# Set seed for reproducibility
set.seed(123)

# Generate simulated data for first section : crimes are grouped by the type of crime
# Number of years
num_years <- 2022 - 2014 + 1

simulate_groupbycrime <- tibble(
  report_year = rep(seq(2014, 2022), each = 4),
  crime_type = rep(c("Assault", "Other", "Robbery", "Sexual Violation"), times = num_years),
  crime_count = sample(1000:9000, num_years * 4, replace = TRUE) * 1.0  # Convert to numeric
)

# Display the first few rows of the data
print(simulate_groupbycrime)

#testing for unique crime names 
#the years should have lower bound 2014, upper bound 2022
#the crime should be a number 

simulate_groupbycrime$crime_type |>
  unique() == c("Assault", "Other", "Robbery", "Sexual Violation")

simulate_groupbycrime$report_year |> min() == 2014
simulate_groupbycrime$report_year |> max() == 2022
simulate_groupbycrime$crime_count |> min() >= 0
simulate_groupbycrime$crime_count |> class() == "numeric"

# Generate simulated data for second section : crimes are grouped by the age group

# Set seed for reproducibility
set.seed(123)

# Generate simulated data
# Number of years
num_years <- 2022 - 2014 + 1

simulate_groupbyage <- tibble(
  report_year = rep(seq(2014, 2022), each = 8),
  crime_type = rep(c(">12", "12 to 17", "18 to 24", "25 to 34","35 to 44","45 to 54","55 to 64","65+"), times = num_years),
  crime_count = sample(1000:9000, num_years * 8, replace = TRUE) * 1.0  # Convert to numeric
)

# Display the first few rows of the data
print(simulate_groupbyage)

#testing for unique age groups,
#the years should have lower bound 2014, upper bound 2022
#the crime should be a number

simulate_groupbyage$crime_type |>
  unique() == c(">12", "12 to 17", "18 to 24", "25 to 34","35 to 44","45 to 54","55 to 64","65+")

simulate_groupbyage$report_year |> min() == 2014
simulate_groupbyage$report_year |> max() == 2022
simulate_groupbyage$crime_count |> min() >= 0
simulate_groupbyage$crime_count |> class() == "numeric"




