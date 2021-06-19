# Header -----------------------------------------------------------------------
#
# Author: Markus Freitag
# GitHub: https://github.com/m-freitag
# Date: June 18, 2021
#
# Script Name: Fake Data for homework
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
  modelsummary
)

# GitHub Packages

# (Helper) Functions -----------------------------------------------------------


# ---------------------------- GENERATE FAKE DATA ------------------------------

set.seed(666)

n = 500
m <- 3

df <- tibble(
    id = rep(1:n, each = m),
    date = rep(c("1st April 2021", "1st May 2021", "1st June 2021"),
        times = n
    )
)

df <- df %>%
    mutate(q1 = case_when(
        date == "1st April 2021" ~ sample(1:5,
            n(),
            replace = TRUE,
            prob = c(0.1, 0.4, 0.2, 0.2, 0.1)
        ),
        date == "1st May 2021" ~ sample(1:5,
            n(),
            replace = TRUE,
            prob = c(0.1, 0.2, 0.4, 0.2, 0.1)
        ),
        date == "1st June 2021" ~ sample(1:5,
            n(),
            replace = TRUE,
            prob = c(0.1, 0.1, 0.2, 0.3, 0.3)
        )
    )) %>%
    mutate(q2 = case_when(
        date == "1st April 2021" ~ sample(1:5,
            n(),
            replace = TRUE,
            prob = c(0.4, 0.4, 0.1, 0.05, 0.05)
        ),
        date == "1st May 2021" ~ sample(1:5,
            n(),
            replace = TRUE,
            prob = c(0.3, 0.3, 0.2, 0.1, 0.1)
        ),
        date == "1st June 2021" ~ sample(1:5,
            n(),
            replace = TRUE,
            prob = c(0.2, 0.2, 0.3, 0.2, 0.1)
        )
    ))

df <- df %>%
    mutate(id = paste0("id_", id))

df %>%
    group_by(date) %>%
    summarise(mean(q2))


april <- df %>%
    filter(date == "1st April 2021")

may <- df %>%
    filter(date == "1st May 2021")

june <- df %>%
    filter(date == "1st June 2021")


april <- april %>%
    pivot_longer(c(q1, q2), names_to = "q", values_to = "a") %>%
    unite("id", c(id, q), sep = "_") %>%
    pivot_wider(names_from = id, values_from = a)

may <- may %>%
    pivot_longer(c(q1, q2), names_to = "q", values_to = "a") %>%
    unite("id", c(id, q), sep = "_") %>%
    pivot_wider(names_from = id, values_from = a)


june <- june %>%
    pivot_longer(c(q1, q2), names_to = "q", values_to = "a") %>%
    unite("id", c(id, q), sep = "_") %>%
    pivot_wider(names_from = id, values_from = a)


export(list(april, may, june), "Your_Long_Awaited_Data.xlsx")
