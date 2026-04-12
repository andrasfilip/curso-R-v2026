# ============================================================
# EJERCICIOS - DIA 2 (version ESTUDIANTE)
# Curso: Introduccion a programacion y analisis de datos en R
# Efrain Garcia Sanchez & Filip Andras
# CIMCYC - Universidad de Granada
# ============================================================
#
# Como usar este script:
#   1. Lee el enunciado de cada ejercicio (lineas comentadas).
#   2. Escribe tu codigo donde dice "# TU_CODIGO_AQUI".
#   3. Las soluciones se muestran en la presentacion.


# ============================================================
# BLOQUE 1
# ============================================================

# ------------------------------------------------------------
# EJERCICIO 1: Convertir codigo anidado a pipe
# ------------------------------------------------------------
# Tiempo: 5 minutos
#
# Reescribe estos fragmentos usando el pipe `|>`:
#
# 1. round(mean(c(12, 18, 7, 25, 14)), 1)
# 2. sqrt(sum(c(1, 4, 9, 16)))
# 3. length(unique(c("a", "b", "a", "c", "b", "a")))

# Tu solucion aqui:



# ------------------------------------------------------------
# EJERCICIO 2: Crear proyecto y cargar datos
# ------------------------------------------------------------
# Tiempo: 5 minutos
#
# 1. Comprueba tu directorio de trabajo
getwd()

# 2. Carga el tidyverse
library(tidyverse)

# 3. Carga el dataset del ensayo clinico
data_trial <- read_csv("data/raw_data/data_clinical_trial.csv")

# 4. Explora los datos
glimpse(data_trial)
head(data_trial)
table(data_trial$group)

# 5. Carga los datos de clinicas
# (quita los comentarios y sustituye "TU_CODIGO_AQUI" por la ruta correcta)
# sites <- readr::read_csv(# TU_CODIGO_AQUI)
# glimpse(sites)

# 6. Usa View() en la consola para ver los datos visualmente
View(data_trial)
# View(sites)  # <- descomenta cuando hayas cargado sites


# --- CODIGO DE LA PRESENTACION (para referencia) -----

# dplyr::select() --- elegir columnas
datos_seleccionados <- data_trial |>
  select(patient_id, 
                group, 
                sex, 
                anxiety_pre, 
                anxiety_post)
datos_seleccionados

# select() --- eliminar columnas
datos_reducidos <- data_trial |>
  select(-site_id, 
                -wellbeing_pre)
datos_reducidos

# select() --- funciones auxiliares
datos_anxiety <- data_trial |>
  select(patient_id, 
                group, 
                contains("anxiety"))
datos_anxiety

# dplyr::rename() --- renombrar columnas (nuevo = viejo)
datos_renombrados <- data_trial |>
  rename(grupo = group, edad = age) |>
  select(patient_id, 
                grupo, 
                edad, 
                anxiety_pre)
datos_renombrados

# dplyr::relocate() --- reordenar columnas (.after)
datos_reordenados <- data_trial |>
  relocate(anxiety_post, .after = patient_id)
datos_reordenados

# dplyr::relocate() --- argumento .before
datos_reordenados2 <- data_trial |>
  relocate(wellbeing_pre, .before = patient_id)
datos_reordenados2


# ------------------------------------------------------------
# EJERCICIO 3: rename() + relocate()
# ------------------------------------------------------------
# Tiempo: 5 minutos
#
# Encadena estos pasos con |> sobre data_trial:
#
# 1. Renombra rosenberg_pre a self_esteem_pre y rosenberg_post a self_esteem_post
# 2. Renombra ucla_pre a loneliness_pre y ucla_post a loneliness_post
# 3. Mueve n_sessions justo despues de group
# 4. Guarda el resultado en data_trial_renamed

# Tu solucion aqui:



# --- CODIGO DE LA PRESENTACION (para referencia) -----

# dplyr::filter() --- elegir filas
datos_cbt <- data_trial |>
  filter(group == "CBT")
datos_cbt

# filter() --- multiples condiciones (AND)
mujeres_cbt_senior <- data_trial |>
  filter(sex == "female", 
                age > 60, 
                group == "CBT")
mujeres_cbt_senior

# filter() --- condiciones OR
datos_tratamiento <- data_trial |>
  filter(group %in% c("CBT", "pharmacological"))
datos_tratamiento

# combinar select() y filter() con el pipe
cbt_resumen <- data_trial |>
  filter(group == "CBT") |>
  select(patient_id, 
                sex, 
                age, 
                anxiety_pre, 
                anxiety_post)
cbt_resumen


# ------------------------------------------------------------
# EJERCICIO 4: Explorar y filtrar el dataset del ensayo
# ------------------------------------------------------------
# Tiempo: 15 minutos
#
# 1. Usa glimpse() para ver la estructura del dataset
# 2. Cuantos pacientes hay en cada grupo? (usa table())
# 3. Filtra los pacientes del grupo "pharmacological" con anxiety_pre mayor que 10
# 4. Del resultado anterior, selecciona solo patient_id, sex, age, anxiety_pre, anxiety_post
# 5. Cuantas filas tiene el resultado? (usa nrow())

# Tu solucion aqui:



# ============================================================
# BLOQUE 2
# ============================================================

# --- CODIGO DE LA PRESENTACION (para referencia) -----

# arrange() --- ordenar filas (ascendente por defecto)
datos_ordenados <- data_trial |>
  arrange(anxiety_pre) |>
  select(patient_id, 
                group, 
                anxiety_pre)
datos_ordenados

# arrange() --- orden descendente
datos_desc <- data_trial |>
  arrange(desc(anxiety_pre)) |>
  select(patient_id, 
                group, 
                anxiety_pre)
datos_desc


# ------------------------------------------------------------
# EJERCICIO 5: Ordenar pacientes
# ------------------------------------------------------------
# Tiempo: 5 minutos
#
# 1. Ordena data_trial por anxiety_post de mayor a menor
# 2. Muestra solo las columnas patient_id, group, anxiety_post
# 3. Que paciente tiene la puntuacion mas alta?
# 4. Guarda el resultado en un objeto

# Tu solucion aqui:



# --- CODIGO DE LA PRESENTACION (para referencia) -----

# mutate() --- crear nuevas columnas
datos_cambio <- data_trial |>
  mutate(anxiety_change = anxiety_post - anxiety_pre) |>
  select(patient_id, 
                group, 
                anxiety_pre, 
                anxiety_post, 
                anxiety_change)
datos_cambio

# mutate() --- modificar columnas existentes
datos_redondeados <- data_trial |>
  mutate(age_rounded = round(age, -1)) |>  # -1 redondea a decenas
  select(patient_id,
         age,
         age_rounded)
datos_redondeados

# if_else() --- dos categorias
datos_ansiedad <- data_trial |>
  mutate(
    ansiedad_alta = if_else(anxiety_pre >= 15, "grave", "moderada_o_leve")
  ) |>
  select(patient_id,
         anxiety_pre,
         ansiedad_alta)
datos_ansiedad

# case_when() --- multiples categorias (GAD-7)
datos_gravedad <- data_trial |>
  mutate(
    gravedad_ansiedad = case_when(
      anxiety_pre <= 4  ~ "minima",
      anxiety_pre <= 9  ~ "leve",
      anxiety_pre <= 14 ~ "moderada",
      .default          = "grave"
    )
  ) |>
  select(patient_id, anxiety_pre, gravedad_ansiedad)
head(datos_gravedad, 10)

# case_when() --- ejemplo clinico (PHQ-9)
# datos_gravedad_dep <- data_trial |>
#   mutate(
#     gravedad_depresion = case_when(
#       depression_pre <= 4  ~ "minima",
#       depression_pre <= 9  ~ "leve",
#       depression_pre <= 14 ~ "moderada",
#       depression_pre <= 19 ~ "moderadamente_grave",
#       .default             = "grave"
#     )
#   )


# ------------------------------------------------------------
# EJERCICIO 5.5: if_else()
# ------------------------------------------------------------
# Tiempo: 5 minutos
#
# Usa if_else() para crear una nueva columna grupo_edad en data_trial:
#   Si age >= 60 -> "senior"
#   Si no -> "junior"
# Despues, cuenta cuantos pacientes hay en cada categoria con count()

# Tu solucion aqui:



# ------------------------------------------------------------
# EJERCICIO 6: Clasificar gravedad de depresion
# ------------------------------------------------------------
# Tiempo: 7 minutos
#
# Crea una columna gravedad_depresion usando case_when() basada en depression_pre (PHQ-9, 0-27):
#   <= 4  -> "minima"
#   <= 9  -> "leve"
#   <= 14 -> "moderada"
#   <= 19 -> "moderadamente_grave"
#   resto -> "grave"
#
# Guarda el resultado y usa count() para ver cuantos pacientes hay en cada categoria.

# Tu solucion aqui:



# --- CODIGO DE LA PRESENTACION (para referencia) -----

# bind_rows() --- apilar filas
clase_A <- data.frame(
  alumno = c("Ana", "Ben", "Carlos"),
  nota   = c(85, 92, 78)
)
clase_B <- data.frame(
  alumno = c("Diana", "Eva"),
  nota   = c(90, 88)
)
todas_las_notas <- bind_rows(clase_A, clase_B)
todas_las_notas

# bind_cols() --- pegar columnas (cuidado: no comprueba si las filas coinciden!)
nombres <- data.frame(alumno = c("Ana", "Ben", "Carlos"))
notas   <- data.frame(nota = c(85, 92, 78))
datos_pegados <- bind_cols(nombres, notas)
datos_pegados

# left_join() --- unir tablas por una columna comun
datos_con_clinica <- left_join(data_trial, sites, by = "site_id")
datos_con_clinica


# ------------------------------------------------------------
# EJERCICIO 7: Unir, clasificar y comparar
# ------------------------------------------------------------
# Tiempo: 20 minutos
#
# 1. Carga los datos de seguimiento: data_followup <- read_csv("data/raw_data/data_clinical_trial_followup.csv")
# 2. Haz un left_join() de data_trial con data_followup por patient_id
# 3. Clasifica la gravedad de ansiedad en pre, post y followup con case_when()
#    (GAD-7: <= 4 minima, <= 9 leve, <= 14 moderada, resto grave)
# 4. Cuenta el numero de pacientes en cada categoria para cada momento (count())
# 5. Crea columnas de mejora (anxiety_pre - anxiety_post) y mantenimiento (anxiety_post - anxiety_followup)
# 6. Guarda el resultado en datos_clasificados

# Tu solucion aqui:



# ============================================================
# BLOQUE 3
# ============================================================

# --- CODIGO DE LA PRESENTACION (para referencia) -----

# summarise() --- calcular estadisticos
resumen_global <- data_trial |>
  filter(group != "control") |>
  summarise(
    media_ansiedad = mean(anxiety_pre, na.rm = TRUE),
    dt_ansiedad    = sd(anxiety_pre, na.rm = TRUE),
    n              = n()
  )
resumen_global

# group_by() + summarise() --- agrupar antes de resumir
resumen_por_grupo <- data_trial |>
  filter(group != "control") |>
  group_by(group) |>
  summarise(
    media_ansiedad = mean(anxiety_pre, na.rm = TRUE),
    sd_ansiedad    = sd(anxiety_pre, na.rm = TRUE),
    n              = n()
  )
resumen_por_grupo

# multiples variables de agrupacion
resumen_grupo_sexo <- data_trial |>
  filter(group != "control") |>
  group_by(group, sex) |>
  summarise(
    media_ansiedad = mean(anxiety_pre, na.rm = TRUE),
    .groups = "drop"
  )
resumen_grupo_sexo

# count() --- atajo para group_by + summarise(n = n())
conteo <- data_trial |>
  count(group, sex)
conteo

# pipeline completo
resultado_pipeline <- data_trial |>
  filter(group != "control", !is.na(anxiety_post)) |>
  mutate(anxiety_change = anxiety_post - anxiety_pre) |>
  group_by(group, sex) |>
  summarise(
    mejora_media = round(mean(anxiety_change), 1),
    .groups      = "drop"
  ) |>
  arrange(mejora_media)
resultado_pipeline

# write_csv() --- exportar a CSV
# trial_clean <- data_trial |>
#   filter(!is.na(anxiety_post)) |>
#   mutate(anxiety_change = anxiety_post - anxiety_pre)
# write_csv(trial_clean, "data/processed_data/trial_clean.csv")


# ------------------------------------------------------------
# EJERCICIO 8: Depresion pre y post por grupo y sexo
# ------------------------------------------------------------
# Tiempo: 5 minutos
#
# Usando data_trial, calcula por grupo de tratamiento Y sexo:
# 1. La media de depression_pre
# 2. La media de depression_post
# 3. La desviacion tipica de ambas
# 4. El numero de pacientes (n())
# 5. Ordena el resultado de mayor a menor media de depression_pre
# 6. Que combinacion grupo + sexo muestra mayor cambio pre -> post?

# Tu solucion aqui:



# ------------------------------------------------------------
# EJERCICIO 9: Pipeline completo + exportar
# ------------------------------------------------------------
# Tiempo: 30 minutos
#
# Pregunta: Cual es la mejora media en ansiedad por tipo de
# tratamiento y ciudad en Andalucia?
#
# Construye un pipeline completo que:
# 1. Filtre data_trial excluyendo group == "control"
# 2. Haga un left_join() con sites por site_id
# 3. Cree la variable mejora = anxiety_pre - anxiety_post
# 4. Agrupe por group y city
# 5. Calcule: media de mejora, DT y n
# 6. Ordene por mejora media de mayor a menor
# 7. Guarda el resultado en data_trial_preprocessed
# 8. Exporta el resultado a CSV en data/processed_data/
# 9. Bonus: que combinacion tratamiento + ciudad muestra mayor mejora?

# Plantilla:
# data_trial_preprocessed <- data_trial |>
#   filter(# TU_CODIGO_AQUI) |>
#   left_join(# TU_CODIGO_AQUI) |>
#   mutate(mejora = anxiety_pre - anxiety_post) |>
#   group_by(# TU_CODIGO_AQUI) |>
#   summarise(
#     # TU_CODIGO_AQUI
#     .groups = "drop"
#   ) |>
#   arrange(# TU_CODIGO_AQUI)
#
# data_trial_preprocessed
#
# # exportar a CSV
# write_csv(data_trial_preprocessed, "data/processed_data/resumen_mejora_por_grupo.csv")

# Tu solucion aqui:



# ------------------------------------------------------------
# EJERCICIO 10: Desafio extra (si te sobra tiempo)
# ------------------------------------------------------------
#
# 1. Que grupo tiene la media mas alta de numero de sesiones?
#    Pista: filter(!is.na(n_sessions)), group_by(group), summarise(media = mean(n_sessions))
#
# 2. Comparar bienestar (wellbeing_pre) por sexo
#    Pista: group_by(sex), summarise(media_bienestar = mean(wellbeing_pre))
#
# 3. Crear tabla resumen por grupo con n, media anxiety_pre, media anxiety_post y mejora media

# Tu solucion aqui:

