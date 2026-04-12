# =============================================================================
# CAPSTONE DÍA 2 — Brecha salarial de género en España (2008–2017)
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

# Carga el dataset desde data/raw_data/data_salary.csv
salary <- read_csv("data/raw_data/data_salary.csv")

# Explora la estructura con glimpse()
# TU CÓDIGO AQUÍ


# Mira cuántas filas hay por cada valor de las variables categóricas.
# Pista: usa table() con salary$gender, salary$statistic, salary$year
# TU CÓDIGO AQUÍ


# -----------------------------------------------------------------------------
# 2. Filtrar el dataset --------------------------------------------------------
# -----------------------------------------------------------------------------

# Queremos quedarnos solo con:
#   - Las filas donde statistic == "mean" (media, no cuartiles)
#   - Excluir el valor gender == "both" (solo hombres y mujeres)
#   - Años entre 2008 y 2017
#
# Guarda el resultado en 'salary_clean'.

salary_clean <- salary |>
  filter(
    # TU CÓDIGO AQUÍ
  )

salary_clean


# -----------------------------------------------------------------------------
# 3. Calcular el salario medio nacional por año y género -----------------------
# -----------------------------------------------------------------------------

# Agrupa por 'year' y 'gender', y calcula la media de 'gross_income_euros'.
# Guarda el resultado en 'salary_by_year'.
#
# Pista: group_by() + summarise() + mean()

salary_by_year <- salary_clean |>
  # TU CÓDIGO AQUÍ


salary_by_year


# -----------------------------------------------------------------------------
# 4. Pivotar a formato ancho ---------------------------------------------------
# -----------------------------------------------------------------------------

# Queremos una fila por año, con dos columnas: 'male' y 'female'.
# Usa pivot_wider() (está en tidyr, ya cargado con tidyverse).
# Pista: names_from = gender, values_from = la columna con la media.

salary_wide <- salary_by_year |>
  # TU CÓDIGO AQUÍ


salary_wide


# -----------------------------------------------------------------------------
# 5. Calcular la brecha salarial -----------------------------------------------
# -----------------------------------------------------------------------------

# Crea una nueva columna 'gap' = male - female.
# Ordena por 'gap' de mayor a menor (descending) con arrange() y desc().

salary_wide |>
  mutate(gap = # TU CÓDIGO AQUÍ) |>
  arrange( # TU CÓDIGO AQUÍ )


# -----------------------------------------------------------------------------
# 6. Pregunta de interpretación (responde en un comentario) --------------------
# -----------------------------------------------------------------------------

# ¿En qué año fue mayor la brecha? ¿En cuál fue menor?
# ¿Se ha reducido la brecha con el tiempo?
#
# RESPUESTA:
#


# -----------------------------------------------------------------------------
# 7. BONUS — brecha por comunidad autónoma -------------------------------------
# -----------------------------------------------------------------------------

# Si te sobra tiempo: calcula la brecha (male - female) en el año 2017,
# pero ahora por comunidad autónoma (la columna 'state').
# ¿Qué comunidad tiene la mayor brecha en 2017? ¿Y la menor?

# TU CÓDIGO AQUÍ
