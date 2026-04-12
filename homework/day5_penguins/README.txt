===============================================================================
 CAPSTONE — DÍA 5: Análisis visual y estadístico de pingüinos
===============================================================================

PREGUNTA DE INVESTIGACIÓN
-------------------------
¿Difieren las especies de pingüinos en su tamaño corporal?
Un análisis visual y estadístico con un reporte reproducible en Quarto.

TIEMPO ESTIMADO
---------------
60–90 minutos.

CONCEPTOS NECESARIOS (todo el curso)
------------------------------------
- Importar y limpiar datos (Día 1–2)
- Pipelines con dplyr (Día 2)
- Estadísticos descriptivos, t-test, ANOVA (Día 3–4)
- Visualización con ggplot2 (Día 5)
- Quarto: crear un reporte reproducible (Día 5)

DATASET
-------
penguins_sample.csv — snapshot del dataset `penguins` del paquete
`palmerpenguins`. Contiene medidas de 344 pingüinos de 3 especies
(Adelie, Chinstrap, Gentoo) en la Antártida.

Variables:
  species            — especie del pingüino
  island             — isla donde se midió
  bill_length_mm     — longitud del pico (mm)
  bill_depth_mm      — profundidad del pico (mm)
  flipper_length_mm  — longitud de la aleta (mm)
  body_mass_g        — masa corporal (g)
  sex                — sexo (male / female)
  year               — año de medición

CÓMO EMPEZAR
------------
1. Abre RStudio.
2. Ve a: File > New Project > Existing Directory.
3. Selecciona esta carpeta (day5_penguins) y haz clic en "Create Project".
4. Tienes DOS archivos en scripts/:
   a) scripts/01_analysis.R — úsalo como cuaderno de borrador: explora
      los datos, prueba gráficos, ejecuta modelos.
   b) scripts/02_report.qmd — éste es el ENTREGABLE final. Renderízalo
      a HTML cuando hayas completado los huecos.

FLUJO DE TRABAJO RECOMENDADO
----------------------------
1. Abre scripts/01_analysis.R y explora los datos de forma interactiva.
   Copia los fragmentos que funcionen bien al reporte.
2. Abre scripts/02_report.qmd y completa las secciones:
   - Introducción (texto narrativo)
   - Importación y transformación
   - Visualización (3 gráficos)
   - Estadísticos descriptivos
   - Modelo estadístico (ANOVA)
   - Comunicación de resultados
3. Renderiza el documento con el botón "Render" o `Ctrl/Cmd + Shift + K`.
   El resultado es un archivo HTML en la misma carpeta.

ESTRUCTURA DEL PROYECTO
-----------------------
day5_penguins/
├── README.txt
├── data/
│   ├── raw_data/
│   │   └── penguins_sample.csv
│   └── processed_data/
├── scripts/
│   ├── 01_analysis.R       (borrador — no es el entregable)
│   └── 02_report.qmd       (ESTE es el entregable — renderízalo a HTML)
└── output/                 (aquí puedes guardar gráficos con ggsave)

ENTREGA
-------
Envía al profesor:
  1. El archivo 02_report.qmd completado.
  2. El archivo HTML renderizado (02_report.html).
