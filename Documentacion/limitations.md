# Limitations and Assumptions

## Limitaciones del dataset

1. **Sin dimensión temporal:** no hay fechas de registro, contacto u oferta. No es posible crear tendencias mensuales o anuales.
2. **Sin detalle de campaña:** no se incluyen canales, impresiones, contactos, costos ni número de ofertas. No se puede medir efectividad de campaña por canal.
3. **Sin causalidad:** los cruces muestran asociaciones y diferencias descriptivas, no relaciones causales.
4. **Sin información de resultado crediticio posterior:** no se puede evaluar morosidad, incumplimiento, rentabilidad ni desempeño del préstamo.
5. **Sin metadatos completos en el CSV:** la unidad exacta y la fuente primaria deben confirmarse con documentación externa antes de atribuir formalmente el dataset a una institución.

## Decisiones de preparación

- Los 52 valores negativos de `Experience` se transformaron en `NULL`. No se imputaron porque no existe evidencia para estimar sus valores reales.
- No se eliminaron clientes por tener `Experience` desconocida.
- `ZIP Code` debe tratarse como texto. No se debe inferir ubicación geográfica detallada a partir de un código sin una fuente de correspondencia confiable.
- Los segmentos de ingresos (≤50, 51–100, >100) son umbrales analíticos definidos para el proyecto.
- Las etiquetas de educación son etiquetas de presentación; se deben confirmar con el diccionario oficial de la fuente si está disponible.

## Riesgos de interpretación

- Una tasa alta en un segmento pequeño puede ser inestable. Por ejemplo, el grupo con cuenta CD contiene 302 clientes.
- Una tasa observada no implica que todos los clientes de ese segmento tengan el mismo perfil o comportamiento.
- Las diferencias entre grupos pueden estar relacionadas con otras variables no controladas en este análisis.

## Mejoras futuras

- Incorporar datos con fechas y eventos de campaña.
- Analizar tasas por canal, región o periodo cuando existan datos válidos.
- Incorporar variables adicionales de comportamiento y desempeño crediticio.
- Validar los patrones con análisis estadístico y muestras adicionales.
- Evaluar calidad, sesgo y uso responsable antes de aplicar los resultados a decisiones sobre clientes individuales.
