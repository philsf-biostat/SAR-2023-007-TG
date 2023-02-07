# setup -------------------------------------------------------------------
height <- 16
width <- 12
units <- "cm"

# publication ready tables ------------------------------------------------

# Don't need to version these files on git
# tab_inf %>%
#   as_gt() %>%
#   as_rtf() %>%
#   writeLines(con = "report/SAR-2023-007-TG-v01-T2.rtf")

# save plots --------------------------------------------------------------

ggsave(filename = "figures/num.png", plot = gg.num, height = height, width = width, units = units)
ggsave(filename = "figures/cat.png", plot = gg.cat, height = height, width = width, units = units)
