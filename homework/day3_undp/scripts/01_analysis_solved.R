# =============================================================================
# CAPSTONE DÍA 3 — Desigualdad de género y esperanza de vida (UNDP 2021)
# VERSIÓN CON SOLUCIONES
#
# Pregunta de investigación:
#   ¿Existe una relación entre el Índice de Desigualdad de Género (GII) y
#   la esperanza de vida en los países de Europa y Asia Central en 2021?
#
# Dataset: data/raw_data/data_undp.csv
# =============================================================================


# -----------------------------------------------------------------------------
# 0. Setup ---------------------------------------------------------------------
# -----------------------------------------------------------------------------

library(tidyverse)
library(easystats)
options(scipen = 999)


# -----------------------------------------------------------------------------
# 1. Importar y explorar el dataset --------------------------------------------
# -----------------------------------------------------------------------------

undp_raw <- read_csv("data/raw_data/data_undp.csv")

# dimensiones del dataset
dim(undp_raw)
nrow(undp_raw)
ncol(undp_raw)


# -----------------------------------------------------------------------------
# 2. Seleccionar variables de 2021 ---------------------------------------------
# -----------------------------------------------------------------------------

undp <- undp_raw |>
  select(
    country,
    region,
    hdicode,
    hdi_2021,
    le_2021,
    gnipc_2021,
    gii_2021
  )

undp


# -----------------------------------------------------------------------------
# 3. Filtrar por región --------------------------------------------------------
# -----------------------------------------------------------------------------

# quedarse con Europa y Asia Central (ECA) y eliminar NAs en gii/le
eca <- undp |>
  filter(region == "ECA") |>   # 'region' es la columna del dataset, no lleva tilde
  drop_na(gii_2021, le_2021)

eca


# -----------------------------------------------------------------------------
# 4. Estadísticos descriptivos -------------------------------------------------
# -----------------------------------------------------------------------------

eca |>
  summarise(
    gii_media  = mean(gii_2021),
    gii_dt     = sd(gii_2021),
    gii_med    = median(gii_2021),
    gii_iqr    = IQR(gii_2021),
    le_media   = mean(le_2021),
    le_dt      = sd(le_2021),
    le_med     = median(le_2021),
    le_iqr     = IQR(le_2021)
  )


# -----------------------------------------------------------------------------
# 5. Comprobar normalidad ------------------------------------------------------
# -----------------------------------------------------------------------------

shapiro.test(eca$gii_2021)
shapiro.test(eca$le_2021)

# Si el p-valor es < 0.05, rechazamos la hipótesis nula de normalidad.


# -----------------------------------------------------------------------------
# 6. Calcular la correlación ---------------------------------------------------
# -----------------------------------------------------------------------------

# Pearson (asumiendo normalidad razonable)
cor.test(eca$gii_2021, eca$le_2021)

# alternativa robusta: Spearman
cor.test(eca$gii_2021, eca$le_2021, method = "spearman")


# -----------------------------------------------------------------------------
# 7. Generar el texto APA con report() -----------------------------------------
# -----------------------------------------------------------------------------

report(cor.test(eca$gii_2021, eca$le_2021))


# -----------------------------------------------------------------------------
# 8. Pregunta de interpretación ------------------------------------------------
# -----------------------------------------------------------------------------

# La correlación entre gii_2021 y le_2021 es negativa y significativa:
# a mayor desigualdad de género, menor esperanza de vida en los países
# de Europa y Asia Central. Esto es consistente con la literatura: las
# sociedades más igualitarias tienden a tener mejores indicadores de
# salud poblacional.


# -----------------------------------------------------------------------------
# 9. BONUS — Comparar regiones -------------------------------------------------
# -----------------------------------------------------------------------------

gii_by_region <- undp |>
  drop_na(gii_2021) |>
  group_by(region) |>
  summarise(
    media_gii = mean(gii_2021),
    n         = n(),
    .groups   = "drop"
  ) |>
  arrange(desc(media_gii))

gii_by_region

# región con mayor desigualdad promedio
gii_by_region |> slice_head(n = 1)

# región con menor desigualdad promedio
gii_by_region |> slice_tail(n = 1)
