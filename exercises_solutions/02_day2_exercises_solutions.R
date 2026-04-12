# ============================================================
# EJERCICIOS - DIA 2 (version SOLUCION)
# Curso: Introduccion a programacion y analisis de datos en R
# Efrain Garcia Sanchez & Filip Andras
# CIMCYC - Universidad de Granada
# ============================================================

library(tidyverse)


# ============================================================
# BLOQUE 1
# ============================================================

# ------------------------------------------------------------
# EJERCICIO 1: Convertir codigo anidado a pipe
# ------------------------------------------------------------

# 1.
c(12, 18, 7, 25, 14) |>
  mean() |>
  round(1)

# 2.
c(1, 4, 9, 16) |>
  sum() |>
  sqrt()

# 3.
c("a", "b", "a", "c", "b", "a") |>
  unique() |>
  length()


# ------------------------------------------------------------
# EJERCICIO 2: Crear proyecto y cargar datos
# ------------------------------------------------------------

getwd()
data_trial <- read_csv("data/raw_data/data_clinical_trial.csv")
glimpse(data_trial)
head(data_trial)
table(data_trial$group)

# cargar datos de clinicas
sites <- read_csv("data/raw_data/data_sites.csv")
glimpse(sites)

View(data_trial)
View(sites)


# ------------------------------------------------------------
# EJERCICIO 3: rename() + relocate()
# ------------------------------------------------------------

data_trial_renamed <- data_trial |>
  rename(
    self_esteem_pre  = rosenberg_pre,
    self_esteem_post = rosenberg_post,
    loneliness_pre   = ucla_pre,
    loneliness_post  = ucla_post
  ) |>
  relocate(n_sessions, .after = group)
data_trial_renamed


# ------------------------------------------------------------
# EJERCICIO 4: Explorar y filtrar el dataset del ensayo
# ------------------------------------------------------------

# 1. explorar los datos
glimpse(data_trial)

# 2. pacientes por grupo
table(data_trial$group)

# 3-5. filtrar, seleccionar y guardar
pharm_anxiety_alta <- data_trial |>
  filter(group == "pharmacological", anxiety_pre > 10) |>
  select(patient_id,
         sex,
         age,
         anxiety_pre,
         anxiety_post)
pharm_anxiety_alta

# 6. cuantas filas?
nrow(pharm_anxiety_alta)


# ============================================================
# BLOQUE 2
# ============================================================

# ------------------------------------------------------------
# EJERCICIO 5: Ordenar pacientes
# ------------------------------------------------------------

pacientes_ordenados <- data_trial |>
  arrange(desc(anxiety_post)) |>
  select(patient_id,
         group,
         anxiety_post)
pacientes_ordenados
# el primer paciente tiene la puntuacion mas alta


# ------------------------------------------------------------
# EJERCICIO 5.5: if_else()
# ------------------------------------------------------------

datos_grupo_edad <- data_trial |>
  mutate(grupo_edad = if_else(age >= 60, "senior", "junior"))
datos_grupo_edad |> count(grupo_edad)


# ------------------------------------------------------------
# EJERCICIO 6: Clasificar gravedad de depresion
# ------------------------------------------------------------

datos_gravedad_dep <- data_trial |>
  mutate(
    gravedad_depresion = case_when(
      depression_pre <= 4  ~ "minima",
      depression_pre <= 9  ~ "leve",
      depression_pre <= 14 ~ "moderada",
      depression_pre <= 19 ~ "moderadamente_grave",
      .default             = "grave"
    )
  )
datos_gravedad_dep |> count(gravedad_depresion)


# ------------------------------------------------------------
# EJERCICIO 7: Unir, clasificar y comparar
# ------------------------------------------------------------

data_followup <- read_csv("data/raw_data/data_clinical_trial_followup.csv")

datos_clasificados <- data_trial |>
  left_join(data_followup, by = "patient_id") |>
  mutate(
    gravedad_pre = case_when(
      anxiety_pre <= 4  ~ "minima",
      anxiety_pre <= 9  ~ "leve",
      anxiety_pre <= 14 ~ "moderada",
      .default          = "grave"
    ),
    gravedad_post = case_when(
      anxiety_post <= 4  ~ "minima",
      anxiety_post <= 9  ~ "leve",
      anxiety_post <= 14 ~ "moderada",
      .default           = "grave"
    ),
    gravedad_followup = case_when(
      anxiety_followup <= 4  ~ "minima",
      anxiety_followup <= 9  ~ "leve",
      anxiety_followup <= 14 ~ "moderada",
      .default               = "grave"
    ),
    mejora        = anxiety_pre - anxiety_post,
    mantenimiento = anxiety_post - anxiety_followup
  )
datos_clasificados

# contar pacientes por gravedad en cada momento
datos_clasificados |> count(gravedad_pre)
datos_clasificados |> count(gravedad_post)
datos_clasificados |> count(gravedad_followup)

# mejora y mantenimiento por grupo
datos_clasificados |>
  group_by(group) |>
  summarise(
    media_mejora        = mean(mejora, na.rm = TRUE),
    media_mantenimiento = mean(mantenimiento, na.rm = TRUE),
    .groups = "drop"
  )


# ============================================================
# BLOQUE 3
# ============================================================

# ------------------------------------------------------------
# EJERCICIO 8: Depresion pre y post por grupo y sexo
# ------------------------------------------------------------

resumen_depresion <- data_trial |>
  group_by(group, sex) |>
  summarise(
    media_pre  = mean(depression_pre, na.rm = TRUE),
    media_post = mean(depression_post, na.rm = TRUE),
    dt_pre     = sd(depression_pre, na.rm = TRUE),
    dt_post    = sd(depression_post, na.rm = TRUE),
    n          = n(),
    .groups    = "drop"
  ) |>
  arrange(desc(media_pre))
resumen_depresion
# la combinacion con mayor cambio se ve comparando media_pre vs media_post


# ------------------------------------------------------------
# EJERCICIO 9: Pipeline completo + exportar
# ------------------------------------------------------------

data_trial_preprocessed <- data_trial |>
  filter(group != "control") |>
  left_join(sites, by = "site_id") |>
  mutate(mejora = anxiety_pre - anxiety_post) |>
  group_by(group, city) |>
  summarise(
    mejora_media = round(mean(mejora, na.rm = TRUE), 1),
    sd_mejora    = round(sd(mejora, na.rm = TRUE), 1),
    n            = n(),
    .groups      = "drop"
  ) |>
  arrange(desc(mejora_media))
data_trial_preprocessed

# exportar a CSV
write_csv(data_trial_preprocessed, "data/processed_data/resumen_mejora_por_grupo.csv")


# ------------------------------------------------------------
# EJERCICIO 10: Desafio extra
# ------------------------------------------------------------

# 1. sesiones medias por grupo
sesiones_por_grupo <- data_trial |>
  filter(!is.na(n_sessions)) |>
  group_by(group) |>
  summarise(media_sesiones = mean(n_sessions))
sesiones_por_grupo

# 2. bienestar medio por sexo
bienestar_por_sexo <- data_trial |>
  group_by(sex) |>
  summarise(media_bienestar = mean(wellbeing_pre, na.rm = TRUE))
bienestar_por_sexo

# 3. tabla resumen por grupo
tabla_resumen <- data_trial |>
  group_by(group) |>
  summarise(
    n            = n(),
    media_pre    = mean(anxiety_pre, na.rm = TRUE),
    media_post   = mean(anxiety_post, na.rm = TRUE),
    mejora_media = media_pre - media_post
  )
tabla_resumen
