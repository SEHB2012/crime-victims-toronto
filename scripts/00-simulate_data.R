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
  subtype = rep(c("Assault", "Other", "Robbery", "Sexual Violation"), times = num_years),
  sum_count = sample(1000:9000, num_years * 4, replace = TRUE) * 1.0  # Convert to numeric
)


# Generate simulated data for second section : crimes are grouped by the age group

# Set seed for reproducibility
set.seed(123)

# Generate simulated data
# Number of years
num_years <- 2022 - 2014 + 1

simulate_groupbyage <- tibble(
  report_year = rep(seq(2014, 2022), each = 8),
  subtype = rep(c(">12", "12 to 17", "18 to 24", "25 to 34","35 to 44","45 to 54","55 to 64","65+"), times = num_years),
  sum_count = sample(1000:9000, num_years * 8, replace = TRUE) * 1.0  # Convert to numeric
)




