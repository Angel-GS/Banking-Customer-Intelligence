# Dashboard Guide

## Diseño general

El informe contiene dos páginas en español. Ambas comparten:
- Lienzo 16:9.
- Barra lateral izquierda para navegación.
- Encabezado superior.
- Paleta azul institucional definida para el proyecto.
- Segmentadores para explorar subconjuntos de clientes.

## Página 1 — Resumen ejecutivo

**Objetivo:** presentar una visión rápida del tamaño de la base y del comportamiento general de aceptación.

### Indicadores KPI

| KPI | Medida | Valor de referencia |
|---|---|---:|
| Total de clientes | `[Total de clientes]` | 5,000 |
| Préstamos aceptados | `[Préstamos aceptados]` | 480 |
| Tasa de aceptación | `[Tasa de aceptación]` | 9.60% |

### Visualizaciones

1. **Tasa de aceptación por segmento de ingresos**  
   Categoría: `Segmento de ingresos`. Valor: `[Tasa de aceptación]`.

2. **Clientes por nivel educativo**  
   Categoría: `Nivel educativo`. Valor: recuento de `ID`.

3. **Distribución de aceptación de préstamos**  
   Categoría: `Personal_Loan`. Valor: recuento de `ID`. Presentar las categorías como aceptó/no aceptó si se dispone de etiquetas legibles.

## Página 2 — Segmentación y oportunidades

**Objetivo:** profundizar en las diferencias entre perfiles de clientes.

1. **Ingreso promedio según aceptación**  
   Categoría: `Personal_Loan`. Valor: promedio de `Income`.

2. **Tasa de aceptación según cuenta CD**  
   Categoría: `CD Account`. Valor: `[Tasa de aceptación]`.

3. **Tasa de aceptación según banca en línea**  
   Categoría: `Online`. Valor: `[Tasa de aceptación]`.

4. **Tasa de aceptación según tamaño familiar**  
   Categoría: `Family`. Valor: `[Tasa de aceptación]`.

## Segmentadores

- Segmento de ingresos.
- Nivel educativo.
- Uso de banca en línea.

Cuando se sincronizan, los filtros mantienen el contexto al cambiar de página. Conviene probar cada segmentador y confirmar que todos los visuales relevantes reaccionan correctamente.

## Recomendaciones de revisión antes de publicar

- Verificar que los títulos describan exactamente el indicador mostrado.
- Usar porcentaje con dos decimales para tasas.
- Mostrar promedios con unidades y decimales consistentes.
- Evitar ejes truncados que exageren diferencias.
- Confirmar etiquetas para categorías booleanas.
- Alinear visuales y mantener espacios uniformes.
- Revisar que los filtros no oculten información importante.
- Confirmar que los totales vuelvan a 5,000 clientes y 480 aceptaciones al quitar filtros.
