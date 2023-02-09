# setup -------------------------------------------------------------------
library(philsfmisc)
# library(data.table)
library(tidyverse)
library(readxl)
# library(haven)
# library(foreign)
# library(lubridate)
# library(naniar)
library(labelled)

# data loading ------------------------------------------------------------
set.seed(42)
# data.raw <- tibble(id=gl(2, 10), exposure = gl(2, 10), outcome = rnorm(20))
data.raw <- read_excel("dataset/Dados tese Teresa.xlsx") %>%
  janitor::clean_names()

Nvar_orig <- data.raw %>% ncol
Nobs_orig <- data.raw %>% nrow

# data cleaning -----------------------------------------------------------

data.raw <- data.raw %>%
  rename(
    id = caso,
    exposure = ivl,
  ) %>%
  select(
    everything(),
  ) %>%
  mutate(
  ) %>%
  filter(
  )

# data wrangling ----------------------------------------------------------

data.raw <- data.raw %>%
  mutate(
    id = as.character(id), # or as.factor
    # exposure = factor(exposure, labels = c("Sem invasão", "IVL")),
    # obito = factor(obito, labels = c("Não", "Óbito")),
    grau = factor(grau),
    cm = factor(cm, labels = c("Luminal A", "Luminal B", "HER2+", "Triplo negativo")),
  )

# labels ------------------------------------------------------------------

data.raw <- data.raw %>%
  set_variable_labels(
    exposure = "IVL",
    # outcome = "Study outcome",
    obito = "Óbito",
    grau = "Grau",
    cm = "Subtipo molecular",
    dvl_it = "DVL (IT)",
    dvl_pt= "DVL (PT)",
    p_t = "pT",
    p_m = "pM",
    p_n = "pN",
    tu = "Tamanho do tumor (mm)",
    num_linf = "Número de linfonodos",
    ki67 = "KI67",
  )

# analytical dataset ------------------------------------------------------

analytical <- data.raw %>%
  # select analytic variables
  select(
    id,
    exposure,
    obito,
    everything(),
    -diagnostico,
  )

Nvar_final <- analytical %>% ncol
Nobs_final <- analytical %>% nrow

# mockup of analytical dataset for SAP and public SAR
analytical_mockup <- tibble( id = c( "1", "2", "3", "...", "N") ) %>%
# analytical_mockup <- tibble( id = c( "1", "2", "3", "...", as.character(Nobs_final) ) ) %>%
  left_join(analytical %>% head(0), by = "id") %>%
  mutate_all(as.character) %>%
  replace(is.na(.), "")
