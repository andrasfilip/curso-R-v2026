# ============================================================
# EJERCICIOS - DIA 5 (versión ESTUDIANTE)
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
# EJERCICIO: Mini-ejercicio — tu propio histograma
# ------------------------------------------------------------
# Tiempo: 5 minutos
#
#
# Usando el dataset `penguins`:
#
# 1. Crea un histograma de `bill_depth_mm` con 20 bins
# 2. Usa `fill = "coral"` y `color = "white"`
# 3. Añade etiquetas claras con `labs()` (título y ejes)
# 4. Aplica `theme_minimal()`

# Tu solución aquí:


# ------------------------------------------------------------
# EJERCICIO: Visualizar pingüinos
# ------------------------------------------------------------
# Tiempo: 20 minutos
#
#
# 1. Crea un scatter plot de `bill_length_mm` vs. `bill_depth_mm` coloreado por `species`
# 2. Añade `geom_smooth(method = "lm")` para incluir líneas de regresión
# 3. Crea un boxplot de `flipper_length_mm` por `species`
# 4. Añade etiquetas claras con `labs()` a ambos gráficos
# 5. *Bonus*: cambia el tema a `theme_classic()` y ajusta el color con `scale_color_manual()`
#
# Plantilla (copiala y completa los huecos):
#
#   # --- 1-2. Scatter plot con lineas de regresión --------------------------------
#   ggplot(penguins, aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
#     # TU_CODIGO_AQUI
#   
#   # --- 3-4. Boxplot de longitud de aleta por especie ----------------------------
#   ggplot(penguins, aes(x = species, y = flipper_length_mm, fill = species)) +
#     # TU_CODIGO_AQUI
#   
#   # --- Bonus: theme_classic() + scale_color_manual() ---------------------------
#   # TU_CODIGO_AQUI
#

# Tu solución aquí:


# ============================================================
# BLOQUE 2
# ============================================================

# ------------------------------------------------------------
# EJERCICIO: Mini-ejercicio — tu primera faceta
# ------------------------------------------------------------
# Tiempo: 5 minutos
#
#
# Usando `penguins`:
#
# 1. Crea un scatter plot de `bill_length_mm` (x) vs. `bill_depth_mm` (y)
# 2. Usa `facet_wrap(~ species)` para crear un panel por especie
# 3. Añade etiquetas claras con `labs()`
# 4. Aplica `theme_minimal()`

# Tu solución aquí:


# ------------------------------------------------------------
# EJERCICIO: Personalizar y combinar gráficos
# ------------------------------------------------------------
# Tiempo: 20 minutos
#
#
# 1. Crea un scatter plot de `bill_length_mm` vs. `bill_depth_mm` por `species` con `theme_classic()` y la paleta `"Dark2"` de ColorBrewer
# 2. Crea un histograma de `flipper_length_mm` con `facet_wrap(~ species)`
# 3. Usa `patchwork` para combinar ambos plots verticalmente (scatter arriba, histogramas abajo)
# 4. Añade etiquetas "A" y "B" con `plot_annotation(tag_levels = "A")`
# 5. *Bonus*: guarda el gráfico combinado con `ggsave()` a 300 dpi
#
# Plantilla (copiala y completa los huecos):
#
#   # 1. Scatter plot con theme_classic() y paleta Dark2
#   p_scatter <- ggplot(penguins, aes(x = bill_length_mm, y = bill_depth_mm,
#                                      color = species)) +
#     geom_point(alpha = 0.7) +
#     scale_color_brewer(palette = # TU_CODIGO_AQUI) +
#     labs(x = "Longitud del pico (mm)", y = "Profundidad del pico (mm)",
#          color = "Especie") +
#     theme_classic() # TU_CODIGO_AQUI
#   
#   # 2. Histograma con facet_wrap
#   p_hist <- ggplot(penguins, aes(x = flipper_length_mm)) +
#     geom_histogram(bins = 25, fill = "steelblue") +
#     facet_wrap(# TU_CODIGO_AQUI) +
#     labs(x = "Longitud de aleta (mm)", y = "Frecuencia") +
#     theme_minimal()
#   
#   # 3 & 4. Combinar con patchwork y anadir etiquetas
#   # TU_CODIGO_AQUI
#   
#   # 5. Bonus: guardar con ggsave()
#   # TU_CODIGO_AQUI
#

# Tu solución aquí:


# ============================================================
# BLOQUE 3
# ============================================================

# ------------------------------------------------------------
# EJERCICIO: Crear tu primer informe Quarto
# ------------------------------------------------------------
# Tiempo: 20 minutos
#
#
# 1. En RStudio: **File > New File > Quarto Document** — título "Mi primer informe", HTML
# 2. Añade un encabezado YAML con tu nombre y `toc: true`
# 3. Escribe una sección `## Introduccion` con 2-3 frases describiendo el análisis
# 4. Añade un chunk que cargue tidyverse y los penguins, y muestre `glimpse(penguins)`
# 5. Añade un chunk con un gráfico ggplot2 (el que quieras)
# 6. Escribe una sección `## Conclusion` con una frase usando código en línea para reportar la masa media
# 7. Pulsa **Render** y verifica que el HTML se genera correctamente
#
# # Recursos para seguir aprendiendo {.section-slide background-color="#43464B"}

# Tu solución aquí:
