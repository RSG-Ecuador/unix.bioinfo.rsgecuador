# Sed
En esta parte del curso estudiaremos la herramienta sed. Al igual que las partes de grep y regex, este tutorial tiene un enfoque general, sin aplicaciones en Bioinformática (lo que veremos más adelante). 

```{admonition} Nota importante
:class: note
En la mayoría de secciones existen preguntas y pequeños ejercicios, maracados con la etiqueta `Pregunta`, cuyas respuestas deben ser realizadas como deber de esta parte del curso. Debes guardar las respuestas en el **Jupuyer notebook** que debes entrengar en este capítulo y correr los comandos en las preguntas que esto sea posible.
```

Luego de la fecha de entrega del deber enviaremos las respuestas a los ejercicios de todas las secciones. 

```{admonition} Advertencia
:class: warning
En este tutorial usaremos la herramienta *GNU sed*, que viene instalada por defecto en la mayoría de distribuciones de GNU/Linux. Puede que algunos de los comandos usados con esta herramienta no sean compatibles con otras versiones del programa usadas en MacOS, por lo que les recomendamos instalar *GNU sed*. En este [blog](https://stackoverflow.com/questions/30003570/how-to-use-gnu-sed-on-mac-os-10-10-brew-install-default-names-no-longer-su) se discute este tema. 
```

<div id="seccion4_5_0"/>

## Archivo para este tutorial
En este tutorial usaremos un archivo que tiene la versión completa de la canción *Contrapunto para Humano y Computadora* de la banda *El Cuarteto de Nos*. 

```{admonition} Nota
:class: note
Este documento se encuentra en la carpeta `_files` dentro del directorio raíz del repositorio de Github, y tiene el nombre `Contrapunto_para_Humano_y_Computadora_Cuarteto_de_Nos.txt`. 
```

<div id="seccion4_5_1"/>

## ¿Qué es sed?
Sed es un editor de flujos de datos (*streams*) que permite filtrar y transformar texto de flujos de entrada, que pueden ser archivos o [*stdin*](https://www.computerhope.com/jargon/s/stdin.htm) derivados de *piping* (que veremos en detalle en la siguiente sección), lo que lo distingue de otros tipos de editores de texto de CLI o GUI. 

La sintaxis general de esta herramienta es de la siguiente forma: 

``` bash
sed [-opcion(es)...] [script] [archivo(s)]
```

```{admonition} Nota
:class: note
Si no se provee ningún archivo de entrada se busca en los contenidos del [*(stdin)*](https://www.computerhope.com/jargon/s/stdin.htm). El *script* es el primer parámetro que no es una opción, que *sed* considera como tal si ninguna de las otras opciones especifica que se ejecute un script (si no se especifican las opciones `-e` ni `-f`). 
```

<div id="seccion4_5_2"/>

## Opciones de sed

<div id="seccion4_5_2_1"/>

### Información general del programa: `--version, --help`
El comando `--version` se usa para imprimir en la terminal el número y algunas características de la versión de sed instalada en el SO; mientras que `--help` sirve para imrpimir información general del uso y las opciones de sed. 

```{admonition} Pregunta
:class: hint
**¿Cuál versión de sed tienes en tu SO?**
```

<div id="seccion4_5_2_2"/>

### Resumen de opciones más comunes: `-e, -f, -i, -n, -r`
Las opciones más comunes de GNU sed son las siguientes: 

| **Opción** | **Descripción** |
|:---:|:---:|
|`-e SCRIPT` o `---expression=SCRIPT` | Agregar los comandos en SCRIPT al conjunto de comandos que se ejecutarán mientras se procesa la entrada |
|`-f SCRIPTFILE` o `--file=SCRIPTFILE` |Agregar los comandos contenidos en el archivo SCRIPTFILE al conjunto de comandos que se ejecutarán mientras se procesa la entrada |
|`-i[SUFFIX]` o `--in-place[=SUFFIX]` | Esta opción especifica que los archivos deben editarse in situ. Sed hace esto creando un archivo temporal y enviando la salida a este archivo en lugar de al *stdout*. Si se proporciona un SUFFIX, se crea un nombre de archivo con esta extensión como respaldo |
| `-n` o `--quiet` | De forma predeterminada, sed imprime el espacio del patrón al final de cada ciclo a través del script. Esto deshabilita la impresión automática, y sed solo produce salida cuando se le indica explícitamente a través del comando p |
| `-r` o `--regexp-extended` | Se usan expresiones regulares extendidas en lugar de expresiones regulares básicas |

```{admonition} Tip
:class: tip
Hay otras opciones de esta herramienta, que pueden revisar con detalle en el [link](https://www.gnu.org/software/sed/manual/sed.html#sed-scripts) de la documentación oficial de *GNU sed*. 
```

<div id="seccion4_5_3"/>

## Estructura y funcionamiento del script de sed
Todos los comandos de *sed* tienen la siguiente estructura básica: 

``` bash
[ADDR]X[FLAGS]
```
Donde: 
* [ADDR] es la especificación de una posición en la que el programa editará las entradas, que puede ser el número de línea, una regex, o un rango de líneas. Esto es opcional
* X es un comando de una sola letra 
* [FLAGS] son operaciones opcionales que el comando puede realizar 

Es posible juntar varias de estas estructuras en una sola secuencia de comandos, de la siguiente forma: 

``` bash
[ADDR1]X[XFLAGS]
[ADDR2]Y[YFLAGS]
[ADDR3]Z[ZFLAGS]
```
o también
``` bash
[ADDR]{X[XFLAGS];Y[YFLAGS];Z[ZFLAGS]}
```
Para el funcionamiento de *sed*, se debe considerar que esta herrameinta posee dos *buffers* de datos: el *espacio de patrones* y *espacio hold*, que inicialmente están vacíos. 

Entonces, *sed* realiza un ciclo en cada línea del archivo. Primero, se lee una línea del flujo de entrada, se eliminan los caracteres `\n`, y esto se coloca en el *espacio de patrones*, donde los comandos son ejecutados. [ADDR] es como un condicional, el comando solo se ejecuta si la condición se verifica antes de que se ejecute el comando. Cuando se llega al final de la secuencia de comandos, a menos que la opción `-n` esté en uso, el contenido del *espacio del patrones* se imprime en el *stdout* y se vuelve a agregar el caracter `\n` si se eliminó. Luego, el siguiente ciclo comienza para la siguiente línea de entrada. 

Así, se observa que el *espacio de patrones* se elimina entre dos ciclos; mientras que el *espacio hold* se mantiene.

```{image} ./img/sed_workflow.jpeg
:alt: ./img/anaconda.png
:width: 650px
:align: center
```


<div id="seccion4_5_4"/>

## Comando más común de sed: `s`

El comando de sustitución `s` es el más usado debido a que tiene muchas opciones y funcionalidades. La forma general de este comando es `s/REGEXP/REPLACEMENT/[FLAGS]`, en la que se busca la expresión regular `REGEXP` en el contenido del *espacio de patrones*. Si existe la coincidencia, se reemplaza el patrón con lo que se coloca en `REPLACEMENT`. Los caracteres `/` pueden ser reemplazados por cualquier otro carácter.  

Con este comando se pueden usar algunos `[FLAGS]`, y entre los más comunes se encuentran:

| **Flag** | **Descripción** |
|:---:|:---:|
|`g` | Se aplica el reemplazo a todas las coincidencias con la regex, no solo a la primera |
|`NUMBER` | Solo se reemplaza un el número especificado de coincidencias de la regex. Si `g` y `NUMBER` se combinan, se ignoran las coincidencias antes del `NUMBER`, y luego se reemplazan todas las coincidencias desde el número especificado en adelante  |
|`w FILENAME` | Si se realizó la sustitución, se escribe el resultado en el archivo `FILENAME`  |
| `i` o `I`| Hace que sed coincida con la regex de forma que no distinga entre mayúsculas y minúsculas |
| `m` o `M` | Activa el modo multilínea de regex, con lo que los símbolos `^` y `s` coinciden con el inicio y fin de línea respectivamente |

Además, el comando `s` permite realizar algunas operaciones para convertir texto a mayúsculas y minúsculas: 

| **Código** | **Descripción** |
|:---:|:---:|
|`\L` | Convertir el texto a minúsculas hasta que se encuentre una `\U` o `\E` |
|`\l` | Convertir el siguiente caracter a minúscula |
|`\U` | Convertir el texto a mayúsculas hasta que se encuentre una `\L` o `\E`  |
| `\u` | Convertir el siguiente caracter a mayúscula |
| `\E` | Detener la conversión de minúsculas y mayúsculas iniciada por `\L` o `\U` |

Por ejemplo, observamos que en el texto de trabajo se repite varias veces la palabra **computadora**, pero en algunos casos empieza con mayúscula y en otros casos no. Por tanto, para que todas estas palabras comiencen con minúsculas podemos usar el siguiente comando:

``` bash
sed 's/Computadora/computadora/g' Contrapunto_para_Humano_y_Computadora_Cuarteto_de_Nos.txt
```

```{admonition} Advertencia
:class: warning
Si corremos el comando de esta forma el resultado se imprime en la consola. Si se quiere modificar el archivo de trabajo de forma directa se puede usar la opción `-i`, pero se debe tener cuidado con esto porque los cambios son irreversibles. 
```

```{admonition} Pregunta
:class: hint
Ahora, **¿Qué comando de sed podemos usar para reemplazar la fecha del archivo con la fecha del día de hoy, utilizando una regex general para fechas como la que vimos en el tema [3 sobre regex](3_Expresiones_regulares.md)?** Debes considerar que en el comando sed no funcionan las abreviaciones de expresiones de corchetes como \d, \w, etc. 

**¿Qué comando de sed usarías para reemplazar la línea que empieza con la letra `O` y termina con `ver` por `Quizá no quiere observar`?**

**¿Qué comando de sed usarías para sustituir todas las coincidencias de la palabra `Verso` por `Estrofa`?**

**¿Qué comando de sed usarías para reemplazar el segundo signo `\` por `-`?**
```


<div id="seccion4_5_5"/>

## Otros comandos de sed comunes: `d, p, n, i, a, c, =`

| **Comando** | **Descripción** |
|:---:|:---:|
|`d` (eliminación)| Se elimina el *espacio del patrones*, y se inicia inmediatamente el siguiente ciclo |
|`p` (impresión) | Se imprime el *espacio del patrones* |
| `n` (siguiente) | Si la impresión automática no está deshabilitada, se imprime el *espacio del patrones* y, a continuación, se reemplaza el *espacio del patrones* con la siguiente línea de la entrada. Si no hay más entradas, sed sale sin procesar más comandos |
| `i TEXT` (insertar) | Se inserta `TEXT` antes de una línea |
| `a TEXT` (añadir) |  Se añade `TEXT` después de una línea |
| `c TEXT` (cambiar) | Se reemplaza líneas con `TEXT` |

Por ejemplo, si queremos eliminar las líneas que contienen el título y número de los versos, podemos usar el siguiente comando: 

``` bash
sed -r '/\[/d' Contrapunto_para_Humano_y_Computadora_Cuarteto_de_Nos.txt
```

Y si queremos imprimir las líneas de los versos podemos usar el mismo comando pero con `p` en lugar del `d` y añadir la opción `-n`, de la siguiente forma: 

``` bash
sed -r -n '/\[/p' Contrapunto_para_Humano_y_Computadora_Cuarteto_de_Nos.txt
```

Haz la prueba por tu cuenta y verifica que el resultado sea el esperado. Además, si se desea añadir una línea antes de la línea de `Código` con la hora de modificación del archivo, se podría usar el siguiente comando: 

``` bash
sed -r '/Código/i Hora modif: 9:00 AM' Contrapunto_para_Humano_y_Computadora_Cuarteto_de_Nos.txt
```

```{admonition} Pregunta
:class: hint
**¿Qué comando de sed usarías para eliminar las líneas de los títulos de los versos que correspondan a Roberto?**

**¿Qué comando usarías para imprimir todas las líneas de la canción que sean preguntas, incluyendo ?**

**¿Qué comando se podría usar para añadir una línea en blanco después del título de todos los versos?**
```

<div id="seccion4_5_6"/>

## Especificación de posiciones
Con la herramienta *sed* se pueden especificar las posiciones de búsqueda de los patrones de las siguientes formas: 

| **Forma para especificar posción** | **Descripción** |
|:---:|:---:|
|`número de línea` | Especificar un número de línea que buscará coincidencias solo con esa línea de la entrada |
|`primeralínea~paso` | Coincide con las líneas de cada paso que comienzan con la primera línea. Para seleccionar las líneas impares, se usa `1~2`; para elegir cada tercera línea comenzando con la segunda, se usa `2~3`; y para elegir una de cada cinco líneas a partir de la décima, se emplea `10~5` |
|`s` | Coincide con la última línea del último archivo de entrada, o la última línea de cada archivo cuando se especifican las opciones `-i` o `-s`  |
| `/regex/` | Selecciona cualquier línea que coincida con la regex |
| `primeralínea, últimalínea` (rango) | Se seleccionan las líneas usando un rango separado por comas |

Por ejemplo, si queremos eliminar las líneas de la 1 a 3, podríamos usar el siguiente comando: 

``` bash
sed -r '1,3d' Contrapunto_para_Humano_y_Computadora_Cuarteto_de_Nos.txt
```
```{admonition} Pregunta
:class: hint
**¿Qué comando de sed usarían para insertar una línea en blanco luego de la línea 20?**

**¿Qué comando de sed se podría usar para sustituir la última línea del archivo por la palabra `FIN`?**
```

<div id="seccion4_5_7"/>

## Material suplementario

La mayoría de los contenidos de esta parte se obtuvieron de la documentación oficial de GNU, que pueden acceder en el siguiente [link](https://www.gnu.org/software/sed/manual/sed.html). En los siguientes enlaces pueden encontrar información adicional sobre este tema:

* <https://www.computerhope.com/unix/used.htm>
* <https://alexharv074.github.io/2019/04/16/a-sed-tutorial-and-reference.html>
* <https://www.grymoire.com/Unix/Sed.html>
