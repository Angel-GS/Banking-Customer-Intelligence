# Business Requirements

## Contexto

El proyecto analiza una base de clientes y una variable que registra la aceptación de una oferta de préstamo personal. El propósito es apoyar un análisis descriptivo de clientes y ofrecer una vista interactiva para explorar diferencias entre segmentos.

## Objetivo de negocio

Proporcionar al equipo comercial una herramienta de análisis que permita comprender el nivel general de aceptación e identificar características de clientes asociadas con tasas de aceptación distintas.

## Preguntas de negocio

| ID | Pregunta | Indicador o análisis | Visualización |
|---|---|---|---|
| BR-01 | ¿Cuál es el tamaño de la base analizada? | Total de clientes | KPI |
| BR-02 | ¿Cuántos clientes aceptaron el préstamo? | Préstamos aceptados | KPI |
| BR-03 | ¿Qué proporción aceptó la oferta? | Tasa de aceptación | KPI |
| BR-04 | ¿Cómo se distribuyen los clientes por educación? | Recuento por nivel educativo | Barras |
| BR-05 | ¿Qué segmentos de ingreso muestran mayor aceptación? | Tasa por segmento de ingreso | Barras |
| BR-06 | ¿Cómo difiere el ingreso promedio entre aceptantes y no aceptantes? | Promedio de Income por aceptación | Columnas |
| BR-07 | ¿Se observan diferencias según tenencia de cuenta CD? | Tasa por CD Account | Columnas |
| BR-08 | ¿Se observan diferencias según uso de banca en línea? | Tasa por Online | Barras |
| BR-09 | ¿Cómo varía la aceptación por tamaño familiar? | Tasa por Family | Columnas |

## Usuarios y decisiones que puede apoyar

**Usuarios previstos:** analistas de negocio, analistas BI y equipos comerciales que necesiten explorar perfiles de clientes.

**Decisiones/preguntas que puede apoyar:**
- Qué segmentos merecen un análisis comercial más detallado.
- Qué características conviene investigar en estudios posteriores.
- Cómo cambia la lectura de los indicadores al filtrar por educación, ingresos o adopción digital.
- Qué hipótesis conviene validar con datos de campañas y resultados posteriores.

El dashboard no debe utilizarse por sí solo para aprobar o rechazar créditos, establecer políticas de riesgo ni inferir causalidad.

## Alcance

Incluye:
- Exploración y preparación de datos.
- Métricas descriptivas de aceptación.
- Segmentación por ingresos, educación, cuenta CD, banca en línea y tamaño familiar.
- Visualización e interacción mediante filtros.

No incluye:
- Predicción de aceptación o modelos de machine learning.
- Scoring crediticio o evaluación de riesgo.
- Análisis temporal.
- Medición de efectividad de campañas por canal.
- Recomendaciones automatizadas para decisiones individuales.
