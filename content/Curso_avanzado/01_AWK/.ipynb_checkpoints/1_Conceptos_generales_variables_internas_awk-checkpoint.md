# Conceptos generales, instalación y variables internas AWK

En esta parte estudiaremos la parte introductoria del lenguaje de programación AWK, y presentamos algunos ejemplos sencillos con enfoque en Bioinformática. 

```{admonition} Advertencia
:class: warning
En este tutorial usaremos la herramienta *gawk*, que viene instalada por defecto en la mayoría de distribuciones de GNU/Linux. Puede que algunos de los comandos usados con esta herramienta no sean compatibles con otras versiones del programa usadas en MacOS, por lo que les recomendamos instalar *gawk* usando el gestor de paquetes *brew*, cuyas indicaciones de instalación se encuentran en el siguiente [link](https://formulae.brew.sh/formula/gawk).
```

## Archivos para este tutorial
En este tutorial usaremos algunos de los archivos que se encuentran en la carpeta `_files` dentro del directorio raíz del [repositorio de Github](https://github.com/RSG-Ecuador/unix.bioinfo.rsgecuador), por lo que si no poseen este directorio, descarguen el repositorio de GitHub y copien la carpeta `_files` a su directorio de trabajo. En todos los ejercicios asumiremos que están trabajando dentro de la carpeta `_files`, por lo que no usamos ningún path relativo para trabajar con los archivos.

## ¿Qué es AWK?
AWK es un lenguaje de programación diseñado para procesamiento de archivos de texto que fue implementado por primera vez en el SO UNIX. Se debe considerar que *awk* es el programa de UNIX que permite correr scripts escritos en AWK, o en oras palabras AWK es un lenguaje interpretado por el intérprete *awk*.

Se debe considerar que *awk* fue implementado en GNU/Linux con el nombre de *gawk*, del que actualmente hay mucha [documentación](https://www.gnu.org/software/gawk/manual/gawk.html).

## Instalación gawk
Para verificar si poseen *gawk* en su SO deben abrir una terminal y escribir:

```shell
$ gawk --version
```

En caso de que no tengan esta herramienta, deben instalarla usando el gestor de paquetes apt para los usuarios de GNU/Linux, de la siguiente manera:

```shell
$ sudo apt install gawk
```

Los usarios de MacOS deben usar el gestor brew, como se muestra a continuación: 

```shell
$ brew install gawk
```

## Elementos y esructura del comando gawk

El intérprete *gawk* necesita dos elementos:
1. Una o más opciones (no es obligatorio)
2. Script de AWK o archivo con script de AWK.
3. Uno o más archivos de entrada.

Las principales opciones de *gawk* son las siguientes:

| **Opción** | **Descripción** |
|:---:|:---:|
|`-F` o `--field-separator`|Sirve para especificar un separador de campos. Funciona igual que la variable interna `FS` que se revisa más adelante|
| `-f` o `--file`|Se usa para especificar un archivo que contiene un script de AWK|
| `-v` o `--assign` |Sirve para declarar una variable|  
| `-h` o `--help` |Imprime un mensaje de uso que resume las opciones que acepta *gawk*|  


La estructura del comando sería de la siguiente forma:

```shell
$ gawk -[opción] ‘script_AWK’ archivo1 archivo2 …
```

Para encadenar otro programa de GNU/Linux con *awk* se emplea lo siguiente sintaxis:

```shell
$ programa_GNU/Linux | gawk -[opción] ‘script_AWK’ archivo1 archivo2 …
```

## Variables internas de archivos y registros  

El nombre del archivo que se procesa por *gawk* se guarda en la variable interna (vi) `FILENAME`. Además, este lenguaje procesa los archivos usando elementos llamados **registros** o **filas**, que siguen las instrucciones del script de AWK de forma independiente. Para identificar los **registros** dentro del archivo se usa un **separador de registros**, que se almacena en la vi `RS`. Por defecto, los **registros** se separan por saltos de línea (RS = "\n"), pero esto se puede cambiar. Además, para almacenar el **número de registros en procesamiento y procesados** se emplean las vi `FNR` y `NR` respectivamente. 

```{admonition} Tip
:class: tip
En los archivos multifasta el separador de registros sería el caracter `>`, que se encuentra al inicio de los headers de todas las secuencias; mientras que en los archivos PDB se puede usar el string `ATOM`, que se encuentra al inicio de todas las líneas que tienen información de los átomos de la biomolécula. 
```

Para mostrar el funcionamiento de *gawk* y algunas de sus vi, realizaremos un ejemplo con el archivo multifasta `sul_genomas.fasta`:

```bash
$ gawk '{print FILENAME, FNR, NR}' sul_genomas.fasta
```

En la siguiente captura se observa la parte final del resultado de este comando: 

```{image} ./img/awk1.png
:alt: ./img/awk1.png
:width: 650px
:align: center
```
Como se observa, en cada línea se imprimió el nombre del archivo, seguido del número de línea dos veces. Esto se debe a que se usó el separador de registros por defecto (salto de línea) y a que las vi `FNR` y `NR` fueron iguales en todos los casos. 

Ahora, si queremos que los registros sean las secuencias y no todas las líneas del archivo, podemos especificar que el separador de registros sea el caracter `>` en el script de AWK de la siguiente forma: 

```bash
$ gawk '{RS= ">"} {print FILENAME, FNR, NR}' sul_genomas.fasta
```

Ahora, apliquemos el script de AWK anterior a los archivos multifasta `sul_genomas.fasta` y `S_clavuligerus_proteome.fasta`: 

```bash
$ gawk '{RS= ">"} {print FILENAME, FNR, NR}' sul_genomas.fasta S_clavuligerus_proteome.fasta
```

```{admonition} Pregunta
:class: hint
¿Son iguales los valores `FNR` y `NR` en todas las líneas en este caso?. Con este análisis ya podrías deducir de forma adecuada la diferencia entre estas dos vi.
```

## Variables internas de campos 

Además, cada **registro** procesado por *gawk* se divide en **campos** separados por espacios, tabuladores o saltos de línea. El **separador de campo** se almacena en la vi `FS`. Por defecto, el separador de campo es un espacio (FS = " "). Cada campo del registro se guarda en variables internas entre `$1` y `$n`; mientras que el contenido completo del registro se almacena en `$0`, y el **número total de campos** en la vi `NF`. 

Con los siguientes ejemplos se explican mejor estos conceptos: 

```bash
$ echo -e  " campo1  campo2\tcampo3,-#%...  " | gawk '{print NF, "["$1"]", "["$2"]"}'
$ echo -e  " campo1  campo2\tcampo3,-#%...  " | gawk '{print NF, "["$3"]", "["$1"]"}'
$ echo -e  " campo1  campo2\tcampo3,-#%...  " | gawk '{print NF, "["$0"]"}'
$ echo -e  " campo1  campo2\tcampo3,-#%...  " | gawk '{print NF, $NF}'
```

```{admonition} Pregunta
:class: hint
¿Porqué al poner $NF se imprime el campo 3?
```

Algunos puntos importantes que se deben considerar sobre estos ejercicios son los siguientes: 

1. Múltiples espacios en blanco (incluyendo tabuladores) separando campos de texto se ignoran, colapsándose, por lo que NF vale 3.
2. Por lo explicado en 1, las variables `$1-$n` sólo llevan el valor del campo delimitado por los espacios, como muestran las salidas de las líneas 1 a 3.
3. En cambio, la variable `$0`, que lleva un registro completo, imprime los separadores de campo del mismo, como muestra la línea 4 de la salida mostrada arriba.
4.Print imprime los argumentos que se le pasan separados por comas, dejando por defecto un espacio sencillo entre ellos (OFS=" ").

## Resumen de las variables internas de AWK más comunes

|**Variable interna**| **Descripción**|
|:---:|:---:|
|`$0`|Guarda el valor del registro completo actual de un archivo de entrada|
|`$1-$n`|Guarda los contenidos de los campos de un registro|
|`NF` (Number or Records)|Guarda el número total de campos|
|`ARGC`|Guarda el número de argumentos (+1) pasados al comando desde la terminal, después del script|
|`ARGV`|Guarda los argumentos pasados al comando desde la terminal, después del script. ARGV[0] contiene gawk|
|`FILENAME`|Nombre del archivo de entrada actualmente en procesamiento|
|`FS` (Field Separator)|Separador de campos (por defecto SPACE or TAB)|
|`FNR` (Number or Records)|Guarda el número de registros en procesamiento|
|`NR` (Number or Records)|Guarda el número de registros procesados|
|`OFS` (Output Field Separator)|Separador de campo de la salida (SPACE por defecto)|
|`ORS` (Output Return Separator)|Separador de registro de la salida (\n por defecto)|

## Material suplementario

La mayoría de los contenidos de esta parte se obtuvieron de la documentación oficial de *GNU*, que pueden acceder con el siguiente [link](https://www.gnu.org/software/gawk/manual/gawk.html) y del manual del Curso avanzado de programación AWK y Bash para bioinformática y biocómputo en sistemas GNU/Linux del profesor Pablo Vinuesa de la UNAM, que pueden encontrar en este [link](https://vinuesa.github.io/intro2linux/index.html).