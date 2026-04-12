# Referencias y recursos — Curso Introducción a R

## Libros y tutoriales (gratuitos)

| Tema | Recurso | Enlace |
|------|---------|--------|
| **Estadística con R (general)** | Navarro, D. *Learning Statistics with R* | [learningstatisticswithr.com](https://learningstatisticswithr.com/) |
| **R para ciencia de datos** | Wickham, H. et al. *R for Data Science* (2e) | [r4ds.hadley.nz](https://r4ds.hadley.nz/) |
| **Modelos lineales mixtos** | Winter, B. (2013). *Linear models and linear mixed effects models in R* | [arXiv:1308.5499](https://arxiv.org/abs/1308.5499) |
| **Datos ausentes (missing data)** | van Buuren, S. *Flexible Imputation of Missing Data* | [stefvanbuuren.name/fimd](https://stefvanbuuren.name/fimd/) |
| **Estadística bayesiana (intro)** | Nicenboim, B. et al. *An Introduction to Bayesian Data Analysis for Cognitive Science* | [vasishth.github.io/bayescogsci](https://vasishth.github.io/bayescogsci/book/) |
| **Estadística bayesiana (avanzado)** | McElreath, R. *Statistical Rethinking* (libro + clases en YouTube) | [xcelab.net/rm](https://xcelab.net/rm/) |
| **Análisis de potencia** | Lakens, D. *Improving Your Statistical Inferences* (Coursera) | [coursera.org](https://www.coursera.org/learn/statistical-inferences) |

## Cheatsheets y referencias rápidas

| Recurso | Enlace |
|---------|--------|
| Cheatsheets de RStudio/Posit (dplyr, ggplot2, tidyr, etc.) | [posit.co/resources/cheatsheets](https://posit.co/resources/cheatsheets/) |
| Quarto reference | [quarto.org/docs/reference](https://quarto.org/docs/reference/) |
| R Graph Gallery (ejemplos de visualización) | [r-graph-gallery.com](https://www.r-graph-gallery.com/) |
| ggsci (paletas de colores para publicaciones) | [cran.r-project.org/package=ggsci](https://cran.r-project.org/package=ggsci) |

## Paquetes clave del curso

| Paquete | Uso | Documentación |
|---------|-----|---------------|
| `tidyverse` | Importar, transformar, visualizar datos | [tidyverse.org](https://www.tidyverse.org/) |
| `afex` | ANOVA (una vía, medidas repetidas, mixto) | [github.com/singmann/afex](https://github.com/singmann/afex) |
| `emmeans` | Medias marginales estimadas y post-hoc | [cran.r-project.org/package=emmeans](https://cran.r-project.org/package=emmeans) |
| `effectsize` | Tamaños del efecto (Cohen's d, eta², etc.) | [easystats.github.io/effectsize](https://easystats.github.io/effectsize/) |
| `report` | Resúmenes APA automáticos | [easystats.github.io/report](https://easystats.github.io/report/) |
| `performance` | Diagnósticos de modelos | [easystats.github.io/performance](https://easystats.github.io/performance/) |

## Paquetes para análisis avanzados

| Paquete | Uso | Documentación |
|---------|-----|---------------|
| `lme4` | Modelos lineales mixtos (LMM, GLMM) | [github.com/lme4/lme4](https://github.com/lme4/lme4) |
| `brms` | Modelos bayesianos (interfaz a Stan) | [paul-buerkner.github.io/brms](https://paul-buerkner.github.io/brms/) |
| `lavaan` | Modelos de ecuaciones estructurales (SEM, CFA, path analysis) | [lavaan.ugent.be](https://lavaan.ugent.be/) |
| `metafor` | Meta-análisis (efectos fijos, aleatorios, moderadores) | [metafor-project.org](https://www.metafor-project.org/) |
| `pwr` | Análisis de potencia (t-test, ANOVA, correlación, chi²) | [cran.r-project.org/package=pwr](https://cran.r-project.org/package=pwr) |
| `Superpower` | Simulación de potencia para diseños factoriales | [aaroncaldwell.us/SuperpowerBook](https://aaroncaldwell.us/SuperpowerBook/) |
| `mice` | Imputación múltiple de datos ausentes | [amices.org/mice](https://amices.org/mice/) |
| `psych` | Descriptivos, análisis factorial, fiabilidad (alpha) | [personality-project.org/r/psych](https://personality-project.org/r/psych/) |

## Cursos relacionados en la UGR

- **Curso de SEM** (Efraín García Sánchez) — Modelos de Ecuaciones Estructurales: mediación, moderación, modelos multinivel y SEM.

## Usar IA para aprender

Los modelos de lenguaje (ChatGPT, Claude) son excelentes para:

- **Simular datos**: pedir que genere un dataset con ciertas características y practicar análisis
- **Explicar conceptos**: pedir que explique un concepto estadístico paso a paso
- **Depurar código**: pegar un error y pedir que lo explique
- **Traducir entre paquetes**: "¿cómo hago esto mismo con afex en vez de rstatix?"

No sustituyen el aprendizaje, pero aceleran mucho la práctica.
