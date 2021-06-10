# Cut, sort
En esta parte del curso estudiaremos las herramientas cut, y sort. Al igual que las anteriores partes, este tutorial tiene un enfoque general, sin aplicaciones en Bioinformática (lo que veremos más adelante). 

```{admonition} Nota importante
:class: note
En la mayoría de secciones existen preguntas y pequeños ejercicios, maracados con la etiqueta `Pregunta`, cuyas respuestas deben ser realizadas como deber de esta parte del curso. Debes guardar las respuestas en el **Jupuyer notebook** que debes entregar en este capítulo y correr los comandos en las preguntas que esto sea posible.
```

Luego de la fecha de entrega del deber enviaremos las respuestas a los ejercicios de todas las secciones. 

```{admonition} Advertencia
:class: warning
En este tutorial usaremos la herramienta *GNU cut*, que viene instalada por defecto en la mayoría de distribuciones de GNU/Linux. Puede que algunos de los comandos usados con esta herramienta no sean compatibles con otras versiones del programa usadas en MacOS, por lo que les recomendamos instalar *GNU cut*. En este [blog](https://apple.stackexchange.com/questions/191667/to-install-gnu-cut-in-osx) se discute este tema. 
```

<div id="seccion4_6_0"/>

## Archivos para este tutorial
En este tutorial usaremos un archivo con una lista de nombres de estudiantes y otra con las calificaciones correspondientes. 

```{admonition} Nota
:class: note
Estos documentos se encuentran en la carpeta `_files` dentro del directorio raíz del repositorio de Github, y tienen los nombres de `alumnos.txt` y `notas.txt`. 
```

<div id="seccion4_6_1"/>

## Comando cut
Cut es una herramienta de SO basados en UNIX, que sirve para cortar partes de líneas de archivos e imprimir el resultado en el [*standard output (std)*](http://www.linfo.org/standard_output.html), que son flujos de datos estandarizados producidos por programas de línea de comandos y que se imprimen por defecto en la terminal. Es posible realizar los cortes de las líneas por delimitadores, posición de bytes o caracteres. 

La sintaxis general de esta herramienta es de la siguiente forma: 

``` bash
cut [-opcion(es)...] [archivo(s)]
```
```{admonition} Nota
:class: note
Este comando puede aceptar cero o más archivos como entrada. Si no se especifica ningún archivo, el comando se aplicará a lo que se escriba en el [*standard input (stdin)*](https://www.computerhope.com/jargon/s/stdin.htm). 
```

<div id="seccion4_6_1_1"/>

## Opciones de la herramienta cut

<div id="seccion4_6_1_1_1"/>

### Información general del programa: `--version, --help`
El comando `--version` se usa para imprimir en la terminal el número y algunas características de la versión de cut instalada en el SO; mientras que `--help` sirve para imprimir información general del uso y las opciones de cut. 

```{admonition} Pregunta
:class: hint
**¿Cuál versión de cut tienes en tu SO?**
```

<div id="seccion4_6_1_1_2"/>

### Definir el tipo de corte: `-f, -b, -c, -d, --complement, -s, --output-delimiter`
Para definir la forma de corte del comando cut existen las siguientes opciones: 

| **Opción** | **Descripción** |
|:---:|:---:|
|`-f LIST` o `--fields=LIST` | Se selecciona especificando un campo/columna, conjunto de campos, o rango de campos. También imprime cualquier línea que no contenga un carácter delimitador, a menos que se especifique la opción `-s`|
|`-b LIST` o `--bytes=LIST` | Se selecciona especificando un byte, conjunto de bytes, o rango de bytes |
|`-c LIST` o `--characters=LIST` | Se selecciona especificando un carácter, conjunto de caracteres, o rango de caracteres |
| `-d` o `--delimiter` | Se especifica un delimitador que se utilizará en lugar del "TAB", que es el predeterminado |
| `--complement` | Cuando se usa esta opción, el corte se realiza en todos los bytes, caracteres o campos excepto el/los seleccionados |
| `-s` o `--only-delimited` | De forma predeterminada, cut imprime las líneas que no contienen ningún carácter delimitador. Cuando se usa esta opción, no se imprimen líneas que no contienen delimitadores |
| `--output-delimiter` | El comportamiento predeterminado de cut es utilizar el delimitador de entrada como delimitador de salida. Esta opción permite especificar un delimitador de salida diferente |

```{admonition} Tip
:class: tip
Se debe considerar que en las opciones `-f`, `-b`, y `-c` LIST especifica un elemento, conjunto, o rango, lo que se puede escribir como un entero, múltiples enteros separados por comas, un rango de enteros, o varios rangos de enteros separados por comas.
``` 

Existen las siguientes formas de escribir esto: 

| **Forma** | **Descripción** |
|:---:|:---:|
|`N` | El campo, byte, o carácter N, comenzando por 1 |
|`N-` | Desde el campo, byte, o carácter N, hasta el final de la línea |
|`N-M`| Desde el campo, byte, o carácter N al M |
| `-M`| Desde el primer campo, byte, o carácter hasta el M |

En la sección de **Manejo de terminal** se aprendió sobre el comando *paste*, que permite copiar los elementos de un archivo a otro haciendo coincidir sus columnas. Este comando es útil para unir los archivos `alumnos.txt` y `notas.txt` y exportar el resultado a un nuevo fichero, para lo que usamos el siguiente comando: 

``` bash
paste alumnos.txt archivos/notas.txt > archivos/notasfinal.txt
```
Ahora, si queremos seleccionar solo la columna de la Nota1 de los estudiantes del archivo `notasfinal.txt`, podemos usar el comando: 

``` bash
cut -f 2 notasfinal.txt 
```

```{admonition} Pregunta
:class: hint
Noten que por defecto la salida del programa se imprime en la terminal, pero podemos redireccionar el *stout* a un nuevo archivo usando el operador `>`. **¿Qué comando podría usar para seleccionar las columnas de las Notas 1, 2, y 3 del archivo `notasfinal.txt`?**

Ahora, si queremos extraer solo los apellidos de los estudiantes, podríamos pensar en usar el mismo comando anterior con la opción `-f` como 1, pero el resultado no es adecuado porque se seleccionan también los nombres. **¿Qué comando podría usar para seleccionar solamente los apellidos de los estudiantes?** 

**¿Cómo puedo usar un comando similar pero con una opción adicional para seleccionar todas las columnas, menos los apellidos de los estudiantes?** 

**¿Qué opción debo añadir para que el delimitador del archivo de salida sea `,`?**
```

En la versión actual de *GNU cut* el resultados de la opción `-c` es el mismo que con `-b`, lo que se debe a que no se ha implementado la opción `-c` de forma adecuada. Sin embargo, es bueno conocer su diferencia. Cuando se estableció el formato estándar *ASCII*, se consideraron 128 caracteres usados principalmente en el idioma inglés, cada uno representado por un byte. Sin embargo, con el paso del tiempo se han introducido nuevos símbolos, por lo que se han creado nuevos estándares como el *UTF-8* en el que **NO** todos los caracteres se representan con un byte. 


```{admonition} Pregunta
:class: hint
Por ejemplo, creemos un archivo desde la terminal y añadamos la palabra **niño**; si usamos el comando cut con la opción `-c` y el elemento **4** en este archivo, esperaríamos obtener el caracter *o*, **¿Esta predicción se cumple?** 
```

<div id="seccion4_6_2"/>

## Comando sort
Es un comando simple y útil que permite rearreglar las líneas de un archivo de texto de forma que queden ordenadas alfabéticamente o numéricamente. De forma general se aplican las siguientes reglas: 

* Las líneas que comienzan con un número aparecerán antes de las líneas que comienzan con una letra
* Las líneas que comienzan con una letra que aparece antes en el alfabeto aparecerán antes de las líneas que comienzan con una letra que aparece después en el alfabeto
* Las líneas que comienzan con una letra minúscula aparecerán antes de las líneas que comienzan con la misma letra en mayúscula

La sintaxis general de esta herramienta es la siguiente: 


``` bash
sort [-opcion(es)...] [archivo(s)]
```

<div id="seccion4_6_2_1"/>

## Opciones de la herramienta sort
Las opciones principales de sort son las siguientes: 

| **Opción** | **Descripción** |
|:---:|:---:|
|`-b` o `--ignore-leading-blanks`| Ignorar los espacios en blanco iniciales |
|`-g` o `--general-numeric-sort` | Comparar según el valor numérico general |
|`-r` o `--reverse` | Invertir el resultado de las comparaciones  |
|`-u` o `--unique` | Permite eliminar las líneas repetidas |
| `-c` o `--check` | Compruebe si el archivo de entrada ha sido ordenado  |
| `-k POS1[,POS2]` o `--key=POS1[,POS2]` | Ordena considerando campos o columnas específicas. POS toma la forma `F[.C]`, donde F es el número de campo y C la posición del carácter en el campo; ambos empiezan en 1 |

Por ejemplo, si queremos ordenar los Nombres de los estudiantes del archivo `alumnos.txt` usando su **primer apellido**, utilizamos el comando *sort* sin ninguna opción. Sin embargo, si queremos realizar el ordenamiento considerando el primer nombre de los estudiantes podemos usar el siguiente comando:

``` bash
sort -k 3 alumnos.txt
```

```{admonition} Pregunta
:class: hint
Se observa que hay algunos nombres repetidos, **¿Cómo debemos modificar el comando previo para eliminar los duplicados?**
```

Ahora, podemos ordenar las notas de los estudiantes del archivo `notas.txt` de acuerdo a la **Nota2** de forma ascendente, para lo que empleamos el siguiente comando: 

``` bash
sort -g -k 2 notas.txt
```

```{admonition} Pregunta
:class: hint
En base a los ejemplos previos, **¿Cómo podrían ordenar las notas de los estudiantes del archivo `notasfinal.txt` de acuerdo a la `Nota3` de forma descendente?**
```

<div id="seccion4_6_3"/>

## Material suplementario

En los siguientes enlaces pueden encontrar información adicional sobre estos temas:

* <https://linuxize.com/post/linux-cut-command/>
* <https://www.computerhope.com/unix/ucut.htm>
* <https://shapeshed.com/unix-cut/>
* <https://www.computerhope.com/unix/usort.htm>
