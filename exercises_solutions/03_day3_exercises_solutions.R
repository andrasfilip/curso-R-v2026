# ============================================================
# EJERCICIOS - DIA 3 (versión con SOLUCIONES)
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


# ---- SOLUCION de referencia ----
datos_ancho <- tibble::tibble(
  paciente = 1:3,
  dia_1    = c(10, 8, 12),
  dia_2    = c(7, 6, 9),
  dia_3    = c(5, 4, 7)
)

# 1. pivot a formato largo
datos_largo <- datos_ancho |>
  pivot_longer(
    cols      = c(dia_1, dia_2, dia_3),
    names_to  = "dia",
    values_to = "puntuacion"
  )
datos_largo

# 2. número de filas
nrow(datos_largo)


# ------------------------------------------------------------
# EJERCICIO: Reestructurar datos de pacientes
# ------------------------------------------------------------
# Tiempo: 15 minutos
#
#
# 1. Toma `trial` y filtra para el grupo **"CBT"**
# 2. Selecciona `patient_id`, `group`, `anxiety_pre`, `anxiety_post`
# 3. Usa `pivot_longer()` para convertir `anxiety_pre` y `anxiety_post` en formato largo (columnas: `momento` y `anxiety`)
# 4. ¿Cuántas filas tiene el resultado?
# 5. *Bonus*: Calcula la media de `anxiety` por `group` y `momento` usando `group_by()` + `summarise()`
#
# Plantilla (copiala y completa los huecos):
#
#   # 1-2. filtrar y seleccionar
#   trial_long <- trial |>
#     filter(# TU CÓDIGO AQUÍ) |>
#     select(patient_id, group, anxiety_pre, anxiety_post)
#   
#   # 3. convertir a formato largo
#   trial_long |>
#     pivot_longer(
#       cols      = # TU CÓDIGO AQUÍ,
#       names_to  = "momento",
#       values_to = "anxiety"
#     )
#

# Tu solución aquí:


# ---- SOLUCION de referencia ----
# 1-3. filtrar, seleccionar y pivotar
trial_long <- trial |>
  filter(group == "CBT") |>
  select(patient_id, group, anxiety_pre, anxiety_post) |>
  pivot_longer(
    cols      = c(anxiety_pre, anxiety_post),
    names_to  = "momento",
    values_to = "anxiety"
  )

trial_long

# 4. cuantas filas?
nrow(trial_long)

# 5. bonus: media por group y momento
trial_long |>
  group_by(group, momento) |>
  summarise(media_anxiety = round(mean(anxiety), 2), .groups = "drop")


# ============================================================
# BLOQUE 2
# ============================================================

# ------------------------------------------------------------
# EJERCICIO: Mini-ejercicio — mediana y cuartiles
# ------------------------------------------------------------
# Tiempo: 5 minutos
#
#
# Usando `trial`, calcula para la variable `anxiety_pre`:
#
# 1. La **mediana** con `median()`
# 2. Los cuartiles Q1 y Q3 con `quantile()` (probabilidades 0.25 y 0.75)
# 3. El **rango intercuartílico** (IQR) usando `IQR()`
# 4. Compara con la **media** y la **desviación típica**

# Tu solución aquí:


# ---- SOLUCION de referencia ----
# 1. mediana
median(trial$anxiety_pre)

# 2. Q1 y Q3
quantile(trial$anxiety_pre, probs = c(0.25, 0.75))

# 3. rango intercuartílico
IQR(trial$anxiety_pre)

# 4. comparar con media y DT
mean(trial$anxiety_pre)
sd(trial$anxiety_pre)


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
#   trial |>
#     group_by(# TU CÓDIGO AQUÍ) |>
#     summarise(
#       media = # TU CÓDIGO AQUÍ,
#       dt    = # TU CÓDIGO AQUÍ
#     )
#   
#   # 2. normalidad en grupo farmacologico
#   grupo_farm <- trial |> filter(# TU CÓDIGO AQUÍ)
#   shapiro.test(# TU CÓDIGO AQUÍ)
#   
#   # 3. correlación ansiedad post y edad
#   cor.test(# TU CÓDIGO AQUÍ, # TU CÓDIGO AQUÍ)
#   
#   # 4. correlación ansiedad pre y post
#   cor.test(# TU CÓDIGO AQUÍ, # TU CÓDIGO AQUÍ)
#

# Tu solución aquí:


# ---- SOLUCION de referencia ----
# 1. descriptivos por sexo
trial |>
  group_by(sex) |>
  summarise(
    media = round(mean(anxiety_post), 2),
    dt    = round(sd(anxiety_post), 2)
  )

# 2. normalidad en grupo farmacologico
grupo_farm <- trial |> filter(group == "pharmacological")
shapiro.test(grupo_farm$anxiety_post)

# 3. correlación ansiedad post y edad
cor.test(trial$anxiety_post, trial$age)

# 4. correlación ansiedad pre y post
# esperamos una correlación positiva fuerte:
# quienes tenían más ansiedad antes tienden a tener más después
cor.test(trial$anxiety_pre, trial$anxiety_post)


# ============================================================
# BLOQUE 3
# ============================================================

# ------------------------------------------------------------
# EJERCICIO: Mini-ejercicio — CBT vs pharmacological
# ------------------------------------------------------------
# Tiempo: 5 minutos
#
#
# En el dataset `trial`:
#
# 1. Filtra solo los grupos `"CBT"` y `"pharmacological"` (guárdalo en `trial_cbt_pharma`)
# 2. Ejecuta un t-test independiente comparando `anxiety_post` entre ambos grupos
# 3. Genera el resumen APA con `report()`

# Tu solución aquí:


# ---- SOLUCION de referencia ----
# 1. filtrar
trial_cbt_pharma <- trial |>
  filter(group %in% c("CBT", "pharmacological"))

# 2. t-test de Welch
t.test(anxiety_post ~ group, data = trial_cbt_pharma)

# 3. resumen APA
report(t.test(anxiety_post ~ group, data = trial_cbt_pharma))


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
#   # TU CÓDIGO AQUÍ
#   
#   # --- 2. t-test independiente: CBT vs. pharmacological ------------------------
#   trial_pharma_cbt <- trial |>
#     filter(group %in% c("CBT", "pharmacological"))
#   
#   # TU CÓDIGO AQUÍ
#   
#   # --- 3. t-test pareado: pre vs. post en grupo pharmacological ----------------
#   trial_pharma_long <- trial_long |> filter(group == "pharmacological")
#   
#   # TU CÓDIGO AQUÍ
#   
#   # --- 4. d de Cohen para la comparacion pareada --------------------------------
#   # TU CÓDIGO AQUÍ
#   
#   # --- 5. Reportar el t-test pareado con report() --------------------------------
#   # TU CÓDIGO AQUÍ
#   
#   # --- Bonus: cambio medio pre -> post por grupo --------------------------------
#   # TU CÓDIGO AQUÍ
#

# Tu solución aquí:


# ---- SOLUCION de referencia ----
# --- 1. t-test de una muestra (mu = 12) --------------------------------------
t.test(trial$anxiety_post, mu = 12)

# --- 2. t-test independiente: CBT vs. pharmacological ------------------------
trial_pharma_cbt <- trial |>
  filter(group %in% c("CBT", "pharmacological"))

t.test(anxiety_post ~ group, data = trial_pharma_cbt)

# --- 3. t-test pareado: pre vs. post en grupo pharmacological ----------------
trial_pharma_long <- trial_long |> filter(group == "pharmacological")

t.test(anxiety ~ timepoint, data = trial_pharma_long, paired = TRUE)

# --- 4. d de Cohen para la comparacion pareada --------------------------------
effectsize::cohens_d(anxiety ~ timepoint, data = trial_pharma_long, paired = TRUE)

# --- 5. Reportar con report()
report(t.test(anxiety ~ timepoint, data = trial_pharma_long, paired = TRUE))

# --- Bonus: cambio medio pre -> post por grupo --------------------------------
trial_long |>
  group_by(group, timepoint) |>
  summarise(media = mean(anxiety), .groups = "drop") |>
  pivot_wider(names_from = timepoint, values_from = media) |>
  mutate(cambio = post - pre) |>
  arrange(cambio)
