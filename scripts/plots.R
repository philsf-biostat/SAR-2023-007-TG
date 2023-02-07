# setup -------------------------------------------------------------------
# library(survminer)

ff.col <- "steelblue" # good for single groups scale fill/color brewer
ff.pal <- "Paired"    # good for binary groups scale fill/color brewer

gg <- analytical %>%
  select(-id) %>%
  pivot_longer(
    -c(exposure, dvl_it, dvl_pt, tu, num_linf, ki67),
    names_to = "names_cat",
    values_to = "values_cat",
    ) %>%
  pivot_longer(
    -where(is.character),
    names_to = "names_num",
    values_to = "values_num",
    ) %>%
  ggplot() +
  scale_color_brewer(palette = ff.pal) +
  scale_fill_brewer(palette = ff.pal) +
  labs(fill = "IVL") +
  theme_ff()

# plots -------------------------------------------------------------------

gg.num <- gg +
  geom_density(aes(values_num, fill = exposure), alpha = .8) +
  facet_wrap(~ names_num, scales = "free", ncol = 2) +
  labs(x = "", y = "Densidade da distribuição")

gg.cat <- gg +
  geom_bar(aes(values_cat, fill = exposure), position = "fill") +
  scale_y_continuous(labels = scales::label_percent(accuracy = 1)) +
  facet_wrap(~ names_cat, scales = "free", ncol = 2) +
  labs(x = "", y = "")


# cool facet trick from https://stackoverflow.com/questions/3695497 by JWilliman
# gg +
#   geom_histogram(bins = 10, aes(values_num, y = ..count../tapply(..count.., ..PANEL.., sum)[..PANEL..], fill = exposure)) +
#   scale_y_continuous(labels = scales::label_percent(accuracy = 1)) +
#   xlab(attr(analytical$outcome, "label")) +
#   ylab("") +
#   facet_wrap(~ names_num, scales = "free", ncol = 2)
