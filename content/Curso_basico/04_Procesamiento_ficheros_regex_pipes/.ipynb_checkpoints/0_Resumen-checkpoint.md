# Resumen

El objetivo de este tema es aprender sobre archivos de texto y algunos de los formatos más utilizados en Bioinformática (Fasta, Fastq, BED y PDB), cómo visualizar estos archivos usando diferentes editores de texto (nano, vim y JupyterLab), y el procesamiento de ficheros desde la terminal usando diferentes comandos (grep, sed, cut, sort, uniq y pipes) y expresiones regulares.

0. [Resumen](0_Resumen.md)
1. [Archivos y formatos comunes en Bioinformática](1_Archivos_formatos_comunes_Bioinformatica.md)
2. [Editores de texto](2_Editores_de_texto.md)
3. [Expresiones regulares (regex)](3_Expresiones_regulares.md)
4. [Grep](4_Grep.md)
5. [Sed](5_Sed.md)
6. [Cut Sort](6_Cut_sort.md)
7. [Pipes](7_Pipes.md)
8. [Respuestas ejercicios deber](8_Respuestas_ejercicios.md)

```{admonition} Deber
:class: note
**Entregable:** Un jupyter notebook que contenga las respuestas de todas las preguntas y ejercicios del capítulo. 

Ejercicios:
- [4.4. Caracteres literales](3_Expresiones_regulares.md)
- [4.5. Conjuntos o clases de caracteres](3_Expresiones_regulares.md)
- [4.6. Anclas y límites](3_Expresiones_regulares.md)
- [4.7. Metacaracter de alternancia](3_Expresiones_regulares.md)
- [4.8. Metacaracteres de repetición o cuantificadores](3_Expresiones_regulares.md)
- [4.9. Metacaracteres de agrupamiento](3_Expresiones_regulares.md)
- [5.3. Diferentes versiones de grep](4_Grep.md)
- [5.4. Opciones de la herramienta grep](4_Grep.md)
- [6.3. Opciones de sed](5_Sed.md)
- [6.5. Comando más común de sed: s](5_Sed.md)
- [6.6. Otros comandos de sed comunes](5_Sed.md)
- [6.7. Especificación de posiciones](5_Sed.md)
- [7.3. Opciones de la herramienta cut](6_Cut_sort.md)
- [7.5. Opciones de la herramienta sort](6_Cut_sort.md)
- [8.3. Ejemplos del uso de pipes](7_Pipes.md)
```
## Notas adicionales

```{admonition} Nota importante
:class: note
Ingresa al directorio donde guardas el material del curso si no lo has hecho ya y activa tu ambiente de conda. Si seguiste las instrucciones del capítulo dos de `JuptyterLab` sería `~/taller_unix`. Sigue las instrucciones de abajo si necesitas ayuda.
```
```shell
$ cd ~/taller_unix/
$ conda activate bash
$ jupyter lab
```

Ahora que has accedido a Jupyter Lab crea un notebook para que puedas hacer los ejercicios dentro. **Debes entregar un notebook recopilando todos los ejercicios hechos en este capítulo. Los ejercicios son preguntas y pequeños ejercicios que hay en los diferentes temas, los que han sido marcados con la etiqueta de `Pregunta`**. El notebook debería tener esta ubicación en tu computador: `~/taller_unix/4_ficheros/deber_3.ipynb`. Organiza los ejercicios en diferentes celdas del Jupyter notebook por tema y sub-sección. 


```{admonition} Tip
:class: tip
Aunque el deber se debe entregar en un jupyter notebook, todo esto se puede hacer en Terminal. Te sugiero que hagas los ejercicios primero en Terminal y luego, cuando tengas la seguridad de que los entiendes, los vuelves a hacer desde un jupyter notebook.
```
