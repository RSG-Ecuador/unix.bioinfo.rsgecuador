# Variables de ambiente

Las variables de ambiente permiten transferir información a los programas y subrutinas sobre el ambiente de programación. Esta información puede ser necesaria para el funcionamiento de los programas o para controlar el comportamiento de la shell. Para poner un ejemplo muy concreto, la variable de ambiente `PATH` es probablemente una de las mas importantes, ya que guarda en una lista separada por comas todos los directorios donde pueden encontrarse programas que podemos usar en la shell. 

<div id="ejercicio9_terminal"/>

## *Ejercicio: Variable `PATH`*

Por ejemplo, cuando instalamos Jupyter Lab con `conda`, fue necesario una instalación de Python. Esta versión de Python debe estar accesible para que `conda` pueda funcionar. Si activamos nuestro ambiente de conda y preguntamos al sistema qué versión de Python está usando debería salir esta versión de Python instalada por `conda`. El resultado de usar `which python` es un directorio. Este directorio debe estar disponible en mi `PATH` y es por eso que `which` puede encontrar la versión de Python.

```shell
$ conda activate bash 
$ which python
```
```{image} ./img/path.png
:alt: ./img/path.png
:width: 700px
:align: center
```

Uno de los lugares donde es posible configurar varios aspectos de la shell Bash, siendo uno de ellos las variables de ambiente, es el script `~/.bashrc`. Este script posee muchas configuraciones para la shell que se leen cada vez que se abre una nueva ventana de Terminal. En el caso de MacOS se trata de `~/.zshrc`. Si examinamos las últimas 15 líneas de alguno de estos archivos, es aquí donde la instalación de `conda` hizo ciertas configuraciones para que pueda ser detectada por el sistema y se pueda usar como herramienta de línea de comandos:

Si eres MacOS:
```shell
$ tail -n 15 ~/.zshrc
```
Si eres Linux:
```shell
$ tail -n 15 ~/.bashrc
```
```{image} ./img/tzsh.png
:alt: ./img/tzsh.png
:width: 700px
:align: center
```

**Comando**                 | **Función**
---                         | ---
`HOME`                      | Guarda el directorio `/home/usuario`. Cambia de acuerdo al usuario. En mi computador guarda `/Users/j`.
`PATH`                      | Lista de directorios separados por " : " que le indican a la shell dónde buscar archivos ejecutables.
`SHELL`                     | Guarda el directorio de la shell predeterminada en el sistema.
`~/.bashrc`                 | Este script posee configuraciones para la shell que se leen cada vez que se abre una nueva ventana de Terminal en Linux.
`~/.zshrc`                  | Mismo funcionamiento que `~/.bashrc` pero en sistemas operativos MacOS modernos.
`printenv`                  | Muestra todas las variables de estado de la shell. 

<div id="ejercicio10_terminal"/>

## *Ejercicio: Variables de ambiente*

```{admonition} Instrucción
:class: hint
En tu notebook designa una celda `Markdown` para describir el funcionamiento de cada uno de estos comandos a medida que los vas usando.
```
Vamos a ver qué guardan estas variables en nuestras computadoras. 
```shell 
$ echo $PATH
$ echo $HOME
$ echo $SHELL
$ printenv
```
