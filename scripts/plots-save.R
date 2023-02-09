# setup -------------------------------------------------------------------
height <- 12
width <- 12
units <- "cm"

# publication ready tables ------------------------------------------------

# Don't need to version these files on git
# tab_inf %>%
#   as_gt() %>%
#   as_rtf() %>%
#   writeLines(con = "report/SAR-2023-007-TG-v01-T2.rtf")

# save plots --------------------------------------------------------------

ggsave(filename = "figures/num.png", plot = gg.num, height = 16, width = width, units = units)
ggsave(filename = "figures/cat.png", plot = gg.cat, height = 16, width = width, units = units)
ggsave(filename = "figures/distr_obito.png", plot = gg.obito, height = height, width = width, units = units)
ggsave(filename = "figures/distr_cm.png", plot = gg.cm, height = height, width = width, units = units)
ggsave(filename = "figures/distr_grau.png", plot = gg.grau, height = height, width = width, units = units)
ggsave(filename = "figures/distr_pt.png", plot = gg.pt, height = height, width = width, units = units)
ggsave(filename = "figures/distr_pm.png", plot = gg.pm, height = height, width = width, units = units)
ggsave(filename = "figures/distr_pn.png", plot = gg.pn, height = height, width = width, units = units)
