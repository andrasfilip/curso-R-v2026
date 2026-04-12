# =============================================================================
# CAPSTONE DÍA 5 — Pingüinos: borrador de análisis
#
# Este script es un CUADERNO DE EXPLORACIÓN — úsalo para probar código
# antes de copiarlo al reporte final (scripts/02_report.qmd).
#
# Dataset: data/raw_data/penguins_sample.csv
# =============================================================================


# -----------------------------------------------------------------------------
# 0. Setup ---------------------------------------------------------------------
# -----------------------------------------------------------------------------

library(tidyverse)
library(easystats)
options(scipen = 999)


# -----------------------------------------------------------------------------
# 1. Importar y explorar -------------------------------------------------------
# -----------------------------------------------------------------------------

penguins <- read_csv("data/raw_data/penguins_sample.csv")

# Explora el dataset
glimpse(penguins)

# Cuenta cuántos pingüinos hay por especie
# TU CÓDIGO AQUÍ


# -----------------------------------------------------------------------------
# 2. Limpiar datos -------------------------------------------------------------
# -----------------------------------------------------------------------------

# Elimina las filas que tengan NA en 'body_mass_g' o 'sex'.
# Guarda el resultado en 'penguins_clean'.

penguins_clean <- penguins |>
  # TU CÓDIGO AQUÍ


# -----------------------------------------------------------------------------
# 3. Estadísticos descriptivos -------------------------------------------------
# -----------------------------------------------------------------------------

# Calcula media y desviación típica de 'body_mass_g' por especie.

# TU CÓDIGO AQUÍ


# -----------------------------------------------------------------------------
# 4. Visualización -------------------------------------------------------------
# -----------------------------------------------------------------------------

# Prueba tres tipos de gráficos:
#
# a) Histograma de body_mass_g
# TU CÓDIGO AQUÍ


# b) Boxplot de body_mass_g por especie
# TU CÓDIGO AQUÍ


# c) Scatter plot de flipper_length_mm vs. body_mass_g, coloreado por especie
# TU CÓDIGO AQUÍ


# -----------------------------------------------------------------------------
# 5. Modelo estadístico --------------------------------------------------------
# -----------------------------------------------------------------------------

# ¿Difiere la masa corporal entre especies?
# Ajusta una ANOVA: body_mass_g ~ species
# Usa aov() + summary(), y luego report() para el texto APA.

modelo <- aov(
  # TU CÓDIGO AQUÍ
)

# TU CÓDIGO AQUÍ


# -----------------------------------------------------------------------------
# Cuando tengas todo funcionando, copia los fragmentos al reporte final:
# scripts/02_report.qmd
# -----------------------------------------------------------------------------
