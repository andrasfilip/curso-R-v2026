# ============================================================
# EJERCICIOS - DIA 4 (versión ESTUDIANTE)
# Curso: Introducción a programación y análisis de datos en R
# Efraín García Sánchez & Filip Andras
# CIMCYC - Universidad de Granada
# ============================================================
#
# Cómo usar este script:
#   1. Lee el enunciado de cada ejercicio (líneas comentadas).
#   2. Escribe tu código donde dice "# TU_CODIGO_AQUI".
#   3. Las soluciones se resolverán en clase y se publicarán después.


# ============================================================
# 1. INSTALAR PAQUETES (solo la primera vez, luego comentar)
# ============================================================
# Descomentar las líneas siguientes si es la primera vez que usas estos paquetes
# install.packages("tidyverse")    # manipulación de datos + ggplot2
# install.packages("afex")         # aov_ez() para ANOVA mixto y RM
# install.packages("emmeans")      # comparaciones post-hoc
# install.packages("effectsize")   # tamaño del efecto (eta cuadrado, Cohen's d)
# install.packages("car")          # leveneTest() para homogeneidad de varianzas
# install.packages("easystats")    # report() genera texto APA automáticamente
# install.packages("psych")        # describe() para descriptivos completos


# ============================================================
# 2. CARGAR LIBRERÍAS
# ============================================================
library(tidyverse)    # dplyr, tidyr, readr, ggplot2, stringr, etc.
library(afex)         # ANOVA robusto (aov_ez) con corrección GG automática
library(emmeans)      # comparaciones por pares después del ANOVA
library(effectsize)   # eta_squared(), cohens_d()
library(car)          # leveneTest() — homogeneidad de varianzas
library(easystats)    # incluye report(), performance, parameters
library(psych)        # describe() — descriptivos completos

# opciones globales
options(scipen = 999) # evitar notación científica


# ============================================================
# 3. CARGAR LOS DATOS PREPROCESADOS
# ============================================================
# Partimos del dataset que preparamos ayer (Día 3, Bloque 1).
# Ya tiene: los datos del ensayo + los datos de seguimiento unidos,
# columnas renombradas, y las variables derivadas (mejora, cambio, gravedad_post).

data_processed <- read_csv("data/processed_data/preprocessed_data.csv")

# echar un vistazo rápido
glimpse(data_processed)


# ============================================================
# BLOQUE 1 — Introducción conceptual al ANOVA
# ============================================================
# Este bloque es teórico: trabajamos con el documento anova_by_hand.html
# No hay ejercicios de código en el script.


# ============================================================
# BLOQUE 2 — ANOVA de una vía: ejercicio guiado
# (Day4_bloque2, slides 6-17)
# ============================================================
# Pregunta: ¿Existen diferencias en ansiedad BASAL (pre)
# entre los tres grupos de tratamiento?
# (Esperamos que NO — la aleatorización debería haber nivelado los grupos)
# ============================================================

# --- Paso 1: Explorar datos ---
# TU_CODIGO_AQUI: usa glimpse(), head() o count(group) para ver la estructura



# --- Paso 2: Descriptivos por grupo ---
# Calcula la media, desviación típica y n de anxiety_pre por grupo
# TU_CODIGO_AQUI



# --- Paso 3: Visualizar los datos ---
# Crea un boxplot de anxiety_pre por grupo
# TU_CODIGO_AQUI



# --- Paso 4: Escribir las hipótesis ---
# H0: mu_CBT = mu_pharm = mu_control
# H1: al menos un grupo difiere
# Expectativa: NO rechazamos H0 (datos basales, aleatorización)


# --- Paso 5: Ejecutar el ANOVA ---
# Usa aov() para ajustar el modelo: anxiety_pre ~ group
# TU_CODIGO_AQUI



# --- Paso 6: Interpretar ---
# Mira el F, los grados de libertad y el p-valor
# ¿Rechazamos H0?


# --- Paso 7a: Post-hoc ---
# Usa emmeans() para comparaciones por pares (corrección de Holm)
# TU_CODIGO_AQUI



# --- Paso 7b: Tamaño del efecto ---
# Usa eta_squared() para el tamaño del efecto
# TU_CODIGO_AQUI



# --- Paso 8a: Normalidad de residuos ---
# Histograma de los residuos + QQ plot + Shapiro-Wilk sobre los residuos
# TU_CODIGO_AQUI



# --- Paso 8b: Homogeneidad de varianzas ---
# Test de Levene: leveneTest(anxiety_pre ~ group, data = data_processed)
# TU_CODIGO_AQUI



# --- Reportar resultados ---
# Usa report() para generar un resumen APA
# TU_CODIGO_AQUI



# --- Ejercicio BONUS — anxiety_post (Day4_bloque2, slide ~19) ---
# Repite el mismo flujo, pero ahora con anxiety_post en vez de anxiety_pre.
# Aqui SÍ esperamos diferencias (efecto del tratamiento).
# TU_CODIGO_AQUI




# ============================================================
# BLOQUE 3 — ANOVA de medidas repetidas y mixto
# (Day4_bloque3)
# ============================================================

# --- Preparar los datos: pivotar a formato largo ---
# data_processed ya incluye las columnas _followup.
# Necesitamos: una fila por medición (paciente × timepoint).
#
# Selecciona patient_id, group, anxiety_pre, anxiety_post, anxiety_followup.
# Usa pivot_longer() con names_prefix = "anxiety_".
# No olvides ordenar el factor:
#   factor(timepoint, levels = c("pre", "post", "followup"))
# TU_CODIGO_AQUI



# --- Ejercicio 1 — RM ANOVA por grupo (Day4_bloque3, slide ~11) ---

# --- Grupo farmacológico ---
# 1. Filtrar los datos
# TU_CODIGO_AQUI

# 2. Descriptivos por timepoint (media, dt, n)
# TU_CODIGO_AQUI

# 3. Boxplot
# TU_CODIGO_AQUI

# 4. RM ANOVA con afex::aov_ez()
# TU_CODIGO_AQUI

# 5. Post-hoc con emmeans y corrección de Holm
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

# 5. Post-hoc con emmeans y corrección de Holm
# TU_CODIGO_AQUI


# --- ANOVA mixto (Day4_bloque3, slide ~20) ---
# Ajusta un ANOVA mixto con afex::aov_ez():
#   id = "patient_id", dv = "anxiety"
#   within = "timepoint", between = "group"
# TU_CODIGO_AQUI



# Gráfico de interacción con emmip()
# TU_CODIGO_AQUI



# Efectos simples: efecto del tiempo DENTRO de cada grupo
# Usa emmeans() con specs = ~ timepoint | group y luego pairs()
# TU_CODIGO_AQUI



# Comparar los tres grupos EN CADA timepoint
# Usa emmeans() con specs = ~ group | timepoint y luego pairs()
# TU_CODIGO_AQUI



# --- Ejercicio 2 — ANOVA mixto con depresión (Day4_bloque3, slide ~28) ---
# Repite el análisis para la variable depression.
# 1. Pivotar las columnas de depresión (depression_pre, depression_post, depression_followup)
# TU_CODIGO_AQUI

# 2. ANOVA mixto
# TU_CODIGO_AQUI

# 3. Gráfico de interacción con emmip()
# TU_CODIGO_AQUI

# 4. Efectos simples
# TU_CODIGO_AQUI



# ============================================================
# SESSION INFO
# ============================================================
# Siempre útil al final — registra versiones de R y paquetes
# para que el análisis sea reproducible en el futuro
sessionInfo()
