# Key Findings and Insights

## Resumen de resultados

La base contiene 5,000 clientes. De ellos, 480 aceptaron la oferta de préstamo personal y 4,520 no la aceptaron.

\[
\text{Tasa de aceptación} = \frac{480}{5000} \times 100 = 9.60\%
\]

## 1. Ingresos: principal diferenciador observado

| Segmento | Clientes | Aceptaron | Tasa de aceptación |
|---|---:|---:|---:|
| Ingresos bajos (≤50) | 1,914 | 0 | 0.00% |
| Ingresos medios (51–100) | 1,874 | 42 | 2.24% |
| Ingresos altos (>100) | 1,212 | 438 | 36.14% |
| **Total** | **5,000** | **480** | **9.60%** |

438 de los 480 clientes que aceptaron (91.25%) pertenecen al segmento de ingresos altos.

**Interpretación:** en esta muestra, el ingreso presenta una asociación marcada con la aceptación. El resultado puede orientar segmentaciones exploratorias, pero no demuestra que el ingreso por sí solo cause la aceptación ni debe usarse como regla de elegibilidad.

## 2. Ingreso promedio según aceptación

| Resultado | Ingreso promedio |
|---|---:|
| No aceptó | 66.24 |
| Aceptó | 144.75 |

El ingreso promedio del grupo que aceptó fue aproximadamente 2.18 veces el del grupo que no aceptó.

**Interpretación:** la diferencia refuerza el patrón observado en los segmentos de ingreso. Es una comparación descriptiva entre grupos, no una predicción individual.

## 3. Nivel educativo

| Nivel | Clientes | Aceptaron | Tasa |
|---|---:|---:|---:|
| 1 — Pregrado | 2,096 | 93 | 4.44% |
| 2 — Grado | 1,403 | 182 | 12.97% |
| 3 — Avanzado / Profesional | 1,501 | 205 | 13.66% |

**Interpretación:** los niveles 2 y 3 presentan tasas de aceptación superiores a la del nivel 1. La diferencia entre los niveles 2 y 3 es mucho menor que la diferencia entre estos y el nivel 1.

## 4. Cuenta CD

| Cuenta CD | Clientes | Aceptaron | Tasa |
|---|---:|---:|---:|
| No tiene | 4,698 | 340 | 7.24% |
| Tiene | 302 | 140 | 46.36% |

**Interpretación:** la tasa de aceptación observada entre clientes con cuenta CD es considerablemente mayor. Aunque este grupo representa solo 302 clientes, concentra 140 aceptaciones. La tenencia de una cuenta CD puede ser una variable relevante para investigar relaciones entre vinculación bancaria y aceptación de productos.

No se debe concluir que abrir una cuenta CD produzca mayor aceptación.

## 5. Banca en línea

| Uso de banca en línea | Clientes | Aceptaron | Tasa |
|---|---:|---:|---:|
| No utiliza | 2,016 | 189 | 9.38% |
| Utiliza | 2,984 | 291 | 9.75% |

**Interpretación:** la diferencia es de aproximadamente 0.38 puntos porcentuales. En esta muestra, el uso de banca en línea no muestra una diferencia grande en la aceptación del préstamo.

## 6. Tamaño familiar

| Tamaño familiar | Clientes | Aceptaron | Tasa |
|---:|---:|---:|---:|
| 1 | 1,472 | 107 | 7.27% |
| 2 | 1,296 | 106 | 8.18% |
| 3 | 1,010 | 133 | 13.17% |
| 4 | 1,222 | 134 | 10.97% |

**Interpretación:** los grupos familiares de tres y cuatro integrantes presentan tasas superiores a los grupos de uno y dos integrantes. Este patrón es descriptivo y debería contrastarse con otras variables antes de extraer conclusiones comerciales.

## 7. Otras variables de productos financieros

Las tasas observadas por `Securities Account` fueron aproximadamente 11.49% para quienes tenían cuenta y 9.38% para quienes no la tenían. Para `CreditCard`, las tasas fueron aproximadamente 9.73% entre titulares y 9.55% entre quienes no tenían esa tarjeta.

Estas diferencias son más pequeñas que las observadas para ingresos y cuenta CD.

## Conclusiones para el análisis comercial

1. El ingreso es una de las variables más claramente asociadas con la aceptación en este conjunto de datos.
2. La tenencia de cuenta CD también presenta una diferencia notable y merece análisis adicional.
3. Educación y tamaño familiar muestran patrones diferenciados que pueden servir para formular hipótesis.
4. El uso de banca en línea presenta una diferencia pequeña, por lo que no debe tratarse como un factor diferenciador fuerte con esta evidencia.
5. El dashboard facilita comparar estas tasas por medio de filtros, en lugar de depender de una única cifra agregada.

## Precaución de interpretación

Los resultados describen asociaciones en una base de clientes. No se dispone de fechas, detalle de contactos de campaña, canal de oferta, razones de aceptación/rechazo ni variables suficientes para establecer causalidad. No se puede afirmar que estas características causaron la aceptación.
