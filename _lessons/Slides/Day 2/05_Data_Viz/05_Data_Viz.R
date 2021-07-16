# Header -----------------------------------------------------------------------
#
# Author: Markus Freitag
# GitHub: https://github.com/m-freitag
# Date: July 19, 2021
#
# Script Name: Session 5: Slides Script
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
  rio,
  patchwork,
  hrbrthemes,
  extrafont,
  RColorBrewer,
  palmerpenguins,
  gghalves,
  ggdist
)



# Building a Plot from Scratch -------------------------------------------------

unvotes <- import("data/UNVotes2.parquet")

sessions <- unvotes %>%
  select(session, date) %>%
  group_by(session) %>%
  summarise(year = year(min(date)))
ideal <- import("data/ideal.csv")
ideal <- left_join(ideal, sessions, by = "session")
ideal <- filter(ideal, iso3c %in% c("USA", "GBR", "FRA", "CHN", "RUS", "DEU"))



## ---- echo = FALSE------------------------------------------------------------
theme_set(theme_grey() + theme(text = element_text(size = 20)))

## ----layer1, tidy=FALSE, eval = FALSE-----------------------------------------
## ggplot(data = ideal, #<<
##        mapping = aes(x = year, #<<
##                      y = IdealPointAll, #<<
##                      color = iso3c)) #<<
## 


## ----layer1-out, ref.label = "layer1", echo = FALSE---------------------------


## ----layer2, tidy=FALSE, eval = FALSE-----------------------------------------
## ggplot(data = ideal,
##        mapping = aes(x = year,
##                      y = IdealPointAll,
##                      color = iso3c)) +
##   geom_point() #<<
## 


## ----layer2-out, ref.label = "layer2", echo = FALSE---------------------------


## ----layer3, tidy=FALSE, eval = FALSE-----------------------------------------
## ggplot(data = ideal,
##        mapping = aes(x = year,
##                      y = IdealPointAll,
##                      color = iso3c)) +
##   geom_point() +
##   geom_line() #<<
## 


## ----layer3-out, ref.label = "layer3", echo = FALSE---------------------------


## ----layer4, tidy=FALSE, eval = FALSE-----------------------------------------
## ggplot(data = ideal,
##        mapping = aes(x = year,
##                      y = IdealPointAll,
##                      color = iso3c)) +
##   geom_point(size = 2) + #<<
##   geom_line(size = 1) #<<
## 


## ----layer4-out, ref.label = "layer4", echo = FALSE---------------------------


## ----layer5, tidy=FALSE, eval = FALSE-----------------------------------------
## ggplot(data = ideal,
##        mapping = aes(x = year,
##                      y = IdealPointAll,
##                      color = iso3c)) +
##   geom_point(size = 2) +
##   geom_line(size = 1) +
##   scale_colour_brewer(palette = "Dark2") #<<
## 


## ----layer5-out, ref.label = "layer5", echo = FALSE---------------------------


## ----layer6, tidy=FALSE, eval = FALSE-----------------------------------------
## ggplot(data = ideal,
##        mapping = aes(x = year,
##                      y = IdealPointAll,
##                      color = iso3c)) +
##   geom_point(size = 2) +
##   geom_line(size = 1) +
##   scale_colour_brewer(palette = "Dark2") +
##   scale_x_continuous(breaks = seq(1950, 2020, 10)) #<<
## 


## ----layer6-out, ref.label = "layer6", echo = FALSE---------------------------


## ----layer7, tidy=FALSE, eval = FALSE-----------------------------------------
## ggplot(data = ideal,
##        mapping = aes(x = year,
##                      y = IdealPointAll,
##                      color = iso3c)) +
##   geom_point(size = 2) +
##   geom_line(size = 1) +
##   scale_colour_brewer(palette = "Dark2") +
##   scale_x_continuous(breaks = seq(1950, 2020, 10)) +
##   facet_wrap(vars(iso3c), ncol = 1)#<<
## 


## ----layer7-out, ref.label = "layer7", echo = FALSE---------------------------


## ----layer8, tidy=FALSE, eval = FALSE-----------------------------------------
## ggplot(data = ideal,
##        mapping = aes(x = year,
##                      y = IdealPointAll,
##                      color = iso3c)) +
##   geom_point(size = 2) +
##   geom_line(size = 1) +
##   scale_colour_brewer(palette = "Dark2") +
##   scale_x_continuous(breaks = seq(1950, 2020, 10)) +
##   labs(x = "Year", #<<
##        y = "Ideal Point", #<<
##        color = "Country", #<<
##        title = "State foreign policy ideal points from 1946 to 2020", #<<
##        subtitle = "Estimates based on votes in the UN General Assembly (Bailey et al. 2017)", #<<
##        caption = "Higher values indicate more 'Western' ideal points.") #<<
## 


## ----layer8-out, ref.label = "layer8", echo = FALSE---------------------------


## ----layer9, tidy=FALSE, eval = FALSE-----------------------------------------
## ggplot(data = ideal,
##        mapping = aes(x = year,
##                      y = IdealPointAll,
##                      color = iso3c)) +
##   geom_point(size = 2) +
##   geom_line(size = 1) +
##   scale_colour_brewer(palette = "Dark2") +
##   scale_x_continuous(breaks = seq(1950, 2020, 10)) +
##   labs(x = "Year",
##        y = "Ideal Point",
##        color = "Country",
##        title = "State foreign policy ideal points from 1946 to 2020",
##        subtitle = "Estimates based on votes in the UN General Assembly (Bailey et al. 2017)",
##        caption = "Higher values indicate more 'Western' ideal points.") +
##   hrbrthemes::theme_ipsum() #<< # There are many ggplot themes, but I like this one atm.
## 
## 


## ----layer9-out, ref.label = "layer9", echo = FALSE---------------------------


## ----layer10, tidy=FALSE, eval = FALSE----------------------------------------
## ggplot(data = ideal,
##        mapping = aes(x = year,
##                      y = IdealPointAll,
##                      color = iso3c)) +
##   geom_point(size = 2) +
##   geom_line(size = 1) +
##   scale_colour_brewer(palette = "Dark2") +
##   scale_x_continuous(breaks = seq(1950, 2020, 10)) +
##   labs(x = "\nYear",
##        y = "Ideal Point",
##        color = "Country",
##        title = "State foreign policy ideal points from 1946 to 2020",
##        subtitle = "Estimates based on votes in the UN General Assembly (Bailey et al. 2017)",
##        caption = "Higher values indicate more 'Western' ideal points.") +
##   hrbrthemes::theme_ipsum() +
##   theme(text = element_text(colour = "#415564", family = "IBM Plex Sans"), #<<
##         plot.title = element_text(colour = "#415564", family = "IBM Plex Sans"), #<<
##         plot.subtitle = element_text(colour = "#415564", family = "IBM Plex Sans"), #<<
##         plot.background = element_rect(fill = "#f6f3f2", color = "#f6f3f2"), #<<
##         panel.border = element_blank(), #<<
##         axis.text = element_text(colour = "#415564"), #<<
##         axis.title = element_text(colour = "#415564")) #<<
## 


## ----layer10-out, ref.label = "layer10", echo = FALSE-------------------------


## ----layer11, tidy=FALSE, eval = FALSE----------------------------------------
## ggplot(data = ideal,
##        mapping = aes(x = year,
##                      y = IdealPointAll,
##                      color = iso3c)) +
##   geom_point(size = 2) +
##   geom_line(size = 1) +
##   scale_colour_brewer(palette = "Dark2") +
##   scale_x_continuous(breaks = seq(1950, 2020, 10)) +
##   labs(x = "\nYear",
##        y = "Ideal Point",
##        color = "Country",
##        title = "State foreign policy ideal points from 1946 to 2020",
##        subtitle = "Estimates based on votes in the UN General Assembly (Bailey et al. 2017)",
##        caption = "Higher values indicate more 'Western' ideal points.") +
##   hrbrthemes::theme_ipsum() +
##   theme(text = element_text(colour = "#415564", family = "IBM Plex Sans"),
##         plot.title = element_text(colour = "#415564", family = "IBM Plex Sans"),
##         plot.subtitle = element_text(colour = "#415564", family = "IBM Plex Sans"),
##         plot.background = element_rect(fill = "#f6f3f2", color = "#f6f3f2"),
##         panel.border = element_blank(),
##         axis.text = element_text(colour = "#415564"),
##         axis.title = element_text(colour = "#415564")) +
##   annotate(geom = "curve", xend = 1990, yend = 0.7, x = 1983, y = 0.5, #<<
##            curvature = -.3, arrow = arrow(length = unit(2, "mm")), color = "#415564") + #<<
##   annotate(geom = "text", x = 1971, y = 0.37, label = "End of Cold War", hjust = "left", color = "#415564") + #<<
##   annotate(geom = "curve", xend = 1994, yend = -1.7, x = 2003, y = -2.1, #<<
##            curvature = -.4, arrow = arrow(length = unit(2, "mm")), color = "#415564") + #<<
##   annotate(geom = "text", x = 2004, y = -2.1, label = "Post-Tianmen \nSquare", hjust = "left", color = "#415564") #<<


## ----layer11-out, ref.label = "layer11", echo = FALSE-------------------------


## ----layer12, tidy=FALSE, eval = FALSE----------------------------------------
## ideal <- ideal %>% #<<
##   mutate(iso3c = fct_relevel(iso3c, c("USA", "GBR", "FRA", "DEU", "RUS", "CHN"))) #<<
## 
## ggplot(data = ideal,
##        mapping = aes(x = year,
##                      y = IdealPointAll,
##                      color = iso3c,
##                      shape = iso3c)) + #<<
##   geom_point(size = 2) +
##   geom_line(size = 1) +
##   scale_colour_brewer(palette = "Dark2") +
##   scale_x_continuous(breaks = seq(1950, 2020, 10)) +
##   labs(x = "\nYear",
##        y = "Ideal Point",
##        color = "Country",
##        shape = "Country", #<<
##        title = "State foreign policy ideal points from 1946 to 2020",
##        subtitle = "Estimates based on votes in the UN General Assembly (Bailey et al. 2017)",
##        caption = "Higher values indicate more 'Western' ideal points.") +
##   hrbrthemes::theme_ipsum() +
##   theme(text = element_text(colour = "#415564", family = "IBM Plex Sans"),
##         plot.title = element_text(colour = "#415564", family = "IBM Plex Sans"),
##         plot.subtitle = element_text(colour = "#415564", family = "IBM Plex Sans"),
##         plot.background = element_rect(fill = "#f6f3f2", color = "#f6f3f2"),
##         panel.border = element_blank(),
##         axis.text = element_text(colour = "#415564"),
##         axis.title = element_text(colour = "#415564")) +
##   annotate(geom = "curve", xend = 1990, yend = 0.7, x = 1983, y = 0.5,
##            curvature = -.3, arrow = arrow(length = unit(2, "mm")), color = "#415564") +
##   annotate(geom = "text", x = 1971, y = 0.37, label = "End of Cold War", hjust = "left", color = "#415564") +
##   annotate(geom = "curve", xend = 1994, yend = -1.7, x = 2003, y = -2.1,
##            curvature = -.4, arrow = arrow(length = unit(2, "mm")), color = "#415564") +
##   annotate(geom = "text", x = 2004, y = -2.1, label = "Post-Tianmen \nSquare", hjust = "left", color = "#415564")
## 


## ----layer12-out, ref.label = "layer12", echo = FALSE-------------------------


## ----layer13, tidy=FALSE, eval = FALSE----------------------------------------
## ideal_fin <- filter(ideal, year == 2020) #<<
## 
## ggplot(data = ideal,
##        mapping = aes(x = year,
##                      y = IdealPointAll,
##                      color = iso3c)) +
##   geom_line(size = 1) +
##   scale_colour_brewer(palette = "Dark2") +
##   scale_x_continuous(breaks = seq(1950, 2020, 10)) +
##   labs(x = "\nYear",
##        y = "Ideal Point",
##        color = "Country",
##        title = "State foreign policy ideal points from 1946 to 2020",
##        subtitle = "Estimates based on votes in the UN General Assembly (Bailey et al. 2017)",
##        caption = "Higher values indicate more 'Western' ideal points.") +
##   hrbrthemes::theme_ipsum() +
##   theme(text = element_text(colour = "#415564", family = "IBM Plex Sans"),
##         plot.title = element_text(colour = "#415564", family = "IBM Plex Sans"),
##         plot.subtitle = element_text(colour = "#415564", family = "IBM Plex Sans"),
##         plot.background = element_rect(fill = "#f6f3f2", color = "#f6f3f2"),
##         panel.border = element_blank(),
##         axis.text = element_text(colour = "#415564"),
##         axis.title = element_text(colour = "#415564"),
##         legend.position = "none", #<<
##         axis.text.y.right = element_text(margin = margin(0, 0, 0, -20))) + #<<
##   annotate(geom = "curve", xend = 1990, yend = 0.7, x = 1983, y = 0.5,
##            curvature = -.3, arrow = arrow(length = unit(2, "mm")), color = "#415564") +
##   annotate(geom = "text", x = 1971, y = 0.37, label = "End of Cold War", hjust = "left", color = "#415564") +
##   annotate(geom = "curve", xend = 1994, yend = -1.7, x = 2003, y = -2.1,
##            curvature = -.4, arrow = arrow(length = unit(2, "mm")), color = "#415564") +
##   annotate(geom = "text", x = 2004, y = -2.1, label = "Post-Tianmen \nSquare", hjust = "left", color = "#415564") +
##   scale_y_continuous(sec.axis = dup_axis(breaks = ideal_fin$IdealPointAll, labels = c("USA", "GBR", "FRA", "DEU", "RUS", "CHN"), name = NULL)) #<<
## 


## ----layer13-out, ref.label = "layer13", echo = FALSE-------------------------


## -----------------------------------------------------------------------------
theme_set(plex)


## ---- eval = FALSE------------------------------------------------------------
## ggsave("ideal_points.png", width = 9, height = 7)


## ---- echo = FALSE, out.width = "50%"-----------------------------------------
knitr::include_graphics("Figs/ggplot2_blank.png")


## ---- echo = FALSE, out.width = "50%"-----------------------------------------
knitr::include_graphics("Figs/pingu.png")


## ----bar1, tidy=FALSE, eval = FALSE-------------------------------------------
## ggplot(penguins, aes(x = island, fill = species)) +
##   geom_bar(alpha = 0.8) +
##   scale_fill_brewer(palette = "Dark2")


## ----bar1-out, ref.label = "bar1", echo = FALSE-------------------------------


## ----bar2, tidy=FALSE, eval = FALSE-------------------------------------------
## ggplot(penguins, aes(x = island, fill = species)) +
##   geom_bar(alpha = 0.8) +
##   scale_fill_brewer(palette = "Dark2") +
##   facet_wrap(~species, ncol = 1) + #<<
##   coord_flip() + #<<
##   theme(legend.position = "none") #<<
## 


## ----bar2-out, ref.label = "bar2", echo = FALSE-------------------------------


## ----dist1, tidy=FALSE, eval = FALSE------------------------------------------
## ggplot(penguins, aes(x = species, y = flipper_length_mm)) +
##   geom_point(alpha = 0.6,
##              aes(color = species),
##              show.legend = FALSE) +
##   scale_color_brewer(palette = "Dark2")


## ----dist1-out, ref.label = "dist1", echo = FALSE-----------------------------


## ----dist2, tidy=FALSE, eval = FALSE------------------------------------------
## set.seed(213)
## ggplot(penguins, aes(x = species, y = flipper_length_mm, color = species)) + #<<
##   geom_point(alpha = 0.6, #<<
##              show.legend = FALSE,
##              position = position_jitter(seed = 213, width = .1)) + #<<
##   scale_color_brewer(palette = "Dark2")


## ----dist2-out, ref.label = "dist2", echo = FALSE-----------------------------


## ----dist3, tidy=FALSE, eval = FALSE------------------------------------------
## set.seed(213)
## penguins2 <- filter(penguins, flipper_length_mm != is.na(flipper_length_mm))
## ggplot(penguins2, aes(x = species, y = flipper_length_mm, color = species)) +
##   ggdist::stat_halfeye(adjust = .5, #<<
##                        width = .6, #<<
##                        .width = 0, #<<
##                        justification = -.3, #<<
##                        point_colour = NA, #<<
##                        aes(fill = species)) + #<<
##   geom_boxplot(width = .2, #<<
##                outlier.shape = NA, fill = "#f6f3f2") + #<<
##   geom_point(alpha = 0.3, #<<
##              position = position_jitter(seed = 213, width = .1)) +
##   scale_color_brewer(palette = "Dark2") +
##   scale_fill_brewer(palette = "Dark2") + #<<
##   theme(legend.position = "none") + #<<
##   coord_flip() #<<


## ----dist3-out, ref.label = "dist3", echo = FALSE-----------------------------


## ----dist4, tidy=FALSE, eval = FALSE------------------------------------------
## set.seed(213)
## penguins2 <- filter(penguins, flipper_length_mm != is.na(flipper_length_mm))
## 
## penguins2 <- penguins2 %>% #<<
##   group_by(species) %>% #<<
##   mutate(n = n()) %>% #<<
##   ungroup() %>% #<<
##   mutate(spec_n = paste0(species, " \n(n = ", n, ")")) #<<
## 
## ggplot(penguins2, aes(x = spec_n, y = flipper_length_mm, color = spec_n)) +
##   ggdist::stat_halfeye(adjust = .7,
##                        width = .6,
##                        .width = 0,
##                        justification = -.3,
##                        point_colour = NA,
##                        alpha = 0.6,
##                        aes(fill = spec_n)) +
##   geom_boxplot(width = .2,
##                outlier.shape = NA, fill = "#f6f3f2") +
##   geom_point(alpha = 0.3, #<<
##              position = position_jitter(seed = 213, width = .1)) +
##   scale_color_brewer(palette = "Dark2") +
##   scale_fill_brewer(palette = "Dark2") +
##   theme(legend.position = "none") +
##   coord_flip() +
##   labs(title = "Flipper Length of Brush-Tailed Penguins", #<<
##        x = "", #<<
##        y = "\nFlipper Length (mm)") #<<


## ----dist4-out, ref.label = "dist4", echo = FALSE-----------------------------


## ----dist5, fig.width = 10, fig.height = 4------------------------------------
ggplot(penguins, aes(x = flipper_length_mm, fill = species, color = species)) +
  geom_density(alpha = 0.3, adjust = .7) +
  labs(title = "Flipper Length of Brush-Tailed Penguins", #<<
       x = "\nFlipper Length (mm)") + #<<
  scale_fill_brewer(palette = "Dark2") +
  scale_color_brewer(palette = "Dark2")


## ---- eval = FALSE------------------------------------------------------------
## 
## ger_map <- sf::read_sf("data/.shapes/VG250_GEM.shp")
## elec_res <- rio::import("data/bundeswahlleiter_17.rds")
## afd_plot <- dplyr::left_join(ger_map, elec_res, by = c("AGS" = "ags"))
## 
## ggplot(afd_plot) +
##   geom_sf(aes(fill = afd_share),
##           size = 0.1,
##           color = "#415564") +
##   scale_fill_gradient(low = "#f6f4f2",
##                       high = "#014980") +
##   labs(title = "AfD Vote Share: 2017 Federal Elections",
##        subtitle = "Municipal-Level Data",
##        fill = "AfD Vote Share (%)",
##        caption = "Source: Bundeswahlleiter; Shapefiles: https://www.govdata.de/.")
## 
## 


## ---- echo = FALSE------------------------------------------------------------
knitr::include_graphics("Figs/map.png")


## ----patch, tidy=FALSE, eval = FALSE------------------------------------------
## 
## p1 <- ggplot(data = penguins, aes(x = bill_length_mm, y = bill_depth_mm)) +
##   geom_point(aes(color = species, shape = species), size = 2)
## 
## p2 <- ggplot(data = penguins, aes(x = flipper_length_mm)) +
##   geom_histogram(aes(fill = species), alpha = 0.5, position = "identity")
## 
## p1 / p2
## 


## ----patch-out, ref.label = "patch", echo = FALSE-----------------------------


## ----print pdf, include=FALSE-------------------------------------------------
pagedown::chrome_print("05_Data_Viz.html")


## ----xaringanExtra-share-again, echo=FALSE------------------------------------
xaringanExtra::use_share_again()


## ----xaringanExtra-clipboard, echo=FALSE--------------------------------------
xaringanExtra::use_clipboard()

