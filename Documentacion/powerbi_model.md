# Power BI Data Model

## Fuente de datos

- Servidor: instancia local de SQL Server utilizada durante el desarrollo.
- Base de datos: `BankingCustomerIntelligence`.
- Tabla importada: `dbo.BankLoan_Clean`.
- Modo de conexión: Import (según la configuración utilizada durante la construcción).

La tabla `dbo.BankLoan_Raw` no se utiliza directamente en las visualizaciones.

## Tipos de datos

Recomendaciones aplicadas/revisadas:
- `ID`: entero.
- `Age`, `Experience`, `Income`, `Family`, `Education`, `Mortgage`: enteros.
- `CCAvg`: decimal.
- `ZIP Code`: texto, por tratarse de un código.
- Variables binarias: booleano o entero binario, según la importación. En el modelo actual, las columnas binarias se manejan como True/False.

## Medidas DAX

Se crearon tres medidas principales para evitar duplicar cálculos en diferentes visualizaciones.

### 1. Total de clientes

```dax
Total de clientes =
COUNTROWS(BankLoan_Clean)
```

**Por qué:** cuenta los registros de clientes dentro del contexto de filtros actual. Se utiliza como KPI y como denominador de la tasa de aceptación.

### 2. Préstamos aceptados

```dax
Préstamos aceptados =
CALCULATE(
    COUNTROWS(BankLoan_Clean),
    BankLoan_Clean[Personal_Loan] = TRUE()
)
```

**Por qué:** cuenta los registros cuyo valor de `Personal_Loan` es verdadero. Permite mostrar el volumen de aceptación.

### 3. Tasa de aceptación

```dax
Tasa de aceptación =
DIVIDE(
    [Préstamos aceptados],
    [Total de clientes],
    0
)
```

**Por qué:** calcula la proporción de clientes que aceptaron el préstamo respecto al total del segmento visible. `DIVIDE` permite controlar el caso de denominador cero.

Formato recomendado: porcentaje con dos decimales.

## Columnas calculadas de clasificación

### Segmento de ingresos

```dax
Segmento de ingresos =
SWITCH(
    TRUE(),
    BankLoan_Clean[Income] <= 50, "Ingresos bajos",
    BankLoan_Clean[Income] <= 100, "Ingresos medios",
    "Ingresos altos"
)
```

**Por qué:** convierte el ingreso numérico en tres grupos comparables y facilita el análisis de aceptación por segmento.

### Nivel educativo

```dax
Nivel educativo =
SWITCH(
    BankLoan_Clean[Education],
    1, "Pregrado",
    2, "Grado",
    3, "Avanzado / Profesional",
    "Sin clasificar"
)
```

**Por qué:** sustituye los códigos numéricos por etiquetas legibles en el dashboard. Las etiquetas son una interpretación de presentación y deben alinearse con la definición oficial del dataset si se obtiene.

## Agregaciones utilizadas directamente en visuales

No se crearon medidas adicionales para cada gráfico:
- Recuento de `ID` para contar clientes por categoría.
- Promedio de `Income` para comparar ingresos promedio.
- La medida `[Tasa de aceptación]` para calcular tasas por categoría según el contexto del visual.

## Interacción y filtros

Segmentadores previstos:
- `Segmento de ingresos`.
- `Nivel educativo`.
- `Online` (uso de banca en línea).

Se recomienda sincronizar los segmentadores entre las dos páginas desde **Vista → Sincronización de segmentadores**, y revisar las interacciones para confirmar que afectan los gráficos deseados.

## Formato

Paleta de color:
- `#123A63`
- `#245f99`
- `#4f86b5`
- `#82add0`
- `#b9d5ea`

Diseño consistente en ambas páginas:
- Navegación vertical a la izquierda.
- Título y subtítulo en la parte superior.
- Tres KPI en la página ejecutiva.
- Gráficos en el área principal.
- Filtros en la barra lateral, si se conserva espacio suficiente.
