# Comandos en la `shell`
Ejecuta el siguiente comando en Terminal. ¿Cuál es el resultado arrojado?
```shell
$ ls
```
Ahora escribe este. ¿Cuál es la diferencia?
```shell
$ ls -la
```

Un **comando** es una instrucción ejecutable interpretada por la Shell y dirigida al sistema operativo. Los comandos pueden tener variantes de si mismos. Los usuarios podemos escribir comandos mediante la Terminal. Un ejemplo de un comando es `ls`. Este permite mostrar el contenido de un directorio o carpeta. Tiene algunas variantes. Dos ejemplos que acabamos de ver son solo *mostrar archivos y carpetas* o una más elaborada: *mostrar archivos y carpetas públicas y escondidas enlistadas*. Los comandos tienen la forma:

`comando [opciones] [argumentos]`

Las opciones indican qué variación del comando se va a ejecutar, cambiando ligeramente la forma en que funciona. El argumento indica sobre qué objeto el comando va realizar su acción. Generalmente puede ser un solo archivo o una serie de archivos. No siempre los comandos requieren argumentos, como los que acabamos de ver.

Los comandos distinguen entre mayúsculas y minúsculas. **Comando** y **comando** no son lo mismo. Por ejemplo, ejecuta `ls -r` y luego `ls -R`. 


```{admonition} Nota
:class: note
No te asustes por el resultado. ¿Cuál es la diferencia entre las opciones `-r` y `-R`?
```



Las opciones generalmente están precedidas por un guión (-) y, para la mayoría de los comandos, se pueden unir más de una opción, en la forma:

`comando - [opción] [opción] [opción]`


## Algunas opciones para `ls`
**Comando**  | **Función**
--------------    | --------------
`ls`              | enlista los archivos y carpetas en un directorio
`ls -a`           | Nos muestra los archivos y directorios dentro del directorio actual, incluyendo los archivos y directorios ocultos.
`ls -l`           | Muestra toda la información de cada archivo en forma de lista: usuario, grupo, permisos, tamaño, fecha y hora de creación.
`ls -la`          | Opciones `-l` y `-a` combinadas.
`ls -lh`          | Enlistar archivos y su uso de memoria.
`ls -t`           | Ordena los archivos por fecha de modificación.
`ls -X`           | Ordena los archivos por extensión.
`ls -R`           | Muestra el contenido de todos lossubdirectorios de forma recursiva.
`ls -S`           | Ordena los resultados por tamaño dearchivo.
`ls *[patrón]`    | Ver solo archivos con un patrón específico.
|<img width=250/> | |

<div id="ejercicio1_terminal"/>

## *Ejercicio: Algunos casos de `ls`*

Para enlistar todos los directorios y todos los archivos en la carpeta principal de trabajo, en función de su tamaño en bytes, podemos usar estos dos comandos en la Terminal (abre una ventana de terminal, escribe el comando y da un enter). Muestro el resultado de mi computador:
```shell
$ cd ~
$ ls -lhr
```

```{image} ./img/ls1.png
:alt: ./img/ls1.png
:width: 700px
:align: center
```

Ahora le vamos a agregar la opción `-a` al comando anterior. ¿Cuál crees que será el cambio? Ejecuta el comando después de que hayas adivinado. Mira la tabla de arriba. ¿Qué hacía el comando `-a`?
```shell
$ ls -lahr
```
¿Qué hará este comando?
```shell
$ ls -lahtr
```
¿Y este comando?
```shell
$ ls -l -a -h -t -r
```


## `man`: el manual de comandos del sistema operativo
```shell
$ man
What manual page do you want?
```
El manual de comandos del sistema operativo se llama mediante el comando `man`, como se ve justo arriba. ¡Los argumentos de este comando son otros comandos! Ejecuta el siguiente comando en Terminal. Debería resultar en la siguiente imagen. Si deseas salir presiona `q`. Para navegar por el manual usa las flechas del teclado &larr; &uarr; &darr; &rarr; o el mouse.
```shell
$ man man
```

```{image} ./img/man_cmd.png
:alt: ./img/man_cmd.png
:width: 700px
:align: center
```

El manual debes usar siempre que quieras entender más sobre un comando a usar por la shell. Por ejemplo, para ver todas las posibles opciones que se pueden usar con el comando `ls`, ejecuta el comando:
```shell
$ man ls 
```
Aparecerán varias de las opciones del comando si bajamos un poco, como se muestra a continuación. Varias de las opciones más comunes y sus funciones se enlistan abajo. Es importante memorizar algunas cuantas útiles. A veces, cuando se escriben programas complejos para el sistema operativo es importante conocer las funciones menos comunes de cada comando ya que pueden ser de gran ayuda.

```{image} ./img/man_ls.png
:alt: ./img/man_ls.png
:width: 700px
:align: center
```

## Comando `help`

Otro comando muy util para conseguir ayuda en sistemas Linux es `help`. 

```{admonition} MacOS
:class: attention
En MacOS no funciona, sin embargo, `man` es suficiente.
```

En sistemas Linux, `help` es similar a `man`, ya que permite tener información sobre algún comando en específico, sus posibles opciones, sus argumentos. Por ejemplo, para obtener ayuda sobre cómo usar `help` usando el mismo `help` (excelente), escribe esto en Terminal y dale enter:

```shell
$ help help
```

```{image} ./img/help1.png
:alt: ./img/help1.png
:width: 650px
:align: center
```

Podemos averiguar información sobre algún comando en particular, por ejemplo, el comando `echo`, del que aprenderemos luego:

```shell
$ help echo
```

```{image} ./img/help2.png
:alt: ./img/help2.png
:width: 650px
:align: center
```
