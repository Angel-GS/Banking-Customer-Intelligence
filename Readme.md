# Banking Customer Intelligence & Digital Adoption

Proyecto de Business Intelligence desarrollado con **SQL Server y Power BI** para analizar el comportamiento de clientes frente a la aceptación de préstamos personales e identificar segmentos que podrían representar oportunidades comerciales.

> **Estado del proyecto:** análisis de datos, preparación SQL y estructura funcional del dashboard completados. Queda pendiente el ajuste estético final de los gráficos y la revisión visual antes de publicar la versión definitiva del informe.

## 1. Objetivo del proyecto

Transformar una base de datos de clientes en información útil para apoyar el análisis comercial de una entidad bancaria. El proyecto busca:

- Entender la aceptación de una oferta de préstamo personal.
- Identificar características asociadas con una mayor tasa de aceptación.
- Comparar perfiles según ingresos, educación, productos financieros y uso de banca en línea.
- Presentar los resultados mediante un dashboard interactivo que permita explorar distintos segmentos.

El análisis es descriptivo y exploratorio. Las asociaciones encontradas no deben interpretarse como relaciones causales.

## 2. Dataset

Se utilizó el archivo `Bank_Personal_Loan_Modelling.csv`, que contiene información de **5,000 clientes y 14 campos**.

La variable principal de análisis es `Personal Loan`, que identifica si el cliente aceptó (1) o no aceptó (0) la oferta de préstamo personal considerada en el conjunto de datos.

### Características iniciales

| Característica | Resultado |
|---|---:|
| Registros | 5,000 |
| Campos | 14 |
| Valores nulos en el CSV original | 0 |
| Filas duplicadas | 0 |
| Clientes que aceptaron | 480 |
| Clientes que no aceptaron | 4,520 |
| Tasa global de aceptación | 9.60% |
| Valores negativos en `Experience` | 52 |

La descripción detallada del conjunto de datos y de sus campos se encuentra en [`documentacion/data_dictionary.md`](Documentacion/data_dictionary.md).

## 3. Herramientas utilizadas

- **SQL Server 2022:** almacenamiento, exploración y preparación de datos.
- **SQL Server Management Studio (SSMS):** ejecución y administración de consultas SQL.
- **Power BI Desktop:** modelo analítico, medidas, segmentadores y visualizaciones.
- **DAX:** creación de medidas y columnas calculadas.
- **Power Query:** conexión y revisión de los tipos de datos.

## 4. Proceso de trabajo

1. Importación del CSV en SQL Server, conservando una tabla original (`dbo.BankLoan_Raw`).
2. Exploración de calidad, estructura, distribución y valores de las variables.
3. Creación de `dbo.BankLoan_Clean`, corrigiendo los valores negativos de `Experience`.
4. Análisis de negocio mediante consultas SQL.
5. Conexión de Power BI a la tabla limpia.
6. Creación de medidas DAX y columnas de clasificación.
7. Diseño de dos páginas de análisis con indicadores, gráficos y filtros.

El detalle se encuentra en [`documentacion/data_preparation_sql.md`](documentacion/data_preparation_sql.md) y [`documentacion/powerbi_model.md`](documentacion/powerbi_model.md).

## 5. Requerimientos de negocio

El dashboard fue planteado para responder estas preguntas:

1. ¿Cuál es el tamaño de la base de clientes analizada?
2. ¿Qué proporción aceptó el préstamo personal?
3. ¿Cómo se distribuyen los clientes por nivel educativo?
4. ¿Qué segmentos de ingresos presentan mayores tasas de aceptación?
5. ¿Qué diferencias existen entre clientes que aceptaron y no aceptaron según sus ingresos promedio?
6. ¿Se observan diferencias de aceptación según la tenencia de una cuenta CD?
7. ¿Existe una diferencia relevante según el uso de banca en línea?
8. ¿Cómo varía la aceptación según el tamaño familiar?

## 6. Dashboard

### Página 1 — Resumen ejecutivo

Presenta una visión general de la base y de la aceptación de préstamos.

**Indicadores principales**
- Total de clientes.
- Préstamos aceptados.
- Tasa de aceptación.

**Visualizaciones**
- Tasa de aceptación por segmento de ingresos.
- Distribución de clientes por nivel educativo.
- Distribución de aceptación de préstamos.

### Página 2 — Segmentación y oportunidades

Profundiza en características financieras, productos y comportamiento digital.

**Visualizaciones**
- Ingreso promedio según aceptación del préstamo.
- Tasa de aceptación según tenencia de cuenta CD.
- Tasa de aceptación según uso de banca en línea.
- Tasa de aceptación según tamaño familiar.

**Filtros previstos en ambas páginas**
- Segmento de ingresos.
- Nivel educativo.
- Uso de banca en línea.

Los segmentadores se pueden sincronizar entre páginas para conservar el contexto de análisis al navegar por el informe.

## 7. Hallazgos principales

- La tasa general de aceptación fue de **9.60%** (480 de 5,000 clientes).
- El segmento de ingresos altos (>100) presentó una tasa de aceptación de **36.14%**; el segmento medio (51–100), **2.24%**; y el segmento bajo (≤50), **0.00%**.
- **91.25% de los clientes que aceptaron** pertenecían al segmento de ingresos altos (438 de 480).
- El ingreso promedio de quienes aceptaron fue de aproximadamente **144.75**, frente a **66.24** entre quienes no aceptaron.
- La aceptación fue de **46.36%** entre clientes con cuenta CD y **7.24%** entre quienes no tenían cuenta CD. La cuenta CD aparece como una característica diferenciadora importante en esta muestra.
- La tasa de aceptación fue de **9.75%** entre usuarios de banca en línea y **9.38%** entre quienes no la utilizaban; la diferencia es pequeña.
- Por nivel educativo, las tasas fueron aproximadamente **4.44%** para el nivel 1, **12.97%** para el nivel 2 y **13.66%** para el nivel 3.
- Por tamaño familiar, las tasas observadas fueron aproximadamente **7.27%** (1 integrante), **8.18%** (2), **13.17%** (3) y **10.97%** (4).

Los resultados completos y sus interpretaciones están en [`documentacion/insights.md`](documentacion/insights.md).

## 8. Valor para el negocio

El dashboard permite:

- Identificar segmentos donde la aceptación observada es mayor.
- Comparar perfiles de clientes sin depender de consultas manuales.
- Explorar cómo se relacionan ingresos, educación, productos bancarios y adopción digital con la aceptación.
- Orientar preguntas para futuras investigaciones comerciales y análisis de campañas.

Los resultados pueden servir para priorizar análisis posteriores, pero no sustituyen una evaluación de elegibilidad crediticia ni demuestran que un segmento deba recibir una oferta.

## 9. Estructura del repositorio

```text
Banking-Customer-Intelligence/
│
├── data/
│   └── raw/
│       └── Bank_Personal_Loan_Modelling.csv
│
├── sql/
│   ├── 01_data_exploration.sql
│   ├── 02_data_cleaning.sql
│   └── 03_business_analysis.sql
│
├── powerbi/
│   └── BankingCustomerIntelligence.pbix
│
├── documentacion/
│   ├── data_dictionary.md
│   ├── business_requirements.md
│   ├── data_preparation_sql.md
│   ├── powerbi_model.md
│   ├── dashboard_guide.md
│   ├── insights.md
│   └── limitations.md
│
├── screenshots/
│
└── README.md
```

Los nombres de archivos de esta estructura representan la organización recomendada del repositorio. Conserva los nombres reales que ya tengas en tu carpeta `sql` y guarda el archivo `.pbix` con el nombre que hayas elegido.

## 10. Limitaciones y siguientes pasos

- El dataset es una fotografía de clientes; no contiene fechas ni historial temporal.
- No contiene registros de impresiones, contactos, ofertas enviadas o interacciones de campañas.
- No permite medir conversión por canal, evolución mensual ni efectividad causal de una campaña.
- Los resultados describen asociaciones en la muestra disponible.
- Los 52 valores negativos de `Experience` se trataron como desconocidos (`NULL`), no se eliminaron filas.
- El campo `ZIP Code` se debe tratar como identificador/código, no como medida numérica.

Antes de publicar, revisar formato de gráficos, etiquetas, títulos, sincronización de filtros y consistencia de cifras.

---

**Proyecto de portafolio — Business Intelligence / Customer Analytics**
