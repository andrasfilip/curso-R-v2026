# EJERCICIOS - DIA 1 (versión ESTUDIANTE)
# Curso: Introducción a la programación y análisis de datos en R
# Efraín García Sánchez & Filip Andras
# CIMCYC - Universidad de Granada
 

# Como usar este script:
#   1. Lee el enunciado de cada ejercicio (lineas comentadas).
#   2. Escribe tu propia solución en un nuevo script o en las
#      lineas en blanco debajo del enunciado.
#   3. Al final de cada ejercicio encontraras la SOLUCION de
#      referencia. No mires la solución hasta intentarlo.

 
# BLOQUE 1.1: Iniciación ----

## EJERCICIO 1: Operacions aritméticas ----

# **Instrucciones:**

# 1. Crea una variable llamada `edad` y asígnale el valor 25.
# 2. Calcula el doble de esa edad y guarda el resultado en una 
#    nueva variable llamada `doble_edad`.
# 3. Calcula la raíz cuadrada de la edad usando una función de R y 
#    guarda el resultado en una variable llamada `raiz_edad`.
# 4. Divide la edad entre 3 y redondea el resultado a 2 decimales. 
#    Guarda el resultado en una variable llamada `edad_redondeada`.
# 5. Finalmente, ejecuta cada una de las variables 
#    (`doble_edad`, `raiz_edad`, `edad_redondeada`) para ver sus resultados en la consola.

# Tu solución aquí:







## EJERCICIO 2: Calculadora de IMC ----
 
# Tiempo: 15 minutos

# **Instrucciones:**

# 1. Crea variables para tu nombre, edad, altura (m) y peso (kg)
# 2. Calcula tu IMC: `peso / altura^2`
# 3. Comprueba el tipo de cada variable con `class()`
# 4. Convierte tu edad a character con `as.character()` y comprueba qué cambió
# 5. Crea una variable lógica: `es_mayor <- edad > 18`

# Tu solución aquí:







## Ejercicio Extra (si te sobra tiempo) ----

# 1.  Calcula la raíz cuadrada de 144
# 2.  Comprueba el tipo de dato que devuelve `sqrt()`
# 3. Crea dos variables logicas (`tengo_dinero`, `tengo_entrada`) 
#     y prueba `&`, `|`, `!` entre ellas
# 4. Crea la variable `puedo_entrar`, usando las variables anteriores, y cuyo resultado sea igual a `TRUE`

# Tu solución aquí:







# BLOQUE 1.2: Vectores ----
 
## EJERCICIO 3: crear vectores ----
 
# Tiempo: 5 minutos

# 1.  Crea un vector llamado `participante` que contenga una secuencia de 1 a 3, 
#     que se repita 3 veces. Pista: usa `rep()` con `each`.
# 2.  Crea un vector llamado `ejercicio` con los valores "cardio", "fuerza" y 
#     "yoga", y que este patron se repita 3 veces (una vez por cada participante). 
#     Pista: usa `rep()` con `times`.
# 3.  Crea un vector llamado grupo donde los seis primeros participantes 
#     pertenezcan a "principiante" y los tres siguientes a "avanzado". 
#     Pista: usa `times = c(6, 3)`
# 4. Comprueba la longitud de cada vector con `length()`.

# Tu solución aquí:









 
## EJERCICIO 4: Contar y reemplazar NA ----
 
# Tiempo: 5 minutos

# Tienes este vector de puntuaciones BAI con valores ausentes:

# 1.  ¿Cuántos NA hay? Usa `sum(is.na())`.
# 2.  Calcula la media ignorando los NA.
# 3.  Seleccionar valores válidos (ignorando NA)
# 4.  Reemplaza los NA por 0 y vuelve a calcular la media. 
#     Nota: Para resolver los puntos 3 y 4 debes buscar en internet cómo 
#     seleccionar objetos dentro de un factor reemplazar los NA por un valor específico (indexación—siguiente tema).

# Tu solución aquí:









## EJERCICIO 5: Analizar puntuaciones de ansiedad ----
 
# Tiempo: 20 minutos

# Tienes las puntuaciones BAI (Beck Anxiety Inventory) de 10 pacientes:

# 1.  Calcula la **media**, **desviación típica** y **mediana** (ignora el NA)
# 2.  ¿Cuántos pacientes tienen una puntuación **por encima de 20**?
# 3.  Selecciona las puntuaciones **mayores de 20** y elimina los `NA`, 
#     usando indexación lógica (e.g., `&`, `|`, etc.)
# 4.  Crea un vector `etiquetas` con `"bajo"` si BAI < 20 o `"alto"` si BAI >= 20
#     - *Pista:* examina la ayuda de la función `?ifelse()` y úsala apropiadamente
# 5.  ¿Cuántos pacientes hay en cada categoría? Usa `table()`

# Tu solución aquí:








## Ejercicio Extra (si te sobra tiempo) ----
  
#   1. ¿cuál es la puntuación más alta en bai? ¿en qué posición está?
#   2. Reemplazar el NA por la media de los demás valores
#   3. ¿Cuántos valores únicos hay en el vector? 
#   - Pista: explorar la función `unique()`
#   4. Unir el vector `bai` con el vector `etiquetas` en un data frame. 
#   - Pista: explora la función `data.frame()` (siguiente tema)

# Tu solución aquí:








# BLOQUE 1.3: Data frames ----
 
## EJERCICIO 6: Crear tu propio data frame ----

# Tiempo: 5 minutos

# Crea un `tibble()` con **5 filas** y estas columnas:

# 1. `id` — números del 1 al 5
# 2. `group` — alterna entre `"CBT"` y `"control"`
# 3. `anxiety_pre` — puntuaciones ficticias entre 10 y 20
# 4. `anxiety_post` — puntuaciones ficticias entre 5 y 15

# Comprueba las dimensiones del resultado con `dim()`.

# Tu solución aquí:







## EJERCICIO 7: usando funciones sobre data frames ----

# **Usando el data frame** `pacientes`, determina:
#  
#  1. ¿Cuántos pacientes están en el grupo CBT y en el placebo?
#  2. ¿Cuál es la media de bai en el data frame `pacientes`? 
#  3. ¿Cuántos años tiene la persona con mayor edad?
#  4. Crea una nueva columna lógica `bai_categoria`: Si bai > 30, asignar "severo", de lo contrario, asignar "leve-moderado". *Pista: recordar la función `ifelse()`*

# Tu solución aquí:









## EJERCICIO 8: Explorar el dataset GAD ----
 
# Tiempo: 25 minutos

# Carga `data_gad.csv` **correctamente** (con `na = c("N/A", "")`) y responde:

# 1. ¿Cuántas filas y columnas tiene?
# 2. ¿Qué tipo tiene cada columna? (usa `glimpse()`)
# 3. ¿Cuántos `NA` hay en total? ¿En qué columnas?
# 4. ¿Cuántos pacientes hay en cada grupo? (usa `table()`)
# 5. ¿Cuál es la puntuación GAD-7 media **antes** del tratamiento? (ignora NAs)
# 6. ¿Cuál es la puntuación mínima y máxima **después** del tratamiento?

# Tu solución aquí:

library(tidyverse)

# paso 1: cargar los datos indicando que "N/A" es NA
# Nota: recordar que hay que tener la ruta del archivo
# verificar el directorio de trabajo
getwd()









## Ejercicio Extra (si te sobra tiempo) ----

# 1. Cuántos pacientes distintos hay en cada grupo?
# 2. Cual es la edad media de los pacientes?
# 3. Cuántos pacientes tienen GAD severo antes del tratamiento?
# 4. Selecciona solo los pacientes del grupo CBT con gad_post disponible

# Tu solución aquí:








