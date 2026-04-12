# ============================================================
# EJERCICIOS - DIA 3 (versión ESTUDIANTE)
# Curso: Introduccion a programacion y análisis de datos en R
# Efrain Garcia Sanchez & Filip Andras
# CIMCYC - Universidad de Granada
# ============================================================
#
# Como usar este script:
#   1. Lee el enunciado de cada ejercicio (lineas comentadas).
#   2. Escribe tu propia solución en un nuevo script o en las
#      lineas en blanco debajo del enunciado.
#   3. Al final de cada ejercicio encontraras la SOLUCION de
#      referencia. No mires la solución hasta intentarlo.


# ============================================================
# CARGAR PAQUETES Y DATOS
# ============================================================

# 1. cargar tidyverse
library(tidyverse)

# 2. intenta leer el dataset. ¿Funciona? ¿Por que?
data_trial <- read_csv("data/data_clinical_trial.csv")

# 3. comprueba tu directorio de trabajo
getwd()

# si la ruta no funciona, ajustala. Pista: si estas en
# exercises/scripts/, necesitas subir dos niveles con ../../
# data_trial <- read_csv("../../data/data_clinical_trial.csv")

# 4. explora el dataset
View(data_trial)
glimpse(data_trial)

# 5. cuantos pacientes por grupo?
table(data_trial$group)


# ============================================================
# BLOQUE 1
# ============================================================

# ------------------------------------------------------------
# EJERCICIO: Mini-ejercicio — tu primer pivot_longer()
# ------------------------------------------------------------
# Tiempo: 5 minutos
#
#
# Tienes este tibble en formato ancho:
#
#
#
# 1. Usa `pivot_longer()` para convertirlo a formato largo, donde las columnas `dia_*` se apilen en una sola columna llamada `día` y los valores en una columna llamada `puntuacion`.
# 2. ¿Cuántas filas tiene el resultado?

# Tu solución aquí:


# ------------------------------------------------------------
# EJERCICIO: Reestructurar datos de pacientes
# ------------------------------------------------------------
# Tiempo: 15 minutos
#
#
# 1. Toma `data_trial` y filtra para el grupo **"CBT"**
# 2. Selecciona `patient_id`, `group`, `anxiety_pre`, `anxiety_post`
# 3. Usa `pivot_longer()` para convertir `anxiety_pre` y `anxiety_post` en formato largo (columnas: `momento` y `anxiety`)
# 4. ¿Cuántas filas tiene el resultado?
# 5. *Bonus*: Calcula la media de `anxiety` por `group` y `momento` usando `group_by()` + `summarise()`
#
# Plantilla (copiala y completa los huecos):
#
#   # 1-2. filtrar y seleccionar
#   trial_long <- data_trial |>
#     filter(# TU_CODIGO_AQUI) |>
#     select(patient_id, group, anxiety_pre, anxiety_post)
#   
#   # 3. convertir a formato largo
#   trial_long |>
#     pivot_longer(
#       cols      = # TU_CODIGO_AQUI,
#       names_to  = "momento",
#       values_to = "anxiety"
#     )
#

# Tu solución aquí:


# ============================================================
# BLOQUE 2
# ============================================================

# ------------------------------------------------------------
# EJERCICIO: Mini-ejercicio — mediana y cuartiles
# ------------------------------------------------------------
# Tiempo: 5 minutos
#
#
# Usando `data_trial`, calcula para la variable `anxiety_pre`:
#
# 1. La **mediana** con `median()`
# 2. Los cuartiles Q1 y Q3 con `quantile()` (probabilidades 0.25 y 0.75)
# 3. El **rango intercuartílico** (IQR) usando `IQR()`
# 4. Compara con la **media** y la **desviación típica**

# Tu solución aquí:


# ------------------------------------------------------------
# EJERCICIO: Explorar el ensayo clínico
# ------------------------------------------------------------
# Tiempo: 15 minutos
#
#
# 1. Calcula media y DT de `anxiety_post` por `sex`
# 2. Comprueba la normalidad de `anxiety_post` en el grupo **pharmacological**
# 3. Calcula la correlación entre `anxiety_post` y `age`. ¿Es significativa?
# 4. Calcula la correlación entre `anxiety_pre` y `anxiety_post`. ¿Qué esperas encontrar?
#
# Plantilla (copiala y completa los huecos):
#
#   # 1. descriptivos por sexo
#   data_trial |>
#     group_by(# TU_CODIGO_AQUI) |>
#     summarise(
#       media = # TU_CODIGO_AQUI,
#       dt    = # TU_CODIGO_AQUI
#     )
#   
#   # 2. normalidad en grupo farmacologico
#   grupo_farm <- data_trial |> filter(# TU_CODIGO_AQUI)
#   shapiro.test(# TU_CODIGO_AQUI)
#   
#   # 3. correlación ansiedad post y edad
#   cor.test(# TU_CODIGO_AQUI, # TU_CODIGO_AQUI)
#   
#   # 4. correlación ansiedad pre y post
#   cor.test(# TU_CODIGO_AQUI, # TU_CODIGO_AQUI)
#

# Tu solución aquí:


# ============================================================
# BLOQUE 3
# ============================================================

# ------------------------------------------------------------
# EJERCICIO: Mini-ejercicio — CBT vs pharmacological
# ------------------------------------------------------------
# Tiempo: 5 minutos
#
#
# En el dataset `data_trial`:
#
# 1. Filtra solo los grupos `"CBT"` y `"pharmacological"` (guárdalo en `trial_cbt_pharma`)
# 2. Ejecuta un t-test independiente comparando `anxiety_post` entre ambos grupos
# 3. Genera el resumen APA con `report()`

# Tu solución aquí:


# ------------------------------------------------------------
# EJERCICIO: Analizar el ensayo clínico
# ------------------------------------------------------------
# Tiempo: 30 minutos
#
#
# 1. Ejecuta un t-test de **una muestra** para comprobar si la ansiedad post-tratamiento es significativamente menor que 12
# 2. Compara `anxiety_post` entre CBT y pharmacological con un t-test de **muestras independientes**
# 3. Ejecuta un t-test **pareado** comparando pre vs. post en el grupo pharmacological
# 4. Calcula el tamaño del efecto (d de Cohen) para la comparación pareada
# 5. Usa `report()` para generar el resumen APA del t-test pareado
# 6. *Bonus*: ¿Qué grupo muestra el mayor cambio pre→post?
#
# Plantilla (copiala y completa los huecos):
#
#   # --- 1. t-test de una muestra (mu = 12) --------------------------------------
#   # TU_CODIGO_AQUI
#   
#   # --- 2. t-test independiente: CBT vs. pharmacological ------------------------
#   trial_pharma_cbt <- data_trial |>
#     filter(group %in% c("CBT", "pharmacological"))
#   
#   # TU_CODIGO_AQUI
#   
#   # --- 3. t-test pareado: pre vs. post en grupo pharmacological ----------------
#   trial_pharma_long <- trial_long |> filter(group == "pharmacological")
#   
#   # TU_CODIGO_AQUI
#   
#   # --- 4. d de Cohen para la comparacion pareada --------------------------------
#   # TU_CODIGO_AQUI
#   
#   # --- 5. Reportar el t-test pareado con report() --------------------------------
#   # TU_CODIGO_AQUI
#   
#   # --- Bonus: cambio medio pre -> post por grupo --------------------------------
#   # TU_CODIGO_AQUI
#

# Tu solución aquí:
