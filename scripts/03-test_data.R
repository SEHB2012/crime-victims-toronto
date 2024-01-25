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


#### Workspace setup ####
library(tidyverse)

#### Test data ####
# Generate tests for first section : crimes are grouped by the type of crime
groupbycrime_test <-
  read_csv(
    file = "/cloud/project/outputs/data/data_groupsbycrime.csv",
    show_col_types = FALSE
  )

#testing for unique crime names 
#the years should have lower bound 2014, upper bound 2022
#the crime should be a number 

simulate_groupbycrime$subtype |>
  unique() == c("Assault", "Other", "Robbery", "Sexual Violation")

groupbycrime_test$report_year |> min() == 2014
groupbycrime_test$report_year |> max() == 2022
groupbycrime_test$sum_count |> min() >= 0
groupbycrime_test$sum_count |> class() == "numeric"

# Generate tests for second section : crimes are grouped by the age cohort
groupbyage_test <-
  read_csv(
    file = "/cloud/project/outputs/data/data_groupsbyage.csv",
    show_col_types = FALSE
  )

#testing for unique crime names 
#the years should have lower bound 2014, upper bound 2022
#the crime should be a number 

simulate_groupbyage$subtype |>
  unique() == c("Assault", "Other", "Robbery", "Sexual Violation")
  
groupbyage_test$report_year |> min() == 2014
groupbyage_test$report_year |> max() == 2022
groupbyage_test$sum_count |> min() >= 0
groupbyage_test$sum_count |> class() == "numeric"

