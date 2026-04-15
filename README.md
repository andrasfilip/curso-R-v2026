# Introducción a la programación y análisis de datos en R

**Curso doctoral EDCS** — Escuela de Doctorado de Ciencias de la Salud, Universidad de Granada  
**Autores:** Efraín García Sánchez & Filip Andras — CIMCYC, Universidad de Granada  
**Año:** 2026  
**Duración:** 5 días (25h presenciales + 5h trabajo autónomo)

---

## Estructura del curso

| Día | Tema | Contenido |
|-----|------|-----------|
| **Día 1** | Fundamentos de R | Tipos de datos, estructuras, control de flujo, funciones, importar datos |
| **Día 2** | Procesamiento de datos | Tidyverse: `select`, `filter`, `mutate`, `summarise`, joins, exportar |
| **Día 3** | Análisis de datos (I) | Reestructurar datos, descriptivos, correlación, regresión, t-tests |
| **Día 4** | Análisis de datos (II) | ANOVA de una vía, medidas repetidas, ANOVA mixto, interacciones |
| **Día 5** | Visualización y reportes | ggplot2, Quarto, reportes reproducibles |

Cada día tiene **3 bloques** de 80 minutos con dos descansos de 20 minutos.

---

## Contenido por bloque

### Día 1 — Fundamentos de R
- **Bloque 1:** Introducción a R y RStudio, tipos de datos, vectores
- **Bloque 2:** Data frames, factores, control de flujo (`if/else`)
- **Bloque 3:** Funciones, importar/exportar datos, ejercicio integrador

### Día 2 — Procesamiento de datos con tidyverse
- **Bloque 1:** Tidyverse, pipe (`|>`), organizar proyectos, `select()`, `filter()`
- **Bloque 2:** `arrange()`, `mutate()`, `if_else()`, `case_when()`, joins
- **Bloque 3:** `group_by()` + `summarise()`, pipelines completos, exportar datos

### Día 3 — Análisis de datos (I)
- **Bloque 1:** `pivot_longer()` / `pivot_wider()`, reestructurar datos
- **Bloque 2:** Descriptivos, normalidad, correlación (Pearson/Spearman), regresión lineal
- **Bloque 3:** t-tests (una muestra, independientes, pareados), Cohen's d

### Día 4 — Análisis de datos (II)
- **Bloque 1:** Introducción conceptual al ANOVA (documento interactivo `anova_by_hand.html`)
- **Bloque 2:** Ejercicio guiado — ANOVA de una vía con datos del ensayo clínico
- **Bloque 3:** ANOVA de medidas repetidas y mixto con `afex` + `emmeans`

### Día 5 — Visualización y reportes
- **Bloque 1:** ggplot2: gramática de gráficos, `geom_*()`, `facet_wrap()`
- **Bloque 2:** Personalización de gráficos, temas, exportar figuras
- **Bloque 3:** Quarto: reportes reproducibles, ejercicio final

---

## Estructura de carpetas

```
intro_to_R/
├── DayX_bloqueY_student.html     Presentaciones (versión estudiante, sin soluciones)
├── funciones_del_curso.html      Referencia completa de funciones del curso
├── anova_by_hand.html            ANOVA paso a paso: de Fisher a R
├── ttest_by_hand.html            t-test paso a paso: de Student a R
├── buenas_practicas.html         Buenas prácticas de programación en R
│
├── exercises/                     Ejercicios en clase
│   ├── exercises.Rproj           Proyecto RStudio
│   ├── data/
│   │   ├── raw_data/             Datos originales (solo lectura)
│   │   └── processed_data/       Datos preprocesados (preprocessed_data.csv)
│   └── scripts/                  Scripts de ejercicios + soluciones
│       ├── 01_day1_exercises_student.R
│       ├── 01_day1_exercises_solutions.R
│       ├── 02_day2_exercises_student.R
│       ├── 02_day2_exercises_solutions.R
│       ├── 03_day3_exercises_student.R
│       ├── 03_day3_exercises_solutions.R
│       ├── 03_preprocessing_pipeline.R
│       ├── 04_day4_exercises_student.R
│       └── 04_day4_exercises_solutions.R
│
├── homework/                      Trabajo autónomo
    ├── day2_salary/              Brecha salarial de género (INE)
    ├── day3_undp/                Desarrollo humano (UNDP)
    └── day5_penguins/            Palmer penguins (visualización + reporte)
```

---

## Datos

El curso utiliza un **ensayo clínico sintético** como hilo conductor:

- 300 pacientes asignados aleatoriamente a 3 grupos: **CBT**, **farmacológico**, **control**
- Variables: ansiedad (GAD-7), depresión (PHQ-9), bienestar, soledad (UCLA), autoestima (Rosenberg)
- Medidas pre-tratamiento, post-tratamiento y seguimiento a 3 meses

Ver `data/README.md` para la descripción completa de cada dataset y las escalas clínicas.

---

## Materiales complementarios

| Archivo | Descripción |
|---------|-------------|
| `funciones_del_curso.html` | Referencia completa de todas las funciones del curso, con ejemplos desde el ensayo clínico |
| `anova_by_hand.html` | ANOVA paso a paso: de Fisher a R — la lógica del F |
| `ttest_by_hand.html` | t-test paso a paso: de Student a R — historia, NHST, cálculos a mano |
| `buenas_practicas.html` | Buenas prácticas de programación en R |
| `referencias.md` | Referencias, recursos y enlaces recomendados |

---

## Uso para estudiantes

1. Descarga o clona este repositorio
2. Abre la carpeta `exercises/` y crea un proyecto RStudio: **File > New Project > Existing Directory**
3. Abre el script de ejercicios del día correspondiente en `exercises/scripts/`
4. Sigue las instrucciones del instructor y completa los ejercicios donde dice `# TU_CODIGO_AQUI`
5. Al final del día, completa el ejercicio de trabajo autónomo en `homework/`

---

## Nota sobre publicación secuencial

Los materiales se publican de forma progresiva para que los estudiantes no vean las soluciones antes de intentar los ejercicios por su cuenta:

- **Antes de cada sesión:** se publican las presentaciones `_student.html` y los scripts `*_student.R`
- **Después de cada sesión:** se publican los scripts `*_solutions.R` en la misma carpeta `exercises/scripts/`

---

## Licencia

Materiales creados para uso docente en el programa María de Maeztu (MdM), CIMCYC, Universidad de Granada.
