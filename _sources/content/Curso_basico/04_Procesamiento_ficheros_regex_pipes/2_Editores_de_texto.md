# Editores de texto

<div id="seccion4_2_1"/>

## ¿Qué es un editor de texto?
Es un programa que permite visualizar y manipular archivos de texto. Hay una gran variedad de estos programas, que pueden ser de interfaz de línea de comandos (CLI) o de interfaz gráfica (GUI). A continuación veremos dos editores de CLI y uno de GUI, pero ustedes pueden escoger y explorar otros editores.

<div id="seccion4_2_2"/>

## Editores de texto de CLI

<div id="seccion4_2_2_1"/>

### GNU Nano 
GNU nano es un editor de texto de CLI pequeño y amigable disponible para SO basados en UNIX. Además de la edición básica de texto, tiene funciones de deshacer/rehacer, colorear por sintaxis, búsqueda y reemplazo interactivos, sangría automática, números de línea, entre otras características. 

Para llamar al programa desde la terminal se debe escribir la palabra `nano` seguida del nombre del archivo que se quiere visualizar o modificar. Como ejemplo, usaremos el archivo `markdown (.md)` de la anterior sección, pero ustedes pueden usar cualquier otro archivo de texto:

```{admonition} Nota
:class: note
Recuerda que debes abrir una terminal en la carpeta en la que está el archivo.
```

```bash
nano 1_Archivos_formatos_comunes_Bioinformatica.md
```
Con esto accedemos al programa, que se visualiza de la siguiente forma: 

```{image} ./img/nano.png
:alt: ./img/nano.png
:width: 800px
:align: center
```

En este programa se puede añadir o eliminar texto de forma predeterminada, a diferencia de otros programas que tienen diferentes modos de uso como vi. Además, dentro del programa hay algunas opciones útiles para la lectura y modificación de archivos de texto. Para utilizar estas opciones se deben usar shorchuts de teclado, en las que el símbolo `^` significa la tecla `Control` o `Command` y la `M` es la tecla `Alt`. De esta forma, si queremos buscar la palabra *FASTA* en este archivo usamos el shorcut `Control-W`, añadimos la palabra y presionamos enter y el cursor se dirige al inicio de la palabra buscada, como se muestra a continuación: 

```{image} ./img/nano2.png
:alt: ./img/nano2.png
:width: 800px
:align: center
```
```{admonition} Nota
:class: note
Noten que en la búsqueda de una palabra se pueden añadir algunas opciones mediante shorcuts como sensibilidad a mayúsculas, reemplazar texto, entre otras.

Como se observa en la captura de pantalla del menú principal de nano, hay otros shorcuts que se pueden usar para justificar, cortar, y copiar texto; dirigirse a una línea específica; deshacer o rehacer cambios; entre otros.
```

Además, cuando se llama a nano desde la terminal se pueden añadir opciones que realicen diferentes acciones como hacer un respaldo del archivo si se lo modifica (`-B`), convertir tabuladores a espacio (`-E`), entre otros.  

Para salir del programa se debe usar el shorcut `Control-X`.

```{admonition} Tip
:class: tip
Si quieren conocer más sobre este editor de texto les dejamos el siguiente [link](https://www.nano-editor.org/dist/latest/nano.html) de su documentación oficial. 
```

<div id="seccion4_2_2_2"/>

### Vi/vim/neovim u otra variación 
Vi es un editor de texto de CLI altamente configurable que permite crear y modificar cualquier archivo de texto de forma eficiente. Existen muchas versiones de este programa con mejoras en diferentes funcionalidades, incluyendo Vim (vi improved), Neovim, entre otros. En las versiones actuales de SO basados en Unix se usa por defecto Vim, pero el programa se llama desde la terminal como vi. Para verificar la versión de este programa se puede usar el siguiente comando desde la terminal: 

```bash
vi --version 
```

Al igual que nano, para usar este programa desde la terminal se debe escribir la palabra `vi` seguida del nombre del archivo que se quiere visualizar o modificar. Como ejemplo, usaremos el archivo `markdown (.md)`  de la anterior sección:

```{admonition} Nota
:class: note
Recuerda que debes abrir una terminal en la carpeta en la que está el archivo.
```

```bash
vi 1_Archivos_formatos_comunes_Bioinformatica.md
```

Con esto accedemos al programa, que se visualiza de la siguiente forma: 

```{image} ./img/vi1.png
:alt: ./img/vi1.png
:width: 800px
:align: center
```

A diferencia de nano, en vi existen diferentes modos de uso y no se puede añadir o eliminar texto de forma predeterminada. El modo predeterminado de vi es el de comandos, en el que se pueden usar las siguientes opciones: 

| **Comando**| **Descripción** |
|:---:|:---:|
| `gg`  | Mueve el cursor al principio del archivo|
| `G`  | Mueve el cursor al final del archivo|
| `0`  | Mueve el cursor al principio de una línea|
| `$`  | Mueve el cur$or al final de la línea|
| `w`  | Mueve el cursor una palabra hacia adelante|
| `b`  | Mueve el cursor una palabra hacia atrás |
| `yy`  | Copiar una línea |
| `dd`  | Cortar una línea|
| `p`  | Pegar|
| `u`  | Deshacer|
| `ctrl+r` | Pegar|

Para añadir o eliminar texto se debe usar el modo de inserción, que se puede acceder con los siguientes shorcuts de teclado: 

|**Tecla**| **Descripción** |
|:---:|:---:|
| `i` | Insertar texto al inicio de la línea |
| `a` | Insertar texto en la posición actual |
| `o` | insertar texto en una nueva línea |

Para regresar al como de comandos se debe usar la tecla `Esc`. 

Por ejemplo, si queremos buscar la palabra *FASTA* en este archivo debemos estar en el modo comandos, añadimos el símbolo `:` que permite escribir comandos, seguido de `/` y la palabra que buscamos, como se muestra a continuación: 

```{image} ./img/vi2.png
:alt: ./img/vi2.png
:width: 800px
:align: center
```

Así, el cursor se dirige al inicio de la palabra buscada. Además, se pueden usar expresiones regulares y otros comandos para reemplazar texto u otras operaciones, pero estos conocimientos están fuera del alcance de este tutorial, que es una breve introducción a vi. 

Para salir del programa el modo comandos debe estar activo, y se pueden usar las siguientes opciones:

|**Comando**| **Descripción** |
|:---:|:---:|
| `q` | Salir |
| `q!` | Salir sin guardar datos / archivo |
| `x` | Guardar y salir |

```{admonition} Tip
:class: tip
Muchos programadores usan vi no solo como editor de texto, sino como un ambiente de desarrollo integrado (IDE) para programar en diferentes lenguajes, ya que tiene las ventajas de usar pocos recursos computacionales y su flexibilidad para adaptarse a las necesidades del programador. Por tanto, vi es una herramienta muy potente que merece un curso completo, pero este no es el objetivo del curso actual.

Si quieren conocer más sobre este editor de texto les dejamos el siguiente [link](https://www.vim.org/docs.php) de su documentación oficial. Además, les dejamos el link a una [cheatsheet de vi](https://vim.rtorr.com/) muy útil. 
```


<div id="seccion4_2_3"/>

## Editores de texto de GUI

<div id="seccion4_2_3_1"/>

### JupyterLab
Como aprendimos en la sección sobre [JupyterLab](../02_JupyterLab/0_Resumen.md), esta herramienta se puede usar para visualizar archivos `markdown`, notebooks en formato `ipynb` con código escrito en diferentes lenguajes de programación, y cualquier otro archivo de texto. Por tanto, esta es otra opción para visualizar y modificar archivos de texto. 

Al igual que con nano y vi, visualizaremos el archivo `markdown (.md)` de la anterior sección con esta herramienta. Para esto, debemos iniciar un servidor de jupyter-lab desde la terminal, y abrir el archivo deseado en este programa, como se observa en la siguiente captura: 

```{image} ./img/jupyterlab.png
:alt: ./img/jupyterlab.png
:width: 800px
:align: center
```

```{admonition} Tip
:class: tip
Si quieren conocer más sobre este editor de texto les dejamos el siguiente [link](https://jupyterlab.readthedocs.io/en/stable/index.html) de su documentación oficial.  
```

<div id="seccion4_2_4"/>

## Material suplementario
Existen muchos editores de texto de GUI disponibles para diferentes SO, como [Notepad++](https://notepad-plus-plus.org/), [Sublime](https://www.sublimetext.com/), entre otros, pero estos tienen la desventaja de que poseen ciertas características disponibles solamente en las versiones con costo. Una muy buena alternativa con licencia open source es [Geany](https://www.geany.org/), disponible para todos los SO. 
