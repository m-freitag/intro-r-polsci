pacman::p_load(
  tidyverse,
  showtext,
  dagitty,
  ggdag,
  data.table,
  patchwork,
  ggtext,
  rvest
)


font_add_google(
  name = "IBM Plex Sans",
  family = "plex"
)

showtext_auto()

theme_set(theme_classic() +
            theme(
              text = element_text(family = "plex", size = 25, colour="#415564"),
              panel.background = element_rect(fill = "#f6f3f2"), 
              plot.background = element_rect(fill = "#f6f3f2", color = "#f6f3f2"), 
              panel.grid.major = element_line(colour="#e8e8e8"),
              panel.grid.minor = element_blank(), 
              legend.background = element_rect(fill = "#f6f3f2"), 
              legend.box.background = element_rect(fill = "#f6f3f2"), 
              axis.text = element_text(colour="#415564"),
              axis.line = element_line(colour="#415564"),
              axis.title = element_text(colour="#415564"),
              axis.ticks = element_line(colour="#415564"),
            ))


emoji_to_link <- function(x) {
  paste0("https://emojipedia.org/emoji/",x) %>%
    read_html() %>%
    html_nodes("tr td a") %>%
    .[1] %>%
    html_attr("href") %>%
    paste0("https://emojipedia.org/", .) %>%
    read_html() %>%
    html_node('div[class="vendor-image"] img') %>%
    html_attr("src")
}

link_to_img <- function(x, size = 25) {
  paste0("<img src='", x, "' width='", size, "'/>")
}

x <- data.frame(language = c("Python", "R", "Julia", "SPSS", "Stata"),
                popularity = c(4210, 2115, 154, 277, 73) ,
                speed = c(60, 50, 95, 0, 20),
                syntax = c(60, 50, 90, 5, 30)
)

x <- x %>%
  mutate(url = map_chr(c("😡", "😟", "😐", "🙂", "🤩"), slowly(~emoji_to_link(.x), rate_delay(1))),
         label = link_to_img(url))



p <- x %>%
  ggplot(aes(x = language, y = popularity)) +
  geom_col(fill = "#415564") +
  geom_hline(yintercept = 0) +
  aes(x = reorder(language, -popularity)) +
  xlab("") +
  scale_y_continuous(label = scales::comma) +
  ylab("Number of Jobs")  +
  labs(subtitle = "DS Jobs on Indeed.com, 01/05/2021")


p1 <- x %>%
  ggplot(aes(x = language, y = syntax)) +
  geom_col(fill = "#415564") +
  geom_hline(yintercept = 0) +
  aes(x = reorder(language, -syntax))  +
  xlab("") +
  scale_y_continuous(limits = c(0, 100), labels = x$label) +
  theme(axis.text.y = element_markdown()) + ylab("Syntax")
p1

z = p + p1

ggsave(z, filename = "whyr.png", width = 17, height = 7, units = "cm")