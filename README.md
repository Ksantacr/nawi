# Ñawi Theme
## Description

Ñawi is a semiannual scientific research journal of ESPOL (Escuela Superior Politécnica del Litoral) and EDCOM (Escuela de Diseño y Comunicacion Visual) that deals with the study and reflection of Art, Design and Communication linked to the Visual, with special attention to practices in Ecuador and Latin America.

## Installation

1. Download it.

2. Decompress and put it in next path: <br>
`/ojs/plugins/themes/<here>`

3. Each file inside the **slider** folder has a path, replace each file on its respective path. <br>
Run `head -n 2 slider/<file>` to see path.

4. In the file `/lib/pkp/controllers/tab/settings/appearance/form/PKPAppearanceForm.inc.php` search **`getImagesSettingsName()`** function and add :
  ```
  'imgCarousel1' => 'common.imgCarousel1.altText',
  'imgCarousel2' => 'common.imgCarousel2.altText',
  'imgCarousel3' => 'common.imgCarousel3.altText',
  ```
  Should look like this:
  ```
  function getImagesSettingsName() {
      return array(
        'homepageImage' => 'common.homepageImage.altText',
        'pageHeaderLogoImage' => 'common.pageHeaderLogo.altText',
        'favicon' => 'common.favicon.altText',
        'imgCarousel1' => 'common.imgCarousel1.altText',
        'imgCarousel2' => 'common.imgCarousel2.altText',
        'imgCarousel3' => 'common.imgCarousel3.altText',
      );
    }
  ```
5. Select Ñawi theme in the desired journal.

* If Nawi theme doesn't appear, rename it to **nawi**.

## Recomendations

* The size of the images for the slider should be **1000 x 400**.
* The cover image for each volume should be **200 x 300**.

![Ñawi](https://github.com/Ksantacr/nawi/blob/master/colores.gif)

* If you don't want to see unreadable text for example ** ##plugins.importexport.pubIds.displayName## **. Add this lines in the next path: <br>
`/locale/es_ES/locale.xml` after
```<locale name="es_ES" full_name="Español (España)">``` this <br>
```
<message key="plugins.importexport.pubIds.displayName">Módulo XML de identificadores públicos</message>
<message key="plugins.importexport.pubIds.description">Importar y exportar identificadores públicos</message>
```

* Also in the path: <br>
`/locale/es_ES/submission.xml` after
```<locale name="es_ES" full_name="Español (España)">``` this <br>
```

<message key="submission.submit.copyrightNoticeAgreementLabel">Reconocer la declaración de derechos de autor</message>
<message key="submission.submit.submissionLocaleDescription">Se aceptan envíos en varios idiomas. Elija el idioma principal del envío desde el menú desplegable de abajo.</message>
