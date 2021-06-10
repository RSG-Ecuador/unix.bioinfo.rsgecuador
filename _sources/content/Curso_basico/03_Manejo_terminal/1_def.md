# Bash como shell de GNU/Linux

```{image} ./img/bash.png
:alt: ./img/bash.png
:width: 300px
:align: center
```

## Definiciones

Los sistemas operativos utilizan un programa para interactuar con el usuario en un bajo nivel. Este programa es la `shell` y es un `intérprete de comandos`. Los `intérpretes` leen código escrito por seres humanos y lo traducen para que el sistema operativo entienda qué hacer. Este intérprete entiende en un **lenguaje de programación** específico. Los intérpretes no son parte del sistema operativo, pero si ejecutan comandos para operar con este. Se llama shell por la palabra en Inglés caparazón, y denota una capa externa de interacción entre el usuario y el sistema operativo. `Bash` es una de las shell más comunes para sistemas operativos UNIX como Linux y MacOS. Antes de adentrarnos, veamos algunas definiciones. Entiéndelas lo mejor que puedas. Querrás a veces volver a revisarlas para facilitar la lectura:

Lenguaje de programación
: Es un lenguaje formal compuesto de comandos, instrucciones y sintaxis para crear varios tipos de lógica a través de un computador. Se utilizan con frecuencia para implementar algoritmos. Algunos ejemplos son Bash, AWK, Python, C++, C, Julia, Sed, Java. 

Algoritmo
: Secuencia finita de instrucciones bien definidas, computables, diseñada para resolver problemas lógicos y hacer computación. Se estudian formalmente en matemáticas y en ciencias de la computación. Se usan frecuentemente para procesar datos, hacer cálculos o automatizar procesos.

Lenguajes de bajo nivel
: Lenguajes de programación con sintaxis diseñada para la interpretación de la computadora. Son dependientes de la computadora y necesitan un ensamblador para traducir el código a lenguaje de máquina y así las computadoras entiendan qué deben hacer.

Lenguajes de alto nivel
: Lenguajes de programación con sintaxis diseñada para la interpretación del programador. Se parece mucho al lenguaje utilizado por los humanos para comunicarnos. Es fácil de entender. Necesita de compiladores o intérpretespara traducirlo a lenguaje de máquina y así las computadoras entiendan qué deben hacer.

Shell
: Programa que expone los servicios de un sistema operativo al usuario o a otro programa. En UNIX el la shell leecomandos y los ejecuta. Estos comandos pueden ser escritos en consola, es decir, por una interfaz de línea de comando (CLI por sus siglas en Inglés), o en una interfaz de usuario gráfica que emula una consola (GUI por sussiglas en Inglés) como Terminal. Existen varias shell para los sistemas operativos UNIX, como Bash, ZSH, KSH, ASH,entre otras. 

Consola
: Es una CLI para receptar comandos que un usuario escribe para la shell. Es independiente de una interfaz de usuario gráfica. Básicamente una interfaz donde solo hay texto. 

Terminal
: Es un emulador de una consola ya que cumple la función de un CLI pero a través de una GUI. Esto implica que poseebotones para facilitar el acceso al usuario. Usaremos varias veces la Terminal durante este curso, así que te animamos a aprender a usarla muy bien.

Bash
: Es una shell de UNIX y también un lenguaje de programación, creada por Brian Fox para el Proyecto GNU. Así,cuando abrimos la terminal o consola, podemos interactuar con Bash por su propio lenguaje de programación de altonivel. Es un lenguaje interpretado y se utiliza para el control de las tareas que lleva a cabo un sistema de computación. 

Interfaz por línea de comandos
: Se refiere a una interfaz de programación que usa ejecuta sentencias sin ayuda de botones y gráficas donde clickear con el mouse, sino donde solo se puede escribir código. Terminal es una interfaz de usuario por línea de comandos.

Interfaz gráfica
: Se refiere al uso de herramientas gráficas como botones y ventanas interactivas intuitivas para ayduar al programador a escribir código. Jupyter Lab y VSCode son ejemplos de interfaz gráfica para programación interactiva.


```{admonition} Nota Importante
:class: note
Cada vez que se vea un recuadro como este, estamos pidiendo que por favor ejecutes el código del recuadro en Terminal o en un cuaderno `jupyter`.
```

```shell
$ Ejecuta este código
```


