# Traductor Visual — Manual de Ventas

Herramienta interna para traducir bloques HTML del Manual de Ventas (Bitanube/Drupal) de **español a catalán, francés e inglés** de una sola vez, manteniendo intacta la estructura HTML.

Pensada para el flujo de actualización de precios y contenidos B2B de Grandvalira Resorts (Grandvalira, Pal Arinsal y Ordino Arcalís): se hace **una única corrección en español** y la herramienta genera los otros 3 idiomas listos para pegar en el CMS.

## Cómo se usa

1. **Pega el HTML en español** — copia el bloque desde el CMS (código fuente) y pégalo en el cuadro del paso 1. Pulsa **Renderizar y editar**.
2. **Edita visualmente** — el bloque se muestra tal como se verá publicado; puedes corregir cualquier celda o párrafo haciendo clic sobre él.
3. **Auto-traducir** — pulsa **⚡ Auto-traducir CA / FR / EN**. Revisa cada pestaña de idioma y corrige lo que haga falta (la traducción es automática: siempre conviene una revisión).
4. **Generar HTML** — pulsa **⬇ Generar HTML** y copia el código de cada idioma para pegarlo en el CMS.

> ⚠ **Revisar los enlaces manualmente antes de publicar**: los enlaces no se traducen ni se adaptan al idioma de destino.

## Glosario de términos protegidos

La tarjeta **📖 Glosario** define términos que nunca pasan por el traductor automático:

- **Casilla vacía** = el término se deja tal cual en todos los idiomas (marcas y nombres propios: *Grandvalira, Nord Pass, Pas de la Casa…*).
- **Casilla con texto** = se sustituye por esa traducción fija (*forfait → ski pass* en EN, *debutante → débutant* en FR…).

Los cambios hechos desde la interfaz se guardan **solo en el navegador de cada usuario** (localStorage). Los términos oficiales para todo el equipo se mantienen en la lista `GLOSS_DEFAULTS` dentro de `index.html`: al añadir términos ahí y actualizar el servidor, aparecen automáticamente para todos sin borrar los ajustes personales de nadie.

## Instalación / despliegue

No necesita servidor de aplicaciones, base de datos ni instalación: es un único archivo estático.

- **Uso local**: descargar `index.html` y abrirlo con doble clic en cualquier navegador moderno (Chrome, Edge, Firefox).
- **Servidor**: copiar `index.html` a cualquier carpeta servida como contenido estático.

**Requisito**: conexión a internet durante la auto-traducción (usa el servicio público de Google Translate). La edición y generación de HTML funcionan sin conexión.

## Notas técnicas

- Sin dependencias externas: HTML + CSS + JavaScript puro en un solo archivo.
- La traducción usa el endpoint público `translate.googleapis.com` (sin clave API). Si algún texto falla, se deja en español y la pestaña del idioma se marca en rojo para revisarlo a mano.
- Los datos nunca salen del navegador salvo los textos enviados a Google Translate para su traducción.
