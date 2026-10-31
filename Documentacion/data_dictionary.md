# Data Dictionary

## Descripción del conjunto de datos

Archivo: `Bank_Personal_Loan_Modelling.csv`

El archivo contiene 5,000 registros de clientes y 14 variables. La variable objetivo es `Personal Loan`, que indica si el cliente aceptó (1) o no aceptó (0) la oferta de préstamo personal representada en el dataset.

El archivo no contiene metadatos suficientes para verificar por sí solo la procedencia original, la fecha de captura o la moneda/unidad exacta de todas las variables. En las descripciones de `Income`, `CCAvg` y `Mortgage` se conserva la interpretación habitual de este dataset: valores monetarios expresados en miles. Conviene confirmar la unidad y la fuente original si se incorpora una referencia externa al repositorio.

## Diccionario de campos originales

| Campo | Tipo original | Descripción | Uso en el análisis |
|---|---|---|---|
| `ID` | Entero | Identificador único del cliente. | Recuento de clientes y referencia de registro; no es una variable explicativa. |
| `Age` | Entero | Edad del cliente en años. | Caracterización demográfica. |
| `Experience` | Entero | Años de experiencia laboral reportados. | Caracterización del cliente; 52 valores negativos se trataron como desconocidos. |
| `Income` | Entero | Ingreso anual del cliente; en la versión habitual del dataset se expresa en miles. | Segmentación de ingresos y comparación de ingreso promedio. |
| `ZIP Code` | Entero en el CSV | Código postal asociado al cliente. | Identificador geográfico; debe tratarse como texto y no como cantidad. |
| `Family` | Entero | Tamaño del grupo familiar, de 1 a 4. | Segmentación por tamaño familiar. |
| `CCAvg` | Decimal | Promedio de gasto mensual en tarjeta de crédito; habitualmente expresado en miles. | Caracterización financiera. |
| `Education` | Entero | Nivel educativo codificado como 1, 2 o 3. | Segmentación por educación. |
| `Mortgage` | Entero | Valor de hipoteca reportado; habitualmente expresado en miles. | Caracterización financiera. |
| `Personal Loan` | Binario (0/1) | Indica si el cliente aceptó la oferta de préstamo personal. | Variable objetivo principal. |
| `Securities Account` | Binario (0/1) | Indica si el cliente tiene una cuenta de valores/inversión. | Característica de productos financieros. |
| `CD Account` | Binario (0/1) | Indica si el cliente tiene una cuenta de depósito a plazo (CD). | Comparación de aceptación según producto existente. |
| `Online` | Binario (0/1) | Indica si el cliente utiliza banca en línea. | Análisis de adopción digital. |
| `CreditCard` | Binario (0/1) | Indica si el cliente tiene una tarjeta de crédito emitida por la entidad del escenario. | Característica de producto financiero. |

## Codificación de variables

### Educación

| Código | Etiqueta utilizada |
|---:|---|
| 1 | Pregrado |
| 2 | Grado |
| 3 | Avanzado / Profesional |

Estas etiquetas se utilizan como nombres de presentación para facilitar la lectura del dashboard. Si la documentación oficial de la fuente original define los niveles con nombres distintos, se deben ajustar las etiquetas.

### Variables binarias

| Valor | Interpretación |
|---:|---|
| 0 | No / False |
| 1 | Sí / True |

Aplica a `Personal Loan`, `Securities Account`, `CD Account`, `Online` y `CreditCard`.

### Segmentación de ingresos creada para el análisis

| Condición | Segmento |
|---|---|
| `Income` ≤ 50 | Ingresos bajos |
| 50 < `Income` ≤ 100 | Ingresos medios |
| `Income` > 100 | Ingresos altos |

Los umbrales son reglas analíticas definidas para este proyecto, no categorías oficiales del dataset.

## Consideraciones de calidad

- El CSV original contiene 5,000 filas y 14 columnas.
- No se detectaron valores nulos ni filas duplicadas en la revisión inicial.
- Se encontraron 52 valores negativos en `Experience`; se marcaron como `NULL` en la tabla limpia porque no representan años de experiencia válidos.
- `ZIP Code` aparece como entero en el CSV. Se recomienda convertirlo a texto en el modelo para evitar agregaciones numéricas y preservar su naturaleza de código. Si el archivo ya perdió ceros iniciales, no se deben inventar ni reconstruir sin una fuente confiable.
