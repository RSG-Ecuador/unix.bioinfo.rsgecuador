# Grep
En esta parte del curso estudiaremos la herramienta grep. Al igual que la parte de regex, este tutorial tiene un enfoque general, sin aplicaciones en Bioinformática (lo que veremos más adelante). 

```{admonition} Nota importante
:class: note
En la mayoría de secciones existen preguntas y pequeños ejercicios, maracados con la etiqueta `Pregunta`, cuyas respuestas deben ser realizadas como deber de esta parte del curso. Debes guardar las respuestas en el **Jupyter notebook** que debes entregar en este capítulo y correr los comandos en las preguntas que esto sea posible.
```
Luego de la fecha de entrega del deber enviaremos las respuestas a los ejercicios de todas las secciones. 

```{admonition} Advertencia
:class: warning
En este tutorial usaremos la herramienta *GNU grep*, que viene instalada por defecto en la mayoría de distribuciones de GNU/Linux. Puede que algunos de los comandos usados con esta herramienta no sean compatibles con otras versiones del programa usadas en MacOS, por lo que les recomendamos instalar *GNU grep*. En este [blog](https://stackoverflow.com/questions/59232089/how-to-install-gnu-grep-on-mac-os) se discute este tema. 
```

<div id="seccion4_4_0"/>

## Archivo para este tutorial
En este tutorial usaremos un archivo que tiene la versión completa de la canción *Contrapunto para Humano y Computadora* de la banda *El Cuarteto de Nos*. 

```{admonition} Nota
:class: Note
Este documento se encuentra en la carpeta `_files` dentro del directorio raíz del repositorio de Github, y tiene el nombre `Contrapunto_para_Humano_y_Computadora_Cuarteto_de_Nos.txt`. 
```

<div id="seccion4_4_1"/>

## ¿Qué es grep?
Grep es una herramienta de SO basados en UNIX, que permite hacer búsquedas de regex en archivos de texto o [* input estándar stdin*](https://www.computerhope.com/jargon/s/stdin.htm) derivados de *piping* (que veremos en detalle una sección posterior), e imprimir la o las líneas que coincidan con el o los patrones buscados. Un aspecto que se debe considerar es que dado que el caracter de nueva línea `\n` es un separador de la lista de patrones, no hay forma de buscar los caracteres de nueva línea usando grep. 

La sintaxis general de esta herramienta es de la siguiente forma: 

``` bash
grep [-opcion(es)...] ["patron(es)"...] [archivo(s)]
```

Pueden existir cero o más opciones y archivos. Si no se provee ningún archivo grep busca en el directorio de trabajo actual si se le da una opción de línea de comandos que especifique la recursividad; de lo contrario, busca en el [*(stdin)*](https://www.computerhope.com/jargon/s/stdin.htm). Además, se deben proveer uno o más patrones que son separados internamente por el programa por caracteres `\n`. 

```{admonition} Tip
:class: tip
Normalmente, los patrones se ponen entre comillas cuando se usa grep para evitar la interpretación y expansión de los metacaracteres por la shell.
```

<div id="seccion4_4_2"/>

## Diferentes versiones de grep: `-G -E -F -P`
En GNU grep existen cuatro versiones de la herramienta, que se eligen con diferentes opciones:

|**Versión**|**Descripción**|
|:---:|:---:|
| `-G` o `--basic-regexp` | Interpreta los patrones como regex básicas (BREs). Es las versión estándar de la herramienta  |
| `-E` o `--extended-regexp` |  Interpreta los patrones como regex extendidas (EREs)|
| `-F` o `--fixed-strings`| Interpreta los patrones como string fijos, no como regex|
| `-P` o `--perl-regexp`|  Interpretar los patrones como expresiones regulares compatibles con Perl (PCREs)  | 

```{admonition} Nota
:class: note
En la implementación GNU grep no hay diferencia funcional entre las sintaxis de expresión regular básica y extendida. La única diferencia es que en las expresiones regulares básicas los metacaracteres `? + { | ()` se interpretan como caracteres literales y por tanto se deben escapar con `\`. 
```

Por ejemplo, usemos el siguiente comando para buscar las líneas que tengan los caracteres **a** o **e** usando el metacaracter de alternancia `|` con la versión estándar: 

``` bash
grep "a|e" Contrapunto_para_Humano_y_Computadora_Cuarteto_de_Nos.txt
```

```{admonition} Pregunta
:class: hint
Ahora, intenten correr el mismo comando añadiendo la opción `-E`. **¿Cambió la respuesta en comparación con el comando con la versión estándar?**
```

Noten que para que este comando funcione deben estar en el directorio **_files**, o especificar en el path desde el directorio en el que se encuentren. 


Para evitar complicaciones, si usamos regex que incluyan patrones con el metacaracter de alternancia, agrupamiento o cuantificadores, se usa la versión extendida `-E`. 

<div id="seccion4_4_3"/>

## Opciones de la herramienta grep

<div id="seccion4_4_3_1"/>

### Información general del programa: `--version, --help`
El comando `--version` o `-V` se usa para imprimir en la terminal el número y algunas características de la versión de grep instalada en el SO; mientras que `--help` sirve para imprimir información general del uso y las opciones de grep. 

```{admonition} Pregunta
:class: hint
**¿Cuál versión de grep tienes en tu SO?**
```

<div id="seccion4_4_3_2"/>

### Flags: `-e -f -i -v -w -x`
En GNU grep existen los siguientes modos para controlar las coincidencias: 

|**Flag** |**Descripción**| 
|:---:|:---:|
|`-e "patron(es)"` o `--regexp="patron(es)"` | Busca los patrones especificados como argumento y los caracteres `\n` separan un patrón del siguiente|
|`-f archivo` o `--file=archivo` | Busca los patrones de un archivo, uno por línea|
|`-i` o `--ignore-case` | Hace que la regex no sea sensible a mayúsculas o minúsnuclas. La regex "abc" coincide con el patrón "AbC"|
|`-v` o `--invert-match` | Invierte el sentido de coincidencia, para seleccionar líneas que no coinciden con el patrón|
|`-w` o `--word-regexp` | Selecciona solo las líneas que contengan coincidencias que formen palabras completas |
|`-x` o `--line-regexp` | Seleccione solo los patrones que coincidan exactamente con toda la línea |

Entonces, si queremos buscar las líneas del archivo de trabajo que tengan la palabra **computadora** utilizamos el siguiente comando: 

``` bash
grep "computadora" Contrapunto_para_Humano_y_Computadora_Cuarteto_de_Nos.txt
```

```{admonition} Pregunta
:class: hint
Si observamos el archivo, vemos que hay ciertas líneas que tienen la palabra **computadora** pero empiezan con C mayúscula. **¿Cómo debemos modificar el comando previo para realizar esta búsqueda?**

Si queremos buscar las líneas que contengan la palabra computadora o Roberto sin importar las mayúsculas o minúsculas, podríamos usar la regex `computadora|Roberto` con la opción `-i` y la versión `-E`, pero otra opción sería usar un archivo con las dos palabras y usar una opción adicional. **¿Cuáles comandos usarías para crear el archivo de patrones por consola y realizar esta búsqueda usando el archivo que creaste?** 

**¿Coincidieron los resultados de los dos comandos?**

Ahora, busquen las líneas que contengan el patrón **se** con y sin la opción `-w`, **¿Hay diferencia en los resultados con estos comandos?**

Siguiendo el mismo principio, busquen las líneas con el patrón **Ni** con y sin la opción `-x`, **¿Hay diferencia en los resultados con estos comandos?**

Y, **¿Cómo hacemos para buscar las líneas que no tengan los patrones `computadora` o `Roberto` sin importar las mayúsculas o minúsculas?**
```

<div id="seccion4_4_3_3"/>

### Control general de salida: `-c --color -L -l -m -o -q -s`
Se tienen las siguientes opciones para controlar la salida de forma general: 

| **Opción** | **Descripción** |
|:---:|:---:|
|`-c` o `--count` | Se imprime el número de líneas que coinciden con un patrón para cada archivo de entrada. Con la opción `-v` se cuentan las líneas que no coinciden |
|`--color` | Se colorean los patrones, líneas coincidentes o de contexto, nombres de archivo, y números de línea |
|`-L` o `--files-without-match` | Se imprime el nombre de los archivos de entrada que no coinciden con el patrón de búsqueda |
| `-l` o `--files-with-matches` | Se imprime el nombre de los archivos de entrada que coinciden con el patrón de búsqueda|
| `-m num` o `--max-count=num` | La búsqueda del patrón se detiene luego de que se cumpla con el número de coincidencias especificadas en num |
| `-o` o `--only-matching` | Se imprime solo las partes coincidentes con el patrón de búsqueda de las líneas, con cada parte separada por una nueva línea|
| `-q` o `--quiet` | No se imprime nada en la terminal |
| `-s` o `--no-messages` | Suprimir los mensajes de error de los resultados que se imprimen en la terminal|


```{admonition} Pregunta
:class: hint
Ahora, considerando estos conocimientos y lo que hemos aprendido previamente sobre regex, **¿Qué comando podemos usar para verificar el número de versos de la canción, incluyendo la discusión final entre Roberto y la computadora como otro verso?** 

**¿Cuál(es) comandos usarías para determinar el número de versos de la computadora, Roberto y de ambos?**
```

```{admonition} Tip
:class: tip
Por defecto, la mayoría de versiones de *GNU grep* tienen establecido el color del resultado de las coincidencias del comando con rojo y fondo negro, pero esto se puede cambiar usando la variable de ambiente **GREP_COLORS**. Pueden encontrar más información sobre este tema en el siguiente [blog](https://askubuntu.com/questions/1042234/modifying-the-color-of-grep). 
```

```{admonition} Pregunta
:class: hint
Utilizando la opción `-m` de 4, **¿Cuál es la última línea que se imprime buscando el patrón `?` ?**
```

El uso de las opciones `-l`y `-L` lo veremos más adelante en este tutorial, y les pedimos que prueben el funcioamiento de las opciones `-o`, `-q` y `s` por su cuenta. 

<div id="seccion4_4_3_4"/>

### Control de prefijo de línea de salida : `-H -h -n -T`
Para controlar el prefijo de línea se tienen las siguientes opciones: 

| **Opción** | **Descripción** |
|:---:|:---:|
|`-H` o `--with-filename` | Imprime el nombre de archivo por cada coincidencia. Este es el valor predeterminado cuando hay más de un archivo para buscar |
| `-h` o `--no-filename` | Suprima el prefijo de los nombres de archivo. Este es el valor predeterminado cuando solo hay un archivo para buscar |
| `-n` o `--line-number` | Imprime el número de línea de cada coincidencia antes del patrón |
| `-T` o `--initial-tab` | Se verifica de que el primer carácter del contenido de la línea tiene en una tabulación |


```{admonition} Pregunta
:class: hint
Ahora, si queremos conocer el número de línea de todas las líneas que terminen en una palabra con los sufijos `ando`, `ión`, u `ono`; **¿Qué comando podría usar que cumpla con este criterio de búsqueda?** 

**¿Cuántas líneas hay con palabras que terminen con cada uno de estos sufijos**. Prueba el mismo comando con la opción `-T`, 

**¿Hay alguna diferencia con lo que obtuviste previamente?**
```


El uso de las opciones `-h`y `-H` lo veremos más adelante en este tutorial. 

<div id="seccion4_4_3_5"/>

### Control de contexto de línea: `-A -B -C`
Se puede controlar la impresión del contexto de línea con las siguientes alternativas:

| **Opción** | **Descripción** |
|:---:|:---:|
|`-A num` o `--after-context=num` | Imprime el número de líneas que se ubican después de las coincidencias con el patrón de búsqueda |
| `-B num` o `--before-context=num` | Imprime el número de líneas que se ubican antes de las coincidencias con el patrón de búsqueda |
| `-C num` o `--context=num` | Imprime el número de líneas que se ubican antes y después de las coincidencias con el patrón de búsqueda |

```{admonition} Pregunta
:class: hint
Utilizando las opciones de contexto de línea, determina los límites de los versos **3, 5, 10, y 12**, **¿Cuántas líneas componen a cada uno de estos versos omitiendo su título correspondiente?**. 

Aisla estos cuatro versos (incluyendo su título) en archivos separados con nombre `verso#.txt` solamente usando la terminal, siendo `#` el número del verso respectivo, y ubícalos en el directorio *archivos* **¿Cuál es un ejemplo de uno de los comandos que usaste para esta tarea?**
```

<div id="seccion4_4_3_6"/>

### Selección de archivos o directorios: `-r --exclude=glob --include=glob`
Las opciones de selección de archivos o directorios más comunes son: 

| **Opción** | **Descripción** |
|:---:|:---:|
|`-r` o `--recursive` | Para cada operación que se aplique al directorio, lea y procese todos los archivos en ese directorio, de forma recursiva |
| `--exclude=glob`| Omitir cualquier archivo de línea de comandos con un sufijo de nombre que coincida con el patrón global, utilizando coincidencias con *wildcards*  |
| `--include=glob` | Buscar solo archivos de línea de comandos con un sufijo de nombre que coincida con el patrón global, utilizando coincidencias con *wildcards* |  

```{admonition} Pregunta
:class: hint
Ahora, si queremos verificar cuáles documentos del directorio *archivos* tienen una línea que contenga la palabra **computadora**, sin importar las mayúsculas y minúsculas, podemos utilizar las opciones `-r` y `-l`. **¿Cuáles archivos cumplen con esta condición?**. 

Si en lugar de la opción `-l` usas `-L`, **¿Qué archivos aparecen ahora?**. 

Prueba el mismo comando con las opciones `-H` y `-h`, **¿Cuáles fueron las diferencias con los resultados previos?**
```

<div id="seccion4_4_4"/>

## Material suplementario

La mayoría de los contenidos de esta parte se obtuvieron de la documentación oficial de *GNU*, que pueden acceder con el siguiente [link](https://www.gnu.org/software/grep/manual/grep.html). En los siguientes enlaces pueden encontrar información adicional sobre este tema:

* <https://linuxize.com/post/regular-expressions-in-grep/>
* <https://www.computerhope.com/unix/ugrep.htm>
