===============================================================================
 CAPSTONE — DÍA 3: Desigualdad de género y desarrollo humano (UNDP)
===============================================================================

PREGUNTA DE INVESTIGACIÓN
-------------------------
¿Existe una relación entre el Índice de Desigualdad de Género (GII) y
la esperanza de vida en los países de Europa y Asia Central en 2021?

TIEMPO ESTIMADO
---------------
45–60 minutos.

CONCEPTOS NECESARIOS (Día 1 + Día 2 + Día 3)
--------------------------------------------
- read_csv(), glimpse() — importar y explorar
- select() y filter() — elegir columnas y filas
- pivot_longer() — reestructurar (opcional, para el bonus)
- group_by() + summarise() — estadísticos por grupo
- mean(), sd(), median(), IQR() — descriptivos
- shapiro.test() o check_normality() — comprobar normalidad
- cor.test() — correlación de Pearson o Spearman
- report() del paquete easystats — generar texto APA

DATASET
-------
data_undp.csv — United Nations Development Programme (UNDP). Human
Development Report 2021. Contiene indicadores de desarrollo humano
(HDI, GII, esperanza de vida, etc.) para 206 países desde 1990 hasta 2021.

IMPORTANTE: el dataset es muy ancho (más de 1000 columnas — una por año
para cada indicador). Para este ejercicio nos vamos a centrar solo
en los datos de 2021.

VARIABLES CLAVE
---------------
- country            — nombre del país
- region             — código de región: ECA (Europa y Asia Central),
                       LAC (Latinoamérica), SSA (África Subsahariana),
                       EAP (Asia Oriental y Pacífico), SA (Asia del Sur),
                       AS (Estados Árabes)
- hdicode            — categoría de desarrollo: Low, Medium, High, Very High
- hdi_2021           — Human Development Index en 2021
- le_2021            — esperanza de vida al nacer (años)
- gnipc_2021         — ingreso nacional bruto per cápita (USD)
- gii_2021           — Gender Inequality Index (0 = sin desigualdad,
                       1 = máxima desigualdad)

CÓMO EMPEZAR
------------
1. Abre RStudio.
2. Ve a: File > New Project > Existing Directory.
3. Selecciona esta carpeta (day3_undp) y haz clic en "Create Project".
4. Abre scripts/01_analysis.R desde el panel Files.
5. Sigue las instrucciones del script.

ESTRUCTURA DEL PROYECTO
-----------------------
day3_undp/
├── README.txt              (este archivo)
├── data/
│   ├── raw_data/
│   │   └── data_undp.csv
│   └── processed_data/
├── scripts/
│   └── 01_analysis.R
└── output/

ENTREGA
-------
Cuando termines, guarda el script con tu nombre y envíalo al profesor.
