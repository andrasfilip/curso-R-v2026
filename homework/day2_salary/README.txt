===============================================================================
 CAPSTONE — DÍA 2: Brecha salarial de género en España (2008–2017)
===============================================================================

PREGUNTA DE INVESTIGACIÓN
-------------------------
¿Cómo ha evolucionado la brecha salarial de género en España entre 2008 y
2017?

TIEMPO ESTIMADO
---------------
45–60 minutos.

CONCEPTOS NECESARIOS (Día 1 + Día 2)
------------------------------------
- read_csv() para importar datos
- glimpse() y table() para explorar
- select() para elegir columnas
- filter() para elegir filas
- mutate() para crear nuevas variables
- group_by() + summarise() para agregar
- arrange() para ordenar
- El pipe |> para encadenar operaciones

DATASET
-------
data_salary.csv — Encuesta de Estructura Salarial del INE (Instituto Nacional
de Estadística). Datos de ingresos brutos anuales por comunidad autónoma,
género y año (2008–2017).

CÓMO EMPEZAR
------------
1. Abre RStudio.
2. Ve a: File > New Project > Existing Directory.
3. Selecciona esta carpeta (day2_salary) y haz clic en "Create Project".
4. Abre el archivo scripts/01_analysis.R desde el panel Files de RStudio.
5. Sigue las instrucciones del script: completa los huecos marcados
   con # TU CÓDIGO AQUÍ.

ESTRUCTURA DEL PROYECTO
-----------------------
day2_salary/
├── README.txt              (este archivo)
├── data/
│   ├── raw_data/           (datos originales — NO modificar)
│   │   └── data_salary.csv
│   └── processed_data/     (aquí puedes guardar datos limpios)
├── scripts/
│   └── 01_analysis.R       (empieza aquí)
└── output/                 (aquí puedes guardar tablas o gráficos)

REGLA DE ORO
------------
Nunca modifiques los archivos de data/raw_data/. Si necesitas transformar
los datos, guarda el resultado en data/processed_data/.

ENTREGA
-------
Cuando termines, guarda el script con tu nombre
(ej: 01_analysis_ana_garcia.R) y envíalo al profesor.
