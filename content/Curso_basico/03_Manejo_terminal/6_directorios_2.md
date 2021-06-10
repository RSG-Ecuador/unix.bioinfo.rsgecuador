# Directorios y archivos en UNIX: Parte 2

La lista de comandos en UNIX es extensa. Por eso, a partir de esta sección se explica la funcionalidad básica de los comandos y se da un ejemplo de su aplicación. 

```{admonition} Nota
:class: note
En tu deber debes replicar las operaciones con los comandos descritos aquí, tal como lo has estado haciendo.
```

**Comando**          | **Función**
---                  | ---
`file [archivo]`     | Determina el tipo de archivo.
`find`               | Busca archivos en un directorio específico. 
`cat`                | Visualizar contenido de un archivo. Escribe el contenido del archivo de manera secuencial a la salida estándar, a la ventana de Terminal.
`less`               | Leer contenido de un archivo sin interrumpir la pantalla de Terminal. Similar a `Vim` pero sin opción para escribir. **Se sale del modo visualización con** <kbd>q</kbd>.
`gzip`               | Compresión de archivos. Genera un archivo de extensión `.gz`. 
`tar`                | Genera un archivo de archivos. Permite tener un conjunto varios archivos y directorios. Útil para comprimir carpetas con subdirectorios y archivos. Genera archivos `.tar`. Se puede combinar con compresión gzip y generar archivos `tar.gz`
`zcat`               | Visualizar contenido de archivos con compresión `.gz`. **Se sale del modo visualización con** <kbd>q</kbd>.
`zless`              | Igual que `less` pero para visualizar un archivo comprimido por `gzip`.
`head`               | Visualizar primeras líneas de un archivo. 
`tail`               | Visualizar últimas líneas de un archivo. 
`which`              | Indica el directorio donde se encuentra un particular comando o programa que se haya podido encontrar usando los directorios guardados en la variable de estado `PATH`.
|<img width=450/>    | |

<div id="ejercicio7_terminal"/>

## *Ejercicio: Uso de comandos*
Uno de estos comandos ya lo vimos: `cat`. Usa los siguientes comandos en tu deber. ¿Qué hace cada uno?

```{admonition} Instrucción
:class: hint
En tu notebook designa una celda `Markdown` para describir el funcionamiento de cada uno de estos comandos a medida que los vas usando.
```

```shell
$ less -N bacterias_generos.txt
```
```shell
$ gzip -c bacterias_generos.txt > bacterias_generos.txt.gz
$ zcat < bacterias_generos.txt.gz
```
```shell
$ bzip2 -zk bacterias_generos.txt
$ ls
```
```shell
$ zless < bacterias_generos.txt.gz
```

```shell
$ tar -czvf bacterias_generos.tar.gz bacterias_generos.txt
$ ls
```

```shell
$ tar -xzvf bacterias_generos.tar.gz
$ ls
```


```shell
$ head bacterias_generos.txt
```

```shell
$ tail bacterias_generos.txt
```

Si eres Linux corre este comando.
```shell
$ which bash
```
Si eres MacOS corre este comando.
```shell
$ which zsh
```
```shell
$ which -a python
```
```shell
$ find ~/taller_unix -name deber_1.ipynb
```
```shell
$ file ~/taller_unix
$ file ~/taller_unix/3_manejo_terminal/bacterias_generos.txt.gz
```


## Servidor Local

El servidor local se refiere a tu computadora. Los servidores son computadoras que están diseñadas para procesar información y enviársela a otro computador a través de una red. Dos tipos de servidores bien conocidos son los servidores HPC y los servidores web. Ambos representan una red de computadoras que procesan información y se comunican con otras computadoras. Cada computadora entonces puede evaluarse con varios descriptores de estado, que explican cómo opera la computadora en un momento en particular. A continuación se presenta una lista de comandos importantes que sirven para monitorear la computadora y entender qué está procesando en tiempo real, la cantidad de memoria que ocupa, y otros interesantes.

**Comando**                 | **Función**
---                         | ---
`echo [variable]`           | Escribe argumentos a través del standard output stream, es decir, al monitor por default. Puede usarse para imprimir variables y strings arbitrarios.
`hostname`                  | Permite visualizar o ver la información de dominio y nombre del equipo, del computador. Es la información que permite identificar al computador en la red. 
`uname`                     | Brinda información sobre hostname, kernel del computador y la arquitectura del procesador.
`lsb_release`               | Especifica información sobre Linux Standard Base (LSB) de la distribución de Linux que se está usando en la computadora. 
`df`                        | Guarda estadísticas sobre la cantidad de espacio de memoria libre en el sistema de archivos montado.
`top`                       | Muestra todos los procesos que tiene activos el sistema operativo en tiempo de ejecución. Permite ver de manera dinámica en tiempo real cada proceso.
`chmod`                     | Permite cambiar el modo de acceso a archivos y carpetas.
|<img width=300/>           | |

<div id="ejercicio8_terminal"/>

## *Ejercicio: Conocer el sistema*

```{admonition} Instrucción
:class: hint
En tu notebook designa una celda `Markdown` para describir el funcionamiento de cada uno de estos comandos a medida que los vas usando.
```
```shell
$ echo Hola Mundo!
$ foo=128932
$ echo $foo
```
```shell
$ hostname
```
```shell
$ uname
$ uname -a
$ uname -srm
```
El comando lsb_release solo está disponible para sistemas operativos Linux.
```shell
$ lsb_release -a
```
El comando `top` debería mostrar una pantalla que cambia de vez en cuando su contenido. 
```shell
$ top
```
```{image} ./img/top.png
:alt: ./img/top.png
:width: 700px
:align: center
```
Para ver el uso del comando `chmod` podemos crear un archivo y quitarle ciertos permisos, como el permiso de se pueda escribir sobre este. 
```shell
$ cd ~/taller_unix/3_manejo_terminal
$ mkdir test_chmod
$ cd test_chmod
$ touch archivo.txt
$ ls -l
```
```{image} ./img/cmod1.png
:alt: ./img/chmod1.png
:width: 700px
:align: center
```
```shell
$ chmod u=r archivo.txt
$ ls -l
```
Notar como ahora el archivo pasó de un estado `-rw-r--r--` a uno `-r--r--r--`, por lo que ya no se puede escribir en él.
```{image} ./img/cmod2.png
:alt: ./img/cmod2.png
:width: 700px
:align: center
```
Borremos estos archivos
```shell
$ cd ../
$ rm -rf test_chmod
```
Ahora, solo para no olvidar cómo se usa operadores de output stream creamos un archivo con los datos del usuario
```shell
$ cd ~/taller_unix/3_manejo_terminal
$ echo "Datos de mi computador: \n" > datos_computador.txt
$ hostname >> datos_computador.txt && echo "\n" >> datos_computador.txt
$ uname -a >> datos_computador.txt && echo "\n" >> datos_computador.txt
$ df -h >> datos_computador.txt && echo "\n" >> datos_computador.txt
$ less -N datos_computador.txt
```