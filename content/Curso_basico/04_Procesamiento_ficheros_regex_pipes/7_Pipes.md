# Pipes
En esta parte del curso estudiaremos los pipes. Al igual que las anteriores partes, este tutorial tiene un enfoque general, sin aplicaciones en Bioinformática (lo que veremos más adelante). 

```{admonition} Nota importante
:class: note
En la mayoría de secciones existen preguntas y pequeños ejercicios, maracados con la etiqueta `Pregunta`, cuyas respuestas deben ser realizadas como deber de esta parte del curso. Debes guardar las respuestas en el **Jupuyer notebook** que debes entregar en este capítulo y correr los comandos en las preguntas que esto sea posible.
````

Luego de la fecha de entrega del deber enviaremos las respuestas a los ejercicios de todas las secciones. 

<div id="seccion4_7_0"/>

## Archivos para este tutorial
En este tutorial usaremos los tres archivos que hemos usado en los temas anteriores: `Contrapunto_para_Humano_y_Computadora_Cuarteto_de_Nos.txt`, `alumnos.txt` y `notas.txt`, que se encuentran en la carpeta `_files` dentro del directorio raíz del repositorio de Github.

<div id="seccion4_7_1"/>

## ¿Qué son los pipes?

Los pipes (`|`) son una herramienta de interfaz de línea de comandos (CLI) de SO basados en Unix, que permite redireccionar el [*stdout*](https://www.computerhope.com/jargon/s/stdout.htm) de un comando/programa/proceso al [*stdin*](https://www.computerhope.com/jargon/s/stdin.htm) de otro comando/programa/proceso. De esta forma, se pueden usar dos o más comandos de forma que el resultado de un comando sirva como la entrada del siguiente, lo que se puede repetir de acuerdo a la cantidad de pipes. 

De esta forma, se crea una conexión directa entre los comandos/programas/procesos, lo que permite que los datos se transfieran entre estos de forma continua en lugar de tener que guardar esta información en archivos de texto temporales o imprimir en pantalla. 

La sintaxis general de esta herramienta es de la siguiente forma: 

``` bash
comando1 | comando2 | ... | comandoN
```
Para entender mejor este concepto, usaremos dos programas sencillos de Linux, `fortune` que imprime en pantalla frases aleatorias de personas famosas, y `cowsay` que imprime en pantalla una vaca con un mensaje que escriba el usuario. La ejecución de los dos programas de forma independiente se observa de la siguiente forma: 

```{image} ./img/pipes1.png
:alt: ./img/pipes1.png
:width: 600px
:align: center
```

```{image} ./img/pipes2.png
:alt: ./img/pipes2.png
:width: 600px
:align: center
```

Ahora, utilicemos la herramienta pipe con estos dos comandos: 

```{image} ./img/pipes3.png
:alt: ./img/pipes3.png
:width: 600px
:align: center
```

Se observa que el resultado del comando `fortune` es asignado como la entrada de `cowsay`. Esta herramienta es muy poderosa y se puede usar para optimizar muchos flujos de trabajo en CLI. Verifica si tienes instalad estos dos programas en tu SO, sino trata de instalarlos y observa los resultados en tu equipo. 

<div id="seccion4_7_2"/>

## Ejemplos del uso de pipes

Primero, usaremos algunos ejemplos sencillos del comando `echo` usando pipes con `grep` y `sed`:

``` bash
echo "abcdef12345" | grep "[0-9]"
```

``` bash
echo "Hola mundo !!" | grep "mundo"
```

``` bash
echo "Hola mundo Hola mundo Hola mundo" | sed -e 's/Hola/Hi/2' -e 's/mundo/world/2'
```

```{admonition} Pregunta
:class: hint
**¿Qué pipeline podría emplear usando `ls` y `grep` para encontrar los archivos de la carptea `img` que tenga extensión png, incluyendo información de sus permisos y fecha de modificación?**
```

Ahora, vamos a trabajar con los archivos `alumnos.txt` y `notas.txt`. Usaremos el comando `paste` para juntar la información de los dos archivos, y luego seleccionaremos los **Apellidos y Nombres** de los estudiantes y la columna de **Notas1**, lo que podemos hacer en una sola línea de código usando pipes de la siguiente forma: 

``` bash
paste alumnos.txt notas.txt | cut -f 1-2
```

```{admonition} Pregunta
:class: hint
Siguiendo esta misma lógica, **¿Que pipeline podrías usar para seleccionar solamente los apellidos de los estudiantes del archivo `alumnos.txt`, ordenralos alfabéticemnte y eliminar los duplicados?**

**¿Qué pipeline se puede usar para juntar los archivos `alumnos.txt` y `notas.txt`, seleccionar los Nombres y Apellidos de los estudiantes y las Notas 1 y 3; eliminar los duplicados y ordenar los datos de mayor a menor considerando la Nota 3?**


**¿Qué pipeline se podría usar para juntar los archivos `alumnos.txt` y `notas.txt`, eliminar los duplicados, e imprimir la línea que posee las notas de la estudiante que tiene apellido Moore?**

Ahora, usaremos el archivo `Contrapunto_para_Humano_y_Computadora_Cuarteto_de_Nos.txt`. **¿Qué pipeline puedo usar para seleccionar todas las líneas que contengan el título del verso, eliminar los que correspondan a la computadora; y guardar esta información en un nuevo archivo llamado `versos.txt`?**
```


<div id="seccion4_7_3"/>

## Material suplementario

En los siguientes enlaces pueden encontrar información adicional sobre este tema:

* <https://www.geeksforgeeks.org/piping-in-unix-or-linux/>
* <https://www.guru99.com/linux-pipe-grep.html>
* <https://www.howtogeek.com/438882/how-to-use-pipes-on-linux/>
