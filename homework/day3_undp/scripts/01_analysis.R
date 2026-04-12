# =============================================================================
# CAPSTONE DÍA 3 — Desigualdad de género y esperanza de vida (UNDP 2021)
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

# El dataset tiene MÁS DE 1000 columnas (una por año, para cada indicador).
# Para este ejercicio nos quedaremos solo con los datos de 2021.

undp_raw <- read_csv("data/raw_data/data_undp.csv")

# Cuántas filas (países) y cuántas columnas hay?
# TU CÓDIGO AQUÍ


# -----------------------------------------------------------------------------
# 2. Seleccionar variables de 2021 ---------------------------------------------
# -----------------------------------------------------------------------------

# Queremos estas variables:
#   country      — nombre del país
#   region       — código de región
#   hdicode      — categoría de desarrollo
#   hdi_2021     — Human Development Index
#   le_2021      — esperanza de vida
#   gnipc_2021   — ingreso nacional bruto per cápita
#   gii_2021     — Gender Inequality Index
#
# Guarda el resultado en 'undp'.

undp <- undp_raw |>
  select(
    # TU CÓDIGO AQUÍ
  )

undp


# -----------------------------------------------------------------------------
# 3. Filtrar por región --------------------------------------------------------
# -----------------------------------------------------------------------------

# Nos vamos a centrar en la región ECA (Europa y Asia Central).
# Filtra 'undp' por region == "ECA" y guárdalo en 'eca'.
# Elimina también las filas que tengan NA en gii_2021 o le_2021.
# Pista: drop_na() del paquete tidyr, o filter(!is.na(...))

eca <- undp |>
  # TU CÓDIGO AQUÍ


eca


# -----------------------------------------------------------------------------
# 4. Estadísticos descriptivos -------------------------------------------------
# -----------------------------------------------------------------------------

# Calcula para 'gii_2021' y 'le_2021':
#   - Media
#   - Desviación típica
#   - Mediana
#   - Rango intercuartílico (IQR)

# TU CÓDIGO AQUÍ


# -----------------------------------------------------------------------------
# 5. Comprobar normalidad ------------------------------------------------------
# -----------------------------------------------------------------------------

# Usa shapiro.test() en 'gii_2021' y en 'le_2021'.
# Si el p-valor es < 0.05, los datos NO siguen una distribución normal
# → deberíamos usar Spearman en lugar de Pearson.

# TU CÓDIGO AQUÍ


# -----------------------------------------------------------------------------
# 6. Calcular la correlación ---------------------------------------------------
# -----------------------------------------------------------------------------

# Calcula la correlación entre 'gii_2021' y 'le_2021'.
# Si los datos NO son normales, usa method = "spearman".
# Si SÍ son normales, puedes usar Pearson (por defecto).

cor.test(
  # TU CÓDIGO AQUÍ
)


# -----------------------------------------------------------------------------
# 7. Generar el texto APA con report() -----------------------------------------
# -----------------------------------------------------------------------------

# Usa report() del paquete easystats para generar un resumen automático.
# Pista: report(cor.test(...))

# TU CÓDIGO AQUÍ


# -----------------------------------------------------------------------------
# 8. Pregunta de interpretación (responde en un comentario) --------------------
# -----------------------------------------------------------------------------

# ¿Es significativa la correlación? ¿En qué dirección?
# ¿Qué sugiere esto sobre la relación entre desigualdad de género
# y esperanza de vida?
#
# RESPUESTA:
#


# -----------------------------------------------------------------------------
# 9. BONUS — Comparar regiones con pivot_longer() ------------------------------
# -----------------------------------------------------------------------------

# Si te sobra tiempo: compara la media de gii_2021 entre TODAS las regiones
# (no solo ECA). ¿Qué región tiene la mayor desigualdad de género en promedio?
# ¿Cuál la menor?
#
# Pista: group_by(region) + summarise(media_gii = mean(gii_2021, na.rm = TRUE))

# TU CÓDIGO AQUÍ
