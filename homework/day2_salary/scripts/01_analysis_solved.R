# =============================================================================
# CAPSTONE DÍA 2 — Brecha salarial de género en España (2008–2017)
# VERSIÓN CON SOLUCIONES
#
# Pregunta de investigación:
#   ¿Cómo ha evolucionado la brecha salarial de género en España entre
#   2008 y 2017?
#
# Dataset: data/raw_data/data_salary.csv (INE — Encuesta de Estructura Salarial)
# =============================================================================


# -----------------------------------------------------------------------------
# 0. Setup ---------------------------------------------------------------------
# -----------------------------------------------------------------------------

library(tidyverse)
options(scipen = 999)


# -----------------------------------------------------------------------------
# 1. Importar y explorar los datos ---------------------------------------------
# -----------------------------------------------------------------------------

salary <- read_csv("data/raw_data/data_salary.csv")

# estructura del dataset
glimpse(salary)

# frecuencias de las variables categoricas
table(salary$gender)
table(salary$statistic)
table(salary$year)


# -----------------------------------------------------------------------------
# 2. Filtrar el dataset --------------------------------------------------------
# -----------------------------------------------------------------------------

# solo la media (excluye cuartiles), solo male/female, años 2008-2017
salary_clean <- salary |>
  filter(
    statistic == "mean",
    gender != "both",
    year >= 2008,
    year <= 2017
  )

salary_clean


# -----------------------------------------------------------------------------
# 3. Calcular el salario medio nacional por año y género -----------------------
# -----------------------------------------------------------------------------

salary_by_year <- salary_clean |>
  group_by(year, gender) |>
  summarise(
    mean_income = mean(gross_income_euros, na.rm = TRUE),
    .groups = "drop"
  )

salary_by_year


# -----------------------------------------------------------------------------
# 4. Pivotar a formato ancho ---------------------------------------------------
# -----------------------------------------------------------------------------

salary_wide <- salary_by_year |>
  pivot_wider(
    names_from  = gender,
    values_from = mean_income
  )

salary_wide


# -----------------------------------------------------------------------------
# 5. Calcular la brecha salarial -----------------------------------------------
# -----------------------------------------------------------------------------

salary_wide |>
  mutate(gap = male - female) |>
  arrange(desc(gap))


# -----------------------------------------------------------------------------
# 6. Pregunta de interpretación ------------------------------------------------
# -----------------------------------------------------------------------------

# La brecha salarial (male - female) es positiva en todos los años: los
# hombres ganan más en promedio. Suele ser mayor al principio del periodo
# (2008-2010) y se reduce lentamente hacia 2017, aunque sin desaparecer.
# Esto sugiere una mejora gradual pero insuficiente.


# -----------------------------------------------------------------------------
# 7. BONUS — brecha por comunidad autónoma -------------------------------------
# -----------------------------------------------------------------------------

# brecha por CCAA en el año 2017
gap_ccaa_2017 <- salary_clean |>
  filter(year == 2017) |>
  group_by(state, gender) |>
  summarise(
    mean_income = mean(gross_income_euros, na.rm = TRUE),
    .groups = "drop"
  ) |>
  pivot_wider(names_from = gender, values_from = mean_income) |>
  mutate(gap = male - female) |>
  arrange(desc(gap))

gap_ccaa_2017

# CCAA con mayor brecha
gap_ccaa_2017 |> slice_head(n = 1)

# CCAA con menor brecha
gap_ccaa_2017 |> slice_tail(n = 1)
