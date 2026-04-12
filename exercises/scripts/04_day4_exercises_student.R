# ============================================================
# EJERCICIOS - DIA 4 (version ESTUDIANTE)
# Curso: Introduccion a programacion y analisis de datos en R
# Efrain Garcia Sanchez & Filip Andras
# CIMCYC - Universidad de Granada
# ============================================================
#
# Como usar este script:
#   1. Lee el enunciado de cada ejercicio (lineas comentadas).
#   2. Escribe tu codigo donde dice "# TU_CODIGO_AQUI".
#   3. Las soluciones se muestran en la presentacion.

# --- Librerias necesarias ---
library(tidyverse)
library(afex)
library(emmeans)
library(effectsize)
library(car)
library(report)
options(scipen = 999, width = 120)


# ============================================================
# BLOQUE 1 — Introduccion conceptual al ANOVA
# ============================================================
# Este bloque se trabaja con el documento anova_by_hand.html
# No hay ejercicios de codigo en el script.


# ============================================================
# BLOQUE 2 — ANOVA de una via: ejercicio guiado
# ============================================================
# Pregunta: ?Existen diferencias en ansiedad BASAL (pre)
# entre los tres grupos de tratamiento?
# (Esperamos que NO — la aleatorizacion lo garantiza)
# ============================================================

# --- Paso 1: Cargar datos ---
data_trial <- read_csv("data/data_clinical_trial.csv")
# TU_CODIGO_AQUI: explora los datos con glimpse() o head()



# --- Paso 2: Descriptivos por grupo ---
# Calcula la media, desviacion tipica y n de anxiety_pre por grupo
# TU_CODIGO_AQUI



# --- Paso 3: Visualizar los datos ---
# Crea un boxplot de anxiety_pre por grupo
# TU_CODIGO_AQUI



# --- Paso 4: Escribir las hipotesis ---
# H0: mu_CBT = mu_pharm = mu_control
# H1: al menos un grupo difiere
# Esperamos NO rechazar H0 (datos basales, aleatorizacion)

# --- Paso 5: Ejecutar el ANOVA ---
# Usa aov() para ajustar el modelo: anxiety_pre ~ group
# TU_CODIGO_AQUI



# --- Paso 6: Interpretar ---
# Mira el F, los grados de libertad y el p-valor
# ?Rechazamos H0?

# --- Paso 7a: Post-hoc ---
# Usa emmeans() para comparaciones por pares (correccion de Holm)
# TU_CODIGO_AQUI



# --- Paso 7b: Tamano del efecto ---
# Usa eta_squared() para el tamano del efecto
# TU_CODIGO_AQUI



# --- Paso 8a: Normalidad de residuos ---
# Histograma de los residuos
# QQ plot de los residuos
# Shapiro-Wilk sobre los residuos
# TU_CODIGO_AQUI



# --- Paso 8b: Homogeneidad de varianzas ---
# Test de Levene
# TU_CODIGO_AQUI



# --- Reportar resultados ---
# Usa report() para generar un resumen APA
# TU_CODIGO_AQUI



# --- BONUS: Repite con anxiety_post ---
# Ahora SI esperamos diferencias (efecto del tratamiento)
# TU_CODIGO_AQUI




# ============================================================
# BLOQUE 3 — ANOVA de medidas repetidas y mixto
# ============================================================

# --- Preparar los datos ---
# 1. Cargar datos de seguimiento (follow-up a 3 meses)
data_followup <- read_csv("data/data_clinical_trial_followup.csv")

# 2. Unir con left_join() por patient_id
# TU_CODIGO_AQUI



# 3. Pivotar a formato largo con 3 timepoints (pre, post, followup)
# Selecciona patient_id, group, anxiety_pre, anxiety_post, anxiety_followup
# Usa pivot_longer() con names_prefix = "anxiety_"
# No olvides ordenar el factor: factor(timepoint, levels = c("pre", "post", "followup"))
# TU_CODIGO_AQUI



# --- Ejercicio A: RM ANOVA por grupo ---

# --- Grupo farmacologico ---
# 1. Filtrar los datos
# TU_CODIGO_AQUI

# 2. Descriptivos por timepoint (media, dt, n)
# TU_CODIGO_AQUI

# 3. Boxplot
# TU_CODIGO_AQUI

# 4. RM ANOVA con afex::aov_ez()
# TU_CODIGO_AQUI

# 5. Post-hoc con emmeans y correccion de Holm
# TU_CODIGO_AQUI


# --- Grupo control ---
# 1. Filtrar los datos
# TU_CODIGO_AQUI

# 2. Descriptivos por timepoint
# TU_CODIGO_AQUI

# 3. Boxplot
# TU_CODIGO_AQUI

# 4. RM ANOVA con afex::aov_ez()
# TU_CODIGO_AQUI

# 5. Post-hoc con emmeans y correccion de Holm
# TU_CODIGO_AQUI


# --- Ejercicio B: ANOVA mixto ---
# Ajusta un ANOVA mixto con afex::aov_ez():
#   id = "patient_id", dv = "anxiety"
#   within = "timepoint", between = "group"
# TU_CODIGO_AQUI



# Grafico de interaccion con emmip()
# TU_CODIGO_AQUI



# Efectos simples: efecto del tiempo DENTRO de cada grupo
# Usa emmeans() con ~ timepoint | group y luego pairs()
# TU_CODIGO_AQUI



# Comparar los tres grupos EN CADA timepoint
# Usa emmeans() con ~ group | timepoint y luego pairs()
# TU_CODIGO_AQUI



# --- Ejercicio C: Repite con depression ---
# 1. Pivotar las columnas de depresion (depression_pre, depression_post, depression_followup)
# TU_CODIGO_AQUI

# 2. ANOVA mixto
# TU_CODIGO_AQUI

# 3. Grafico de interaccion con emmip()
# TU_CODIGO_AQUI

# 4. Efectos simples
# TU_CODIGO_AQUI
