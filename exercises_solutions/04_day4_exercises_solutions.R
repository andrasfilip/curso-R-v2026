# ============================================================
# EJERCICIOS - DIA 4 (versión con SOLUCIONES)
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
# EJERCICIO: Mini-ejercicio — tu primer ANOVA
# ------------------------------------------------------------
# Tiempo: 5 minutos
#
#
# Usando el dataset `clin_trial`:
#
# 1. Ajusta un modelo ANOVA: `mood.gain ~ drug`
# 2. Muestra el resumen con `summary()`
# 3. ¿Cuál es el valor de F? ¿Es significativo el efecto del fármaco?

# Tu solución aquí:


# ---- SOLUCION de referencia ----
# 1. ajustar modelo
modelo <- aov(mood.gain ~ drug, data = clin_trial)

# 2. ver resumen
summary(modelo)

# 3. interpretar el F y el p-valor
# si p < 0.05, al menos un grupo difiere del resto


# ------------------------------------------------------------
# EJERCICIO: ANOVA con el dataset de fármacos
# ------------------------------------------------------------
# Tiempo: 20 minutos
#
#
# 1. Calcula descriptivos (media, DT) de `mood.gain` por `drug`
# 2. Ejecuta un One-way ANOVA: `mood.gain ~ drug`. ¿Es significativo?
# 3. Ejecuta tests post-hoc con `TukeyHSD()`. ¿Qué pares de grupos difieren?
# 4. Calcula el eta² con `anova_test()`. ¿Es un efecto grande, mediano o pequeño?
# 5. *Bonus*: Repite el ANOVA pero ahora con `therapy` como factor. ¿Es significativo?
#
# Plantilla (copiala y completa los huecos):
#
#   # --- 1. Descriptivos por farmaco ----------------------------------------------
#   clin_trial |>
#     group_by(drug) |>
#     summarise(
#       # TU CÓDIGO AQUÍ
#     )
#   
#   # --- 2. ANOVA de una via: mood.gain ~ drug ------------------------------------
#   modelo_anova <- aov(# TU CÓDIGO AQUÍ)
#   summary(# TU CÓDIGO AQUÍ)
#   
#   # --- 3. Tests post-hoc con TukeyHSD ------------------------------------------
#   TukeyHSD(# TU CÓDIGO AQUÍ)
#   
#   # --- 4. Eta cuadrado ----------------------------------------------------------
#   clin_trial |>
#     anova_test(# TU CÓDIGO AQUÍ)
#   
#   # --- Bonus: ANOVA con therapy como factor ------------------------------------
#   # TU CÓDIGO AQUÍ
#

# Tu solución aquí:


# ---- SOLUCION de referencia ----
# --- 1. Descriptivos por farmaco ----------------------------------------------
clin_trial |>
  group_by(drug) |>
  summarise(
    media = round(mean(mood.gain), 3),
    dt    = round(sd(mood.gain), 3),
    n     = n()
  )

# --- 2. ANOVA de una via: mood.gain ~ drug ------------------------------------
modelo_anova <- aov(mood.gain ~ drug, data = clin_trial)
summary(modelo_anova)

# --- 3. Tests post-hoc con TukeyHSD ------------------------------------------
TukeyHSD(modelo_anova)

# --- 4. Eta cuadrado ----------------------------------------------------------
clin_trial |>
  anova_test(mood.gain ~ drug)

# --- Bonus: ANOVA con therapy como factor ------------------------------------
modelo_therapy <- aov(mood.gain ~ therapy, data = clin_trial)
summary(modelo_therapy)


# ============================================================
# BLOQUE 2
# ============================================================

# ------------------------------------------------------------
# EJERCICIO: ANOVA de medidas repetidas y mixto
# ------------------------------------------------------------
# Tiempo: 20 minutos
#
#
# 1. Ejecuta un ANOVA de medidas repetidas en `trial_long` con `anxiety` como DV y `timepoint` como factor within. ¿Es significativo el efecto del tiempo?
# 2. Ejecuta el ANOVA mixto (`timepoint` × `group`). ¿Hay interacción significativa?
# 3. Si la interacción es significativa, ejecuta los efectos simples para ver en qué grupos cambia la ansiedad
# 4. *Bonus*: Ejecuta el ANOVA factorial `mood.gain ~ drug * therapy` en `clin_trial`
#
# Plantilla (copiala y completa los huecos):
#
#   # 1. ANOVA de medidas repetidas
#   trial_long |>
#     anova_test(
#       dv     = # TU CÓDIGO AQUÍ,
#       wid    = # TU CÓDIGO AQUÍ,
#       within = # TU CÓDIGO AQUÍ
#     )
#   
#   # 2. ANOVA mixto
#   trial_long |>
#     anova_test(
#       dv      = # TU CÓDIGO AQUÍ,
#       wid     = # TU CÓDIGO AQUÍ,
#       within  = # TU CÓDIGO AQUÍ,
#       between = # TU CÓDIGO AQUÍ
#     )
#   
#   # 3. Efectos simples
#   trial_long |>
#     group_by(# TU CÓDIGO AQUÍ) |>
#     anova_test(
#       dv     = anxiety,
#       wid    = patient_id,
#       within = timepoint
#     )
#   
#   # 4. Bonus: ANOVA factorial
#   modelo_factorial <- aov(# TU CÓDIGO AQUÍ, data = clin_trial)
#   summary(modelo_factorial)
#

# Tu solución aquí:


# ---- SOLUCION de referencia ----
# 1. ANOVA de medidas repetidas
trial_long |>
  anova_test(
    dv     = anxiety,
    wid    = patient_id,
    within = timepoint
  )

# 2. ANOVA mixto
trial_long |>
  anova_test(
    dv      = anxiety,
    wid     = patient_id,
    within  = timepoint,
    between = group
  )

# 3. Efectos simples: efecto del tiempo dentro de cada grupo
trial_long |>
  group_by(group) |>
  anova_test(
    dv     = anxiety,
    wid    = patient_id,
    within = timepoint
  )

# 4. Bonus: ANOVA factorial drug x therapy
modelo_factorial <- aov(mood.gain ~ drug * therapy, data = clin_trial)
summary(modelo_factorial)


# ============================================================
# BLOQUE 3
# ============================================================

# ------------------------------------------------------------
# EJERCICIO: Mini-ejercicio — tu primera regresión
# ------------------------------------------------------------
# Tiempo: 5 minutos
#
#
# Usando `trial`:
#
# 1. Ajusta una regresión simple: `anxiety_post` predicho por `age`
# 2. Muestra el resumen con `summary()`
# 3. Genera el texto APA con `report()`
# 4. ¿Es `age` un predictor significativo?

# Tu solución aquí:


# ---- SOLUCION de referencia ----
# 1-2. ajustar y resumir
modelo_edad <- lm(anxiety_post ~ age, data = trial)
summary(modelo_edad)

# 3. resumen APA
report(modelo_edad)

# 4. mira la fila de "age" en summary():
# si Pr(>|t|) < 0.05, age es un predictor significativo


# ------------------------------------------------------------
# EJERCICIO: Mini-ejercicio — calcular n
# ------------------------------------------------------------
# Tiempo: 5 minutos
#
#
# Diseñas un estudio para comparar dos grupos de pacientes (CBT vs. control).
#
# 1. Esperas un efecto **mediano** (d = 0.5).
# 2. Quieres potencia = 0.80 y α = 0.05.
#
# ¿Cuántos sujetos necesitas **por grupo**?
#
# Ahora imagina que esperas un efecto más **pequeño** (d = 0.3).
# ¿Cuántos sujetos necesitarías por grupo para la misma potencia?

# Tu solución aquí:


# ---- SOLUCION de referencia ----
# efecto mediano (d = 0.5)
pwr.t.test(
  d         = 0.5,
  sig.level = 0.05,
  power     = 0.80,
  type      = "two.sample"
)

# efecto pequeño (d = 0.3)
pwr.t.test(
  d         = 0.3,
  sig.level = 0.05,
  power     = 0.80,
  type      = "two.sample"
)


# ------------------------------------------------------------
# EJERCICIO: Regresión: predecir ansiedad
# ------------------------------------------------------------
# Tiempo: 25 minutos
#
#
# 1. Ajusta una regresión simple prediciendo `anxiety_post` a partir de `wellbeing_score`
# 2. ¿Es `wellbeing_score` un predictor significativo? ¿En qué dirección?
# 3. Ajusta un modelo múltiple con `age` y `wellbeing_score`. ¿Cuál es el R²?
# 4. Compara los dos modelos con `anova()`. ¿Mejora el modelo al añadir `age`?
# 5. Predice la ansiedad para un paciente de 45 años con puntuación de bienestar de 65
#
# Plantilla (copiala y completa los huecos):
#
#   # 1. regresión simple: wellbeing_score predice anxiety_post
#   modelo_simple <- lm(# TU CÓDIGO AQUÍ, data = trial)
#   summary(modelo_simple)
#   
#   # 2. inspeccionar el coeficiente de wellbeing_score en el output
#   
#   # 3. modelo multiple: age + wellbeing_score
#   modelo_multiple <- lm(# TU CÓDIGO AQUÍ, data = trial)
#   summary(modelo_multiple)
#   
#   # 4. comparar modelos
#   anova(# TU CÓDIGO AQUÍ, # TU CÓDIGO AQUÍ)
#   
#   # 5. predicción para paciente nuevo
#   paciente_nuevo <- data.frame(age = 45, wellbeing_score = 65)
#   predict(# TU CÓDIGO AQUÍ, newdata = paciente_nuevo)
#

# Tu solución aquí:


# ---- SOLUCION de referencia ----
# 1. regresión simple: wellbeing predice ansiedad
modelo_simple <- lm(anxiety_post ~ wellbeing_score, data = trial)
summary(modelo_simple)

# 2. la pendiente de wellbeing_score nos dice la direccion:
# negativa = mas bienestar -> menos ansiedad (lo esperado)

# 3. modelo multiple
modelo_multiple <- lm(anxiety_post ~ age + wellbeing_score, data = trial)
summary(modelo_multiple)
# R-squared esta al final del output

# 4. comparar modelos anidados
anova(modelo_simple, modelo_multiple)
# p < 0.05 significa que anadir age mejora significativamente el modelo

# 5. predicción para paciente de 45 años, bienestar = 65
paciente_nuevo <- data.frame(age = 45, wellbeing_score = 65)
predict(modelo_multiple, newdata = paciente_nuevo, interval = "confidence")
