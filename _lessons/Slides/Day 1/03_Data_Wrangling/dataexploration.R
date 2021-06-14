# Header -----------------------------------------------------------------------
#
# Author: Markus Freitag
# GitHub: https://github.com/m-freitag
# Date: June 12, 2021
#
# Script Name:
#
# Script Description:
#
#
# Notes:
#
#

# Install Packages and Load Libraries ------------------------------------------

pacman::p_load(
  tidyverse,
  patchwork,
  rio,
  data.table,
  collapse,
  modelsummary,
  legislatoR
)

# GitHub Packages

# (Helper) Functions -----------------------------------------------------------

# We can also load the data directly from the web. In a "real" analysis, we would
# only want to do this if the file is static and stable. Why? Reproducibility...
parlgov_elec <- import("http://www.parlgov.org/static/data/development-cp1252/view_election.csv")

str(parlgov_elec) # enhanced version of glimpse()

datasummary_skim(parlgov_elec)

datasummary_skim(parlgov_elec, type = "categorical")

# R's "vanilla" function to calculate the mean is... mean()

mean(parlgov_elec$vote_share)

# returns NA, we need to tell R to remove missings

mean(parlgov_elec$vote_share, na.rm = TRUE)


parlgov_party <- import("http://www.parlgov.org/static/data/development-cp1252/view_party.csv")

parlgov_cabinet <- import("http://www.parlgov.org/static/data/development-cp1252/view_cabinet.csv")

qsu(parlgov_party)

