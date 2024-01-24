#### Preamble ####
# Purpose: Downloads Victims of crime data from OpenData Toronto
# Author: Sehar Bajwa 
# Date: 23 January 2023 
# Contact: sehar.bajwa@mail.utoronto.ca

#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)

#### Download data ####
# getting the package 
raw_crimedata_toronto <-
  package <- show_package("police-annual-statistical-report-victims-of-crime")
package

# get all resources for this package
resources <- list_package_resources("police-annual-statistical-report-victims-of-crime")

#picking the correct format
datastore_resources <- filter(resources, tolower(format) %in% c('csv'))
raw_crimedata_toronto <- filter(datastore_resources, row_number()==1) %>% get_resource()

#saving data locally
write_csv(
  x = raw_crimedata_toronto,
  file = "Crime Victims Toronto/inputs/data/raw_crimedata_toronto.csv"
)