# Resumen

El objetivo de este tema es aplicar los conocimientos de las anteriores secciones en ejercicios con un enfoque en Bioinformática. En general, usaremos las herramientas que aprendimos en el tema de [procesamiento de ficheros, regex y pipes](https://rsg-ecuador.github.io/unix.bioinfo.rsgecuador/content/04_Procesamiento_ficheros_regex_pipes/0_Resumen.html). Sin embargo, para resolver estos ejercicios se necesita que hayan realizado las tareas entendido los temas de [Introducción a Unix y GNU/Linux](https://rsg-ecuador.github.io/unix.bioinfo.rsgecuador/content/01_Unix_GNU-Linux/0_Resumen.html), [Jupyter Lab](https://rsg-ecuador.github.io/unix.bioinfo.rsgecuador/content/02_JupyterLab/0_Resumen.html), y [Manejo terminal](https://rsg-ecuador.github.io/unix.bioinfo.rsgecuador/content/03_Manejo_terminal/0_Resumen.html).

0. [Resumen](0_Resumen.md)
1. [Preprocesamiento de archivo PDB antes de realizar dinámica molecular](1_Preprocesamiento_pdb.md)
2. [Búsqueda de motivos en archivo fasta de una secuencia de nucleótidos](2_Motivos_fasta.md)
3. [Extracción de información de archivo multifasta de genomas](3_Info_multifasta_genomas.md)
4. [Extracción de información de archivo multifasta de secuencias de aminoácidos (proteoma)](4_Info_multifasta_proteoma.md)
5. [Extracción de información de archivos fastq](5_Info_fastq.md)
6. [Extracción de información de archivo de experimento de microarray](6_Info_microarray.md)
7. [Búsqueda de sitios de restricción en archivos fasta de secuencias de nucleótidos](7_Sitios_restric.md)
8. [Respuestas ejercicios deber](8_Respuestas_ejercicios.md)

```{admonition} Deber
:class: note
**Entregable:** Un jupyter notebook que contenga las respuestas de todas las preguntas y ejercicios del capítulo. 

Ejercicios:
Cada una de las secciones de este capítulo se compone de preguntas y ejercicios que se deben realizar usando el notebook de 
referencia. 

Para acceder al notebook de referencia el primer paso será descargar el repositorio de GitHub del curso, que lo pueden encontrar en el siguiente [link](https://github.com/RSG-Ecuador/unix.bioinfo.rsgecuador). Después, deben abrir una terminal y moverse a la carpeta en la que está el archivo del notebook, como se muestra a continuación: 

cd ~/Downloads/unix.bioinfo.rsgecuador-gh-pages/Ejercicios_fines_de_semana/Curso_basico

Después, deben activar el ambiente de conda en el que instalaron Jupyter-Lab con kernel de Bash, e iniciar un servidor de Jupyter-Lab, como se muestra a continuación: 

conda activate bash 
jupyter-lab

Finalmente, deben abrir el notebook que tiene el nombre `Fin_de_semana1.ipynb` y deben completar las respuestas de los ejercicios en las secciones correspondientes. 

Es importante que corran la primera celda de códgio del notebook para moverse al directorio `_files` con el comando `cd`, como se muestra a continuación: 

cd ../../_files

**Nota:** Para todos los ejercicios asumimos que están trabajando dentro del directorio `_files`, por lo que comprueben que esto se cumpla siempre que corran un comando. 

Cuando tengas tu notebook listo con todas las respuestas haz una copia de este documento en la carpeta correspondiente, que en este caso sería: `~/taller_unix/5_ejercicios_ficheros/deber_4.ipynb`  **Debes entregar el notebok de referencia con todos los ejercicios completos**
```

## Recursos adicionales con más ejercicios
* <https://bioinformatics.cvr.ac.uk/short-command-lines-for-manipulation-fastq-and-fasta-sequence-files/>
* <http://people.duke.edu/~ccc14/duke-hts-2018/cliburn/Bash_in_Jupyter.html#1.-Working-with-FASTA-files>
* <https://tobyhodges.gitbooks.io/introduction-to-regular-expressions/content/>
* <https://vinuesa.github.io/intro2linux/index.html>
* <https://github.com/stephenturner/oneliners>