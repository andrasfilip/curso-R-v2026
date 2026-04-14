# ============================================================
# PIPELINE DE PREPROCESAMIENTO — DIA 3
# Curso: Introduccion a programacion y analisis de datos en R
# Efrain Garcia Sanchez & Filip Andras
# CIMCYC - Universidad de Granada
# ============================================================
#
# Ejecuta este script si no completaste el ejercicio 2 del
# bloque 1 y necesitas los datos preprocesados para continuar.

library(tidyverse)

# cargar datos
data_trial    <- read_csv("data/raw_data/data_clinical_trial.csv")
data_followup <- read_csv("data/raw_data/data_clinical_trial_followup.csv")
sites         <- read_csv("data/raw_data/data_sites.csv")

# preprocesar
datos_preprocesados <- data_trial |>
  left_join(data_followup, by = "patient_id") |>
  left_join(sites, by = "site_id") |>
  rename(
    self_esteem_pre      = rosenberg_pre,
    self_esteem_post     = rosenberg_post,
    self_esteem_followup = rosenberg_followup,
    loneliness_pre       = ucla_pre,
    loneliness_post      = ucla_post,
    loneliness_followup  = ucla_followup
  ) |>
  relocate(anxiety_followup, .after = anxiety_post) |>
  relocate(depression_followup, .after = depression_post) |>
  relocate(wellbeing_followup, .after = wellbeing_post) |>
  relocate(loneliness_followup, .after = loneliness_post) |>
  relocate(self_esteem_followup, .after = self_esteem_post) |>
  mutate(
    mejora          = anxiety_pre - anxiety_post,
    mejora_followup = anxiety_pre - anxiety_followup,
    cambio = if_else(mejora > 0, "mejora", "empeora"),
    gravedad_post = case_when(
      anxiety_post <= 4  ~ "minima",
      anxiety_post <= 9  ~ "leve",
      anxiety_post <= 14 ~ "moderada",
      .default           = "grave"
    )
  )

# guardar
write_csv(datos_preprocesados, "data/processed_data/preprocessed_data.csv")

cat("Datos preprocesados guardados en data/processed_data/preprocessed_data.csv\n")
cat("Filas:", nrow(datos_preprocesados), "| Columnas:", ncol(datos_preprocesados), "\n")
