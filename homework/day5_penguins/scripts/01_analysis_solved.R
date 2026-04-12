# =============================================================================
# CAPSTONE DÍA 5 — Pingüinos: borrador de análisis
# VERSIÓN CON SOLUCIONES
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

glimpse(penguins)

# pingüinos por especie
penguins |>
  count(species)

# alternativa con table()
table(penguins$species)


# -----------------------------------------------------------------------------
# 2. Limpiar datos -------------------------------------------------------------
# -----------------------------------------------------------------------------

penguins_clean <- penguins |>
  drop_na(body_mass_g, sex)

penguins_clean


# -----------------------------------------------------------------------------
# 3. Estadísticos descriptivos -------------------------------------------------
# -----------------------------------------------------------------------------

penguins_clean |>
  group_by(species) |>
  summarise(
    media = mean(body_mass_g),
    dt    = sd(body_mass_g),
    n     = n(),
    .groups = "drop"
  )


# -----------------------------------------------------------------------------
# 4. Visualización -------------------------------------------------------------
# -----------------------------------------------------------------------------

# a) Histograma de body_mass_g
ggplot(penguins_clean, aes(x = body_mass_g)) +
  geom_histogram(bins = 25, fill = "steelblue", color = "white") +
  labs(
    x     = "Masa corporal (g)",
    y     = "Frecuencia",
    title = "Distribucion de la masa corporal"   # ASCII en labs() (regla del proyecto)
  ) +
  theme_minimal()


# b) Boxplot de body_mass_g por especie
ggplot(penguins_clean, aes(x = species, y = body_mass_g, fill = species)) +
  geom_boxplot(alpha = 0.7) +
  labs(
    x     = "Especie",
    y     = "Masa corporal (g)",
    title = "Masa corporal por especie"
  ) +
  theme_minimal() +
  theme(legend.position = "none")


# c) Scatter flipper_length_mm vs body_mass_g por especie
ggplot(penguins_clean,
       aes(x = flipper_length_mm, y = body_mass_g, color = species)) +
  geom_point(alpha = 0.7, size = 2) +
  geom_smooth(method = "lm", se = TRUE) +
  labs(
    x     = "Longitud de aleta (mm)",
    y     = "Masa corporal (g)",
    color = "Especie",
    title = "Relacion entre longitud de aleta y masa corporal"   # ASCII en labs()
  ) +
  theme_minimal()


# -----------------------------------------------------------------------------
# 5. Modelo estadístico --------------------------------------------------------
# -----------------------------------------------------------------------------

modelo <- aov(body_mass_g ~ species, data = penguins_clean)
summary(modelo)

# texto APA automático
report(modelo)


# -----------------------------------------------------------------------------
# Cuando tengas todo funcionando, copia los fragmentos al reporte final:
# scripts/02_report.qmd
# -----------------------------------------------------------------------------
