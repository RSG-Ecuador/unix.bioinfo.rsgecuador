# Directorios y archivos en UNIX: Parte 1
## Arquitectura UNIX
Un **directorio** es una carpeta. Los sistemas operativos en general se organizan en directorios, subdirectorios y archivos. Entonces los directorios también son **ubicaciones dentro de la memoria del computador**, como ubicaciones en un mapa. Un **archivo** o *fichero* es un conjunto de **información digital** (bytes guardados en memoria) en algún formato como texto plano, PNG, markdown y miles de otros formatos.

UNIX se organiza por un **sistema de archivos** en estructura de árbol invertido. Todo en Linux y sistemas UNIX es un archivo o un directorio. Esta jerarquía comienza con el directorio raíz (*root diectory*), indicado por `/`. Este directorio contine subdirectorios y archivos importantes con sotfware esencial para el funcionamiento del sistema operativo y software instalado o creado por el usuario. Para información detallada visita http://www.linfo.org/filesystem.html o también http://www.linfo.org/index.html. Un resumen rápido de los subdirectorios en `/` es:

<center>

Directorio | Funcnión de archivos y subdirectorios
---        | --- 
`/bin  `   | Ejecutables para funcionamiento mínimo esencial del sistema operativo como arrancar, reparar, las shell como `Bash` o `ZSH` y comandos UNIX como `ls`, `echo`, `mv`, `tar`, `vi` y varios otros.
`/boot `   | Ejecutables necesarios para arrancar el sistema operativo.
`/dev  `   | Dispositivos hardware y controladores.
`/etc  `   | Configuración adicional de sistema.
`/home  `  | Datos de usuario.
`/lib  `   | Librerías y módulos de kernel.
`/media`   | Puntos de montaje para dispositivos removibles.
`/mnt  `   | Puntos de montaje para sistemas de archivos temporales (particiones).
`/opt  `   | Paquetes opcionales de software.
`/sbin `   | Ejecutables para administración del sistema operativo disponibles para el usuario principal del computador o `sudo user`. Es similar a `/bin`, pero un `sudo bin`.
`/srv  `   | Datos para servicios del sistema, como data de servidores HTTP, entre otros.
`/tmp  `   | Archivos temporales. Los archivos se borran cuando el sistema reinicia.
`/usr  `   | Jerarquía secundaria. Actúa como root `/`, pero se usa más para customización creada por el usuario e instalación de software, para prevenir dañar los archivos en las otras carpetas del directorio raíz. Esta contiene directorios `/bin`, `/sbin`, `/lib`, `/share` y otros. 
`/var  `   | Datos variables, especialmente archivos generados en tiempo de ejecución. Esta información no se borra de manera automática.

</center>

Para **acceder** a un directorio se usa el comando `cd`. El argumento de este comando es un `directorio`. Miremos un ejemplo. Ejecuta los comandos:
```shell
$ cd /
$ ls
```
Hay varios otros directorios importantes como se podrá ver. Estos deberán ser revisados por tu cuenta. Vamos a acceder al directorio `/` y vamos a mostrar su contenido. En el sistema operativo Linux se puede ver de esta manera:

```{image} ./img/root_ubuntu.png
:alt: ./img/root_ubuntu.png
:width: 620px
:align: center
```

En el sistema operativo MacOS varía un poco, debido a que Apple ha aplicado algunas adaptaciones para su sistema operativo, sin embargo, conserva los directorios esenciales como `/bin`, `/sbin` y `/usr`. Se puede ver de esta manera:

```{image} ./img/root_mac.png
:alt: ./img/root_mac.png
:width: 700px
:align: center
```

## *Algunos comandos para operar con directorios y archivos*
**Comando**                     | **Función**
---                             | ---
`pwd`                           | Imprime el directorio de trabajo actual.
`cd ..`                         | Dirigirse 1 directorio atrás.
`cd ../..`                      | Dirigirse 2 directorios atrás.
`clear`                         | Limpia la terminal
`mkdir [nombre de directorio]`  | Crear un directorio
`touch [nombre de archivo]`     | Crear un archivo
`rm [archivos]`                 | Remover un archivo. No se puede usar para elminiar directorios.
`rm - r [directorio]`           | Remover recursivamente. Se usa para remover directorios y subdirectorios.
`rm - rf [directorio]`          | Remover recursivamente de manera forzada. Se usa para evitar que el sistema evite elminiar un directorio.
`mv [desde] [hacia]`            | Mover un archivo a un directorio.
`cp [desde] [hacia]`            | Copiar un archivo a un directorio.
|<img width=500/>               | |

## Directorio de inicio / Home directory
```shell
$ cd ~
```
El directorio de inicio o home, nombrado por el caracter tilde `~`. Al abrir Terminal este automáticamente se dirige a `~`. Contiene todos los directorios con contenido creado por el usuario y software específico. Algunos directorios son `~/Desktop` para el escritorio, `~/Documents` para los documentos, etc. 

<div id="ejercicio2_terminal"/>

## *Ejercicio: Crear y elminiar directorios. Crear, mover y elminiar archivos.*
Vamos a crear directorios, subdirectorios y un archivo de texto. Luego veremos el resultado. Después borraremos el directorio de manera recursiva. 

```{admonition} Tip
:class: Tip
Notemos que cuando queremos nombrar un archivo o un directorio con dos palabras, en lugar de usar un espacio entre ellos usamos un **guión bajo**, porque así nos evitamos problemas para acceder a estos directorios desde Terminal. **Procura dar nombres que no tengan espacios en blanco a los archivos y carpetas**. 

Por ejemplo: `asi no.png`, `asi_si.png`.
```

```shell
$ cd ~/taller_unix/3_manejo_terminal 
$ mkdir prueba
$ cd prueba
$ mkdir directorio_publico
$ mkdir .directorio_secreto
$ touch README.txt
$ ls
```

```{image} ./img/mkdir1.png
:alt: ./img/mkdir1.png
:width: 700px
:align: center
```

Como se puede ver en la captura de pantalla de Terminal, el directorio `~/taller_unix/3_manejo_terminal/prueba` que se creó contiene un directorio escondido `~/taller_unix/3_manejo_terminal/prueba/.directorio_secreto`, un directorio público `~/taller_unix/3_manejo_terminal/prueba/.directorio_secreto` y un archivo de texto `~/taller_unix/3_manejo_terminal/prueba/README.txt`. Cuando usamos el comando `ls` **dentro del directorio** `~/taller_unix/3_manejo_terminal/prueba/`, vemos todo menos el directorio secreto. Para revelarlo usamos la opción `-a`.

```shell
$ ls -a
```
Además podemos revelar el directorio completo hacia la carpeta `~/prueba` con el comando `pwd`, que significa *print working directory*. Como se ve en la imagen abajo, el directorio completo es `/Users/j/taller_unix/3_manejo_terminal/prueba` y no `~/taller_unix/3_manejo_terminal/prueba`. Primero hay que notar que son el mismo directorio. Segundo, esto ocurre porque el caracter `~` es un alias al directorio `/Users/j/`, entonces significa lo mismo que `~`. Los **alias** son útiles para acortar directorios o comandos.
```shell
$ pwd
```

```{image} ./img/mkdir2.png
:alt: ./img/mkdir2.png
:width: 700px
:align: center
```

En esta imagen, el comando `ls -a` revela, además del directorio escondido, dos nuevos directorios extra muy importantes: `./` y `../`. Estos directorios significan *directorio actual* y *directorio anterior*, respectivamente. Sirven para poder operar dentro del directorio actual o para salir del directorio actual, respectivamente. Salgamos del directorio hacia `~/taller_unix/3_manejo_terminal` y creemos un archivo que vamos a mover hacia `~/taller_unix/3_manejo_terminal/prueba`. Será un archivo ejecutable de Python:
```shell
$ cd ..
$ touch archivo_para_mover.py
$ ls -l
```

```{image} ./img/mkdir3.png
:alt: ./img/mkdir3.png
:width: 700px
:align: center
```

Para moverlo podemos usar dos estrategias:
1. Desde `~/taller_unix/3_manejo_terminal/` especificar que quiero mover el archivo `archivo_para_mover.py` hacia `~/taller_unix/3_manejo_terminal/prueba`
2. Desde `~/taller_unix/3_manejo_terminal/prueba` especificar que quiero mover el archivo `archivo_para_mover.py` hacia `~/taller_unix/3_manejo_terminal/prueba`

Si usamos la estrategia 1, operamos dentro de `~/taller_unix/3_manejo_terminal` y luego verificamos con `ls` que este se haya movido correctamente hacia `~/taller_unix/3_manejo_terminal/prueba`:
```shell
$ mv archivo_para_mover.py prueba/
$ ls prueba
```

```{image} ./img/mkdir4.png
:alt: ./img/mkdir4.png
:width: 700px
:align: center
```

Si usamos la estrategia 2, primero devolvamos el archivo `archivo_para_mover.py` de nuevo a `~/taller_unix/3_manejo_terminal` y después lo retornamos a `~/taller_unix/3_manejo_terminal/prueba`. Operamos dentro de `~/taller_unix/3_manejo_terminal/prueba`:
```shell
$ cd prueba
$ mv archivo_para_mover.py ..
$ mv ../archivo_para_mover.py ./
$ ls
```

```{image} ./img/mkdir5.png
:alt: ./img/mkdir5.png
:width: 700px
:align: center
```

Ahora, vamos a eliminar el directorio `~/taller_unix/3_manejo_terminal/prueba` porque ya no nos va a servir. Usamos el comando `rm -r`. Operamos desde `~/taller_unix/3_manejo_terminal`.
```shell
$ cd ..
$ rm -r prueba
$ ls -l
```

```{image} ./img/mkdir6.png
:alt: ./img/mkdir6.png
:width: 700px
:align: center
```

Nota cómo el directorio `~/taller_unix/3_manejo_terminal/prueba` ya no existe dentro de `~/taller_unix/3_manejo_terminal`. Ya que hemos visto como elminiar directorios, ahora veremos como eliminar archivos. Creemos nuevamente el directorio `~/taller_unix/3_manejo_terminal/prueba`. Operamos desde `~/taller_unix/3_manejo_terminal`. Creamos un archivo ejecutable de C++.

```shell
$ mkdir prueba
$ touch prueba/borrar.cpp
$ cd prueba
$ ls
```

```{image} ./img/mkdir7.png
:alt: ./img/mkdir7.png
:width: 700px
:align: center
```

Ahora usamos el comando `rm` sin ninguna opción. El argumento es `borrar.cpp`. Vemos que ya no quedan más que los directorios `../` y `/.` en la carpeta.
```shell
$ rm borrar.cpp
$ ls -a
```

```{image} ./img/mkdir8.png
:alt: ./img/mkdir8.png
:width: 700px
:align: center
```


## Rutas absolutas y relativas

En el ejemplo anterior hemos usado rutas absolutas y relativas de manera satisfactoria. ¿Cómo? Una **ruta absoluta** es un directorio completo, desde el *root directory*. Una **ruta relativa** es un directorio incompleto y se especifica la dirección desde cualquier directorio actual de trabajo, sin necesidad que sea desde el *root directory*. Por ejemplo, si recordamos el ejemplo anterior, el archivo `archivo_para_mover.py` debía moverse hacia `~/taller_unix/3_manejo_terminal/prueba` y operamos dentro de `~/taller_unix/3_manejo_terminal/prueba`. Lo logramos con el comando:

```shell
$ mv ../archivo_para_mover.py ./
```

Este comando significa: desde el directorio `~/taller_unix/3_manejo_terminal/prueba`, mover el archivo `archivo_para_mover.py` que se encontraba en una carpeta anterior a `~/taller_unix/3_manejo_terminal/prueba` (es decir, en `~/taller_unix/3_manejo_terminal`) y moverlo al directorio actual. Para especificar el directorio anterior se usó `../` y para especificar el directorio actual se usó `./`. 

Podíamos usar rutas absolutas para hacer la misma operación. En mi computador, el comando hubiera cambiado a:

```shell
$ mv /Users/j/taller_unix/3_manejo_terminal/archivo_para_mover.py /Users/j/taller_unix/3_manejo_terminal/prueba
```

```{admonition} Nota
:class: Note
Significan lo mismo, ya que especifican el directorio de inicio y el final, pero la ruta relativa es más abreviada. Hay que identificar las cuándo es conveniente trabajar con uno de ellos en particular. Se usan los directorios absolutos usualmente cuando se quiere revelar la locación de un archivo, o cuando se necesita rastrear cambios de ubicación. Los directorios relativos son fáciles de ejecutar y evitan la necesidad de usar nuestra memoria al escribir comandos.
```
<div id="ejercicio3_terminal"/>

## *Ejercicio: Directorios absolutos y relativos*
Creemos varios subdirectorios dentro de `~/taller_unix/3_manejo_terminal/prueba`. Operamos desde `~/taller_unix/3_manejo_terminal` con los comandos:
```shell
$ cd ~/taller_unix/3_manejo_terminal
$ mkdir prueba/p1
$ mkdir prueba/p1/p2
$ mkdir prueba/p1/p2/p3
$ mkdir prueba/p1/p2/p3/p4
$ mkdir prueba/p1/p2/p3/p4/p5
$ cd prueba
```

```{image} ./img/mkdir9.png
:alt: ./img/mkdir9.png
:width: 700px
:align: center
```

Para ver nuestra jerarquía de carpetas podemos usar el comando. Operamos desde `~/taller_unix/3_manejo_terminal/prueba`. Usamos `pwd` para descubrir la ruta actual:
```shell
$ ls -R
$ pwd
```

```{image} ./img/mkdir10.png
:alt: ./img/mkdir10.png
:width: 700px
:align: center
```

El directorio `./p1/p2/p3/p4/p5` es relativo porque usa `./` para especificar que se trabaja desde `~/taller_unix/3_manejo_terminal/prueba`, el directorio actual. Podemos entrar en `./p1/p2/p3/p4/p5` desde `~/taller_unix/3_manejo_terminal/prueba` y usar `pwd` para revelar la ruta absoluta:

```shell
$ cd ./p1/p2/p3/p4/p5
$ pwd
```

```{image} ./img/mkdir11.png
:alt: ./img/mkdir11.png
:width: 700px
:align: center
```

Es evidente que `./p1/p2/p3/p4/p5` también significa `/Users/j/taller_unix/3_manejo_terminal/prueba/p1/p2/p3/p4/p5`, ya que solo son dos formas de especificar un directorio: realtiva y absoluta. Ahora, regresemos a `~/taller_unix/3_manejo_terminal/prueba` de manera relativa. Usamos 5 veces `../`:

```shell
$ cd ../../../../..
$ pwd
```

```{image} ./img/mkdir12.png
:alt: ./img/mkdir12.png
:width: 700px
:align: center
```

Podemos borrar toda esta colección así:

```shell
$ rm -r p1
```
<div id="ejercicio4_terminal"/>

## *Ejercicio: Renombrar archivos y copiar archivos*

A veces solo queremos renombrar un archivo. Esto se puede lograr mediante el comando

`mv [nombre viejo] [nombre nuevo]`

Es importante usar directorios, porque `mv` trabaja con directorios. Usemos relativos porque es más fácil. Creemos un archivo Markdown renombrémoslo con un nombre bonito:
```shell
$ touch nombre_feo.md
$ ls -la
```

```{image} ./img/mkdir13.png
:alt: ./img/mkdir13.png
:width: 700px
:align: center
```

```shell
$ mv ./nombre_feo.md ./nombre_bonito.md 
$ ls -la
````

```{image} ./img/mkdir14.png
:alt: ./img/mkdir14.png
:width: 700px
:align: center
```

Ahora, usemos el comando `cp` para crear una copia de este archivo. Este comando es similar a `mv`:

`cp [nombre viejo] [nombre nuevo]`

Primero lo copiamos en la misma carpeta. **Hay que renombrarlo**.

```shell
$ cp nombre_bonito.md ./nombre_bonito_2.md
$ ls -la
````
```{image} ./img/mkdir15.png
:alt: ./img/mkdir15.png
:width: 700px
:align: center
```
Podemos copiarlo incluso dentro de una carpeta. Si no vamos a generar un duplicado en la misma carpeta no es necesario cambiar el nombre. Podemos solo especificar el directorio de destino.
```shell
$ mkdir nueva_carpeta
$ ls
$ cp nombre_bonito.md ./nueva_carpeta
$ ls ./nueva_carpeta
```
```{image} ./img/mkdir16.png
:alt: ./img/mkdir16.png
:width: 700px
:align: center
```
Podemos borrar todo el contenido de `./prueba`:

```shell
$ rm *.md
$ rm -r nueva_carpeta
```