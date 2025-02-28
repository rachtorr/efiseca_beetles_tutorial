## INTRODUCTION TO ECOLOGICAL FORECASTING WORKSHOP
### Forecasting Beetle abundance for NEON challenge 
### hosted by EFISECA, March 4 2025 

### See more about NEON forecasting challenge here: https://projects.ecoforecast.org/neon4cast-ci/targets.html

#### See full code for this tutorial here: 
# Eric Sokol, NEON (National Ecological Observatory Network). Data Tutorial:Forecasting Beetle Richness and Abundance. https://www.neonscience.org/resources/learning-hub/tutorials/neon-beetle-forecasting. Accessed 2/24/25.
# also based off of tutorials created by Freya Olsson for the NEON Forecasting Challenge Workshop and examples form Carl Boettiger for the Beetles Communities theme documentation 

# this document is to get started before the live coding workshop - installing and loading packages, and the url for data, are available below 

## ----install packages----------------------------------------------------------------------------------------------------
# tidyverse package for tidying, wrangling, visualizing data 
if(!require("tidyverse")) install.packages("tidyverse") 

# lubridate, which is part of tidyverse, makes handling dates easier 
if(!require("lubridate")) install.packages("lubridate") 

# tsibble package for tidy temporal data 
install.packages('tsibble')

# fable package for forecasting models for tidy time series 
install.packages('fable')

# neon4cast used for formmating with function efi_format(), for submitting forecast 
remotes::install_github("eco4cast/neon4cast")

# score4cast is for getting score CRPS 
devtools::install_github("eco4cast/score4cast")



## ----load packages-------------------------------------------------------------------------------------------------------------------------------
version$version.string

library(tidyverse)
library(tsibble)
library(fable)
library(fabletools)
library(neon4cast)
library(score4cast)


## ----get data from sites----------------------------------------------------------------------------------------------------------------------

# site data - see all NEON sites where beetle data is collected 
site_data <- read_csv("https://raw.githubusercontent.com/eco4cast/neon4cast-targets/main/NEON_Field_Site_Metadata_20220412.csv") %>%
   dplyr::filter(beetles == 1)

# beetle targets are here - formatted for this workshop 
url <- "https://sdsc.osn.xsede.org/bio230014-bucket01/challenges/targets/project_id=neon4cast/duration=P1W/beetles-targets.csv.gz"

# Get climate data
path_to_clim_data <- "https://data.cyverse.org/dav-anon/iplant/projects/NEON/ESA2024/forecasting_beetles_workshop/modeled_climate_2012-2050_OSBS_CMCC_CM2_VHR4.csv"

## tutorial will start here 



