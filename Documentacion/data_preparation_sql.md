# Data Preparation and SQL Analysis

## Entorno

- Motor: SQL Server 2022.
- Herramienta: SQL Server Management Studio (SSMS).
- Base de datos: `BankingCustomerIntelligence`.
- Tabla de origen: `dbo.BankLoan_Raw`.
- Tabla preparada: `dbo.BankLoan_Clean`.

## Flujo de datos

```text
Bank_Personal_Loan_Modelling.csv
              |
              v
     dbo.BankLoan_Raw
       (tabla original)
              |
              v
     Exploración de datos
              |
              v
     Limpieza de Experience
              |
              v
     dbo.BankLoan_Clean
       (tabla preparada)
              |
              v
        Power BI
```

## 1. Importación y conservación del origen

El CSV se importó a SQL Server como `dbo.BankLoan_Raw`. Esta tabla conserva los valores originales y permite comparar los datos antes y después de la preparación.

## 2. Exploración inicial

La exploración se enfocó en:
- Número de registros y campos.
- Valores nulos y duplicados.
- Distribución de la variable objetivo `Personal Loan`.
- Rangos y valores anómalos en variables numéricas.
- Comparación de aceptación por segmentos.

Resultados de la revisión inicial:
- 5,000 registros.
- 14 campos.
- 0 valores nulos.
- 0 filas duplicadas.
- 52 valores negativos en `Experience`.

## 3. Limpieza de datos

Se creó `dbo.BankLoan_Clean` a partir de la tabla original mediante una operación `SELECT INTO`. La lógica de limpieza reemplaza los valores negativos de `Experience` por `NULL`.

Lógica conceptual aplicada:

```sql
CASE
    WHEN Experience < 0 THEN NULL
    ELSE Experience
END AS Experience
```

**Justificación:** los años de experiencia laboral no deberían ser negativos. Como no hay información que permita determinar el valor correcto de esos 52 registros, se marcaron como desconocidos en lugar de inventar un valor o eliminar clientes.

Después de la limpieza:
- Se conservaron los 5,000 registros.
- Los 52 valores negativos de `Experience` pasaron a `NULL`.
- No se eliminaron filas.
- La tabla original se mantuvo sin modificar.

También se revisaron rangos de `Age`, `Income`, `CCAvg` y `Mortgage`; no se encontraron valores no positivos/anómalos según las validaciones realizadas para esas columnas.

## 4. Análisis de negocio

Las consultas de análisis se centraron en:
- Total de clientes y aceptación.
- Ingreso promedio por aceptación.
- Aceptación por uso de banca en línea.
- Aceptación por educación.
- Aceptación por segmento de ingresos.

Los segmentos de ingresos se definieron así:
- Bajo: `Income` ≤ 50.
- Medio: 50 < `Income` ≤ 100.
- Alto: `Income` > 100.

## 5. Tabla utilizada por Power BI

Power BI se conectó a `dbo.BankLoan_Clean`, no a la tabla original. Esto permite que el dashboard trabaje sobre los datos preparados y conserva el origen para trazabilidad.

## 6. Archivos SQL del repositorio

La estructura prevista contempla:
- `01_data_exploration.sql`: consultas para conocer estructura, calidad y distribución.
- `02_data_cleaning.sql`: creación de la tabla preparada.
- `03_business_analysis.sql`: consultas para responder preguntas de negocio.

Conserva en el repositorio los nombres reales de los scripts si difieren de los indicados aquí. La documentación describe el flujo realizado; las consultas ejecutables deben permanecer en los archivos `.sql`.
