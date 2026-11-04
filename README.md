# Traductor Visual — Manual de Ventas

Herramienta interna para traducir bloques HTML del Manual de Ventas (Bitanube/Drupal) de **español a catalán, francés e inglés** de una sola vez, manteniendo intacta la estructura HTML.

Pensada para el flujo de actualización de precios y contenidos B2B de Grandvalira Resorts (Grandvalira, Pal Arinsal y Ordino Arcalís): se hace **una única corrección en español** y la herramienta genera los otros 3 idiomas listos para pegar en el CMS.

## Cómo se usa

1. **Pega el HTML en español** — copia el bloque desde el CMS (código fuente) y pégalo en el cuadro del paso 1. Pulsa **Renderizar y editar**.
2. **Edita visualmente** — el bloque se muestra tal como se verá publicado; puedes corregir cualquier celda o párrafo haciendo clic sobre él.
3. **Auto-traducir** — pulsa **⚡ Auto-traducir CA / FR / EN**. Revisa cada pestaña de idioma y corrige lo que haga falta (la traducción es automática: siempre conviene una revisión).
4. **Generar HTML** — pulsa **⬇ Generar HTML** y copia el código de cada idioma para pegarlo en el CMS.

Si pulsas **Generar HTML** antes de traducir, solo se rellena el español y sale un aviso. Al renderizar otro bloque, los cuadros de resultado se vacían.

> ⚠ **Revisar los enlaces manualmente antes de publicar**: el texto de los enlaces y botones se traduce, pero la URL no cambia ni se adapta al idioma de destino.

## Qué se traduce y qué no

- **Se traduce**: todo el texto visible, también el de los enlaces y botones.
- **Palabras cortas**: los textos de menos de 3 letras solo se traducen si están en la lista `PALABRAS_CORTAS` de `index.html` (*Sí, No, y, o, ni…*). Llevan traducción fija porque, solas, el traductor automático falla (*Sí → Ouais / Yeah*).
- **No se traduce**: códigos y marcas de tabla (*TA, TM, TB, AD, MP, A, B, x, 4h…*), números, y los textos que son una dirección web o un correo.

## Glosario de términos protegidos

La tarjeta **📖 Glosario** define términos que nunca pasan por el traductor automático:

- **Casilla vacía** = el término se deja tal cual en todos los idiomas (marcas y nombres propios: *Grandvalira, Nord Pass, Pas de la Casa…*).
- **Casilla con texto** = se sustituye por esa traducción fija (*forfait → ski pass* en EN, *debutante → débutant* en FR…), con las mayúsculas del original: *Forfait → Ski pass*, *FORFAIT → SKI PASS*.

El glosario oficial no se puede modificar desde la interfaz. Se pueden añadir términos nuevos, pero **no se guardan**: duran hasta recargar la página. Los términos oficiales para todo el equipo se mantienen en la lista `GLOSS_DEFAULTS` dentro de `index.html`: al añadir términos ahí y actualizar el servidor, aparecen automáticamente para todos.

## Instalación / despliegue

Todo el trabajo lo hace `index.html`, sin base de datos ni instalación. Se puede usar de tres formas:

- **Uso local**: descargar `index.html` y abrirlo con doble clic en cualquier navegador moderno (Chrome, Edge, Firefox).
- **Servidor estático**: copiar `index.html` a cualquier carpeta servida como contenido estático.
- **Docker**: `docker compose up -d --build` y abrir `http://localhost:8502`. El contenedor sirve la página con Streamlit (`app.py`) en el puerto 8502 y comprueba su salud en ese mismo puerto. `docker-compose.yml` monta `index.html` y `app.py` como volúmenes: para actualizar, basta con cambiar esos archivos y recargar la página. Si cambia `requirements.txt` o el `Dockerfile`, hay que volver a construir con `--build`.

**Requisito**: conexión a internet durante la auto-traducción (usa el servicio público de Google Translate). La edición y generación de HTML funcionan sin conexión.

## Notas técnicas

- La página no tiene dependencias externas: HTML + CSS + JavaScript puro en un solo archivo. Streamlit solo hace falta para la versión con Docker.
- La traducción usa el endpoint público `translate.googleapis.com` (sin clave API). Si algún texto falla, se deja en español y la pestaña del idioma se marca en rojo para revisarlo a mano.
- Los datos nunca salen del navegador salvo los textos enviados a Google Translate para su traducción.
