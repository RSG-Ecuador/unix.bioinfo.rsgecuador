# Wildcards y Streams

## Carcateres y strings

Los `caracteres` son unidades de información que se representan con símbolos. Pueden ser de varios tipos como alfanuméricos, números enteros, signos de puntuación. Varios caracteres son interpretados por la shell de manera especial. Estos se llaman `caracteres especiales`, claro, y permiten desarrollar alguna lógica, dependiendo del contexto. Por ejemplo, algunos caracteres: `@` `#` `.` `?` `!` `,` `/` `\` `>` `~` `a` `µ` `g` `§` `R`.

```{admonition} Nota
:class: note
Cada caracter se asocia a una combinación diferente de teclas en el teclado del computador. 
```

Los `strings` son arreglos de caracteres. Esto quiere decir que son caracteres en conjunto y con un orden en particular. Por ejemplo el string `pizza` tiene 4 diferentes caracteres: `i`, `p`, `z`, `a`. Diferentes combinaciones de caracteres pueden formar diferentes strings.

Creemos un string y luego imprimámoslo en la pantalla del Terminal. Escribe los siguientes comandos:

```bash
$ mi_primer_string="Taller de bioinformática"
$ echo $mi_primer_string
```

## Wildcards
Los `wildcards` o `wild characters` son símbolos utilizados para representar uno o más caracteres. Se pueden utilizar con otros comandos para facilitar el procesamiento o búsqueda de archivos, directorios y datos en general.
**Wildcard**                | **Función**
---                         | ---
`*`                         | Asocia **uno o más** caracteres especificados por el usuario, con caracteres en un string con el que se opera. 
`?`                         | Asocia **solo un** caracter a la vez en un string. 
`[ ]`                       | Asocia **cuaquiera** de los caracteres dentro en un string.

```{admonition} Dato
:class: tip
El wildcard más usado es `*` porque es muy versátil.
```

<div id="ejercicio5_terminal"/>

## *Ejercicio: Uso básico de wildcards*

Por ejemplo, el wildcard `*` me permitiría encontrar todos los archivos en una carpeta que tengan la palabra `TESIS` en ellos. Primero generemos estos archivos:

```shell
$ cd ~/taller_unix/3_manejo_terminal 
$ touch MI_TESIS.tex MI_TESIS_tutor2.tex TESIS.tex TESIS_YA_ACABATE.tex TESIS_finaaaaal.tex TESIS_final.tex TESIS_tutor1.tex TESIS_tutor2.tex a_reporte_01.txt b_reporte_02.txt c_reporte_03.txt z_reporte_30.txt 
```

Podemos enlistar todos los archivos que empicen por el string `TESIS`:
```shell
$ ls -l TESIS*
```
```{image} ./img/wc_1.png
:alt: ./img/wc_1.png
:width: 700px
:align: center
```

Enlistar todos los archivos que terminen por el string `.tex`:
```shell
$ ls -l *.tex
```
```{image} ./img/wc_2.png
:alt: ./img/wc_2.png
:width: 700px
:align: center
```

Buscar todos los archivos contengan la palabra `TESIS` pero con 3 caracteres desconocidos antes:
```shell
$ ls -l ???TESIS*
```
```{image} ./img/wc_3.png
:alt: ./img/wc_3.png
:width: 700px
:align: center
```
Buscar los archivos que terminen con el número 1 o 2 en su nombre antes de la extensión del archivo:
```shell
$ ls -l *[1-2].tex
```
```{image} ./img/wc_4.png
:alt: ./img/wc_4.png
:width: 700px
:align: center
```

Encontrar los archivos que terminen en dos números del 1 al 3 y del 0 al 2 antes del formato del archivo:
```shell
$ ls -l *[0-3][0-2].txt
```
```{image} ./img/wc_5.png
:alt: ./img/wc_5.png
:width: 700px
:align: center
```

Encontrar todos los archivos con este formato `?_reporte_[0-3][0-3].txt`:
```shell
$ ls -l ?_reporte_[0-3][0-3].txt
``` 
```{image} ./img/wc_6.png
:alt: ./img/wc_6.png
:width: 700px
:align: center
```

Todos los archivos que contengan por `a` o `z`:
```shell
$ ls -l *[az]*
```
```{image} ./img/wc_7.png
:alt: ./img/wc_7.png
:width: 700px
:align: center
```
Borramos todos estor archivos 
```shell
$ rm *.tex *.txt
```

```{admonition} Importante
:class: seealso
Existen dos tipos de wildcards: `wildcards estándar` y `expresiones regulares`. Expresiones regulares se ven en [Sección 4](../04_Procesamiento_ficheros_regex_pipes/3_Expresiones_regulares.md)
```


## Operadores de redirección de datos I/O
Usualmente cuando trabajamos con datos, es necesario pasar el resultado de un comando a otro para hacer un procesamiento de datos apilado, como en un algortimo. Un `stream` o `corriente` esta hecha de datos. Es una corriente de datos. Un ejemplo muy familiar es el teclado y la pantalla. El teclado tiene una interfaz en donde por cada tecla presionada, un caracter se guarda en un archivo. Se dice entonces que es una `corriente de entrada`. Cuando la pantalla nos muestra lo que estamos escribiendo entonces la data sale hacia nosotros y eso convierte a la pantalla en una `corriente de salida`. Los dispositivos que hacen este tipo de transmisión de datos se llaman dispositivos `I/O` (input y output). Los operadores que se encargan de esto se conocen como `operadores de redirección`. Tres importantes son: 

**Comando**                 | **Función**
---                         | ---
`>`                         | Stream de salida de datos. Sobre escribre sobre un archivo.
`>>`                        | Stream de salida de datos. Adjunta nueva salida a datos preexistentes en un archivo.
`<`                         | Stream de entrada de datos. Recibe datos para procesamiento con algun comando.

<div id="ejercicio6_terminal"/>

## *Ejercicio: Output streams, input streams*
Creemos un archivo que contenga muchos géneros de bacterias raras mediante los comandos `echo` y un operador de salida `>`, y luego visualizamos con el comando `cat`.
```shell
$ cd ~/taller_unix/3_manejo_terminal
$ echo -e "\nRickettsia\nOrientia\nWolbachia\nAegyptianella\nAnaplasma\nCowdria\nEhrlichia\nNeorickettsia\nCaedibacter\nHolospora\nLyticum\nOdyssella\nSymbiotes\nTectibacter" > bacterias_generos.txt
$ cat bacterias_generos.txt
```
```{image} ./img/wc_8.png
:alt: ./img/wc_8.png
:width: 600px
:align: center
```
Ahora vamos a agregar un género al final usando el operador `>>`. 
```shell
$ echo -e "\nEscherichia\n:D" >> bacterias_generos.txt
$ cat bacterias_generos.txt
```
```{image} ./img/wc_9.png
:alt: ./img/wc_9.png
:width: 600px
:align: center
```
Ahora usaremos el comando sort para reordenar todos los géneros. Sin embargo notamos que el archivo original no cambia nunca. 
```shell
$ sort < bacterias_generos.txt
```
```{image} ./img/wc_10.png
:alt: ./img/wc_10.png
:width: 600px
:align: center
```
Para hacer un cambio sobte `bacterias_generos.txt`, usamos este comando. Notamos que ahora no usamos `>>` sino solo `>`. Esto va a borrar el contenido previo con géneros desordenados y ahora los va a ordenar. El cambio no se puede deshacer, así que ten cuidado con el operador `>` para que no pierdas datos.
```shell
$ (sort < bacterias_generos.txt) > bacterias_generos_sorted.txt
$ cat bacterias_generos_sorted.txt
```
```{image} ./img/wc_11.png
:alt: ./img/wc_11.png
:width: 600px
:align: center
```
```{admonition} Advertencia
:class: warning
El operador `>` sobre escribe archivos. Ten cuidado al usarlo para que no pierdas datos.
```