# Git

```{image} ./img/git.png
:alt: ./img/git.png
:width: 400px
:align: center
```
En esta parte estudiaremos Git, sus comandos básicos y características más importantes para gestión proyectos de programación. 

## ¿Qué es Git?
Es un programa de línea de comandos que permite realizar `manejo de versiones` de documentos de texto plano. Se tiene registro del usuario que hizo un cambio determinado, la fecha, hora y otros datos relevantes. Git funciona de forma local, por lo que no se requiere acceso a internet. 

Los archivos de los que se mantiene el manejo de versiones con Git se organizan en un `repositorio`. Actualmente, esta es una herramienta esencial para trabajos colaborativos de creación y escritura de software. 

## Instalación Git
Para verificar si tienes instalado Git en tu computadora corre el siguiente comando:

```shell
$ git --version
```

En caso que no tengas instalado Git, te dejamos este [tutorial](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) sobre su instalación en diferentes sistemas operativos. 

## Manejo de versiones de archivos en un repositorio de Git 

### Crear un repo de Git y archivos para manejo de versiones
Para empezar, vamos a crear un directorio, que será el repositorio de Git, y nos movemos ahí: 

```shell
$ mkdir repo_prueba
$ cd repo_prueba
```
```{admonition} Nota
:class: note
Para mantener una organización adecuada de tus archivos y directorios, te recomendamos mantener la siguiente estructura, como se sugirió en la parte de [Organización de archivos duante el taller](../../Curso_basico/02_JupyterLab/0_terminal_primera.md)
```
```
taller_unix
├─── ...
└─── 10_git_github
    ├─── repo_prueba
```
Entonces, inicializamos el directorio que creamos previamente como un repositorio de Git con el comando `git init`: 

```shell
$ git init
```
Ahora, creamos algunos archivos en el repositorio para llevar el manejo de sus versiones:

```shell
$ echo "Este es mi repositorio de prueba" > readme.txt
$ echo "echo Hola mundo" > archivo1.sh
$ echo "print('Hola mundo')" > archivo2.py
$ echo "'Hola mundo'" > archivo3.R
```
Algunos de estos archivos son pequeños scripts en diferentes lenguajes de progaramación (Bash, Python, y R), que puedes correr si tienes instalado los programas correspondientes de la siguiente forma:

```shell
$ bash archivo1.sh
$ python archivo2.py
$ Rscript archivo3.R
```
### Verificar el estado de un proyecto de Git

El primer comando importante para esta tarea es `git status`, que permite verificar el estado del repositorio: 

```bash
$ git status

On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)

        archivo1.sh
        archivo2.py
        archivo3.R
        readme.txt

nothing added to commit but untracked files present (use "git add" to track
```
En la primera línea del resultado se menciona la rama de trabajo (master en este caso), lo que veremos en detalle en una sección posterior. En la segunda línea se menciona que no hay **commits**, que son puntos de referencia de los cambios que se han hecho sobre los archivos. En las líneas posteriores, se observa que todos los archivos aparecen en la lista de archivos sin seguimiento.  

### Añadir archivos individuales a la lista de seguimiento de versiones del repo de Git

Como se sugiere en el resultado del anterior comando, debemos usar el comando `git add` para especificar que queremos manejar las versiones de los archivos: 

```shell
$ git add readme.txt
$ git add archivo1.sh
```

Verificamos nuevamente el estado del repositorio y constatamos que *readme.txt* y *archivo1.sh* están en la lista de archivos con seguimiento: 

```shell
$ git status 

On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)

        new file:   archivo1.sh
        new file:   readme.txt

Untracked files:
  (use "git add <file>..." to include in what will be committed)

        archivo2.py
        archivo3.R
```

### Eliminar un archivo de la lista de seguimiento de versiones del repo de Git

En caso de que ya no quisieramos realizar el siguimiento del archivo *readme.txt*, podemos usar el comando `git rm` con la opción *--cached* (para mantener el archivo en el repo): 

```shell
$ git rm --cached readme.txt
$ git status

On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)

        new file:   archivo1.sh

Untracked files:
  (use "git add <file>..." to include in what will be committed)

        archivo2.py
        archivo3.R
        readme.txt
```
### Guardar los cambios realizados en los archivos de la lista de seguimiento

Para esto debemos crear un **commit**, que como se mencionó antes sirve como punto de referencia para gestionar los cambios hechos en los archivos de la lista de seguimiento. Esto se realiza con con el comando `git commit`, y se debe especificar un mensaje usando la opción *-m*: 

```shell
$ git commit -m "Añadimos archivo1.sh al repo de prueba"

$ git status

On branch master
Untracked files:
  (use "git add <file>..." to include in what will be committed)

        archivo2.py
        archivo3.R
        readme.txt
```
Con esto, se observa que los cambios realizados en `archivo1.sh` se guardaron. Ahora, añadimos una línea extra al archivo al que aplicamos el *commit* y vemos el estado del repo:

```shell 
$ echo "echo Hola mundo 2" >> archivo1.sh
$ git status

On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   archivo1.sh

Untracked files:
  (use "git add <file>..." to include in what will be committed)

        archivo2.py
        archivo3.R
        readme.txt
```
En el resultado se observa que el `archivo1.sh` aparece en la parte de archivos modificados, por lo que se pueden actualizar de nuevo los cambios que realizamos o descartar estos cambios. 

### Verificar diferencias entre archivos sin seguimiento y último commit
El comando `git diff` permite ver las diferencias entre la versión de un archivo sin seguimiento o modificado y el último commit del archivo: 

```shell
$ git diff archivo1.sh

diff --git a/archivo1.sh b/archivo1.sh
index 938eab5..975cbee 100644
--- a/archivo1.sh
+++ b/archivo1.sh
@@ -1 +1,2 @@
 echo Hola mundo
+echo Hola mundo 2
```
En el resultado de este comando se observa la adición de la línea en el archivo `archivo1.sh` mediante el símbolo `+`.

#### Eliminar cambios realizados en un archivo
Debido a la modificación que hicimos en el archivo, ahora podemos usar el comando `git add` para añadir los cambios o `git checkout` para eliminar todos los cambios hechos en el archivo y regresar al estado del último commit, como se sugiere en el resultado del anterior comando. En este caso usaremos el comando `git checkout` para descartar los cambios realizados en `archivo1.sh`: 

```shell
$ git checkout archivo1.sh
$ git status

On branch master
Untracked files:
  (use "git add <file>..." to include in what will be committed)

        archivo2.py
        archivo3.R
        readme.txt
```
Como se observa, `archivo1.sh` ya no está en la parte de archivos modificados, y se eliminaron los cambios realizados, lo que puedes comprobar visualizando el archivo con el editor de texto de tu preferencia. 

### Añadir todos los archivos del repo a la lista de seguimiento de versiones 

Para añadir todos los archivos del repositorio a la lista de seguimiento se usa la opción *-A* o *.* del comando `git add`: 

```shell
$ git add -A # o git add .
$ git status

On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

        modified:   archivo1.sh
        new file:   archivo2.py
        new file:   archivo3.R
        new file:   readme.txt
```

Y hacemos el commit de todos los archivos de la lista de seguimiento con su mensaje correspondiente: 

```shell
$ git commit -m "Añadimos readme.txt, y scripts de Hola mundo en diferentes lenguajes"
$ git status

On branch master
nothing to commit, working tree clean
```
### Deshacer el commit más reciente

En caso de existir algún error con la versión de alguno de los archivos de los que se hizo el commit, es posible deshacer el commit más reciente, lo que se puede realizar con el comando `git reset --soft HEAD~`:

```shell
$ git reset --soft HEAD~
$ git status

On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

        modified:   archivo1.sh
        new file:   archivo2.py
        new file:   archivo3.R
        new file:   readme.txt
```

Luego de hacer las correcciones en los archivos se corren de nuevo los comandos `git add` y `git commit`, y se verifica el estado del repositorio: 

```shell
$ git add -A
$ git commit -m "Añadimos archivos corregidos"
$ git status 

On branch master
nothing to commit, working tree clean
```
### Verificar los commits del repositorio 
Para conocer la lista de todos los commits del repositorio de Git se puede usar el comando `git log`: 

```bash
$ git log

commit 44efc26e96e41e77e8df3066acb607e9ecde4815 (HEAD -> master)
Author: asar1245 <sebasar1245@gmail.com>
Date:   Sun May 23 11:18:57 2021 -0500

    Añadimos archivos corregidos

commit 1ecba835d3cc53ec5d75ccfbe6fe5ba206914c9a
Author: asar1245 <sebasar1245@gmail.com>
Date:   Sun May 23 11:05:56 2021 -0500

    Añadimos archivo1.sh al repo de prueba
```
En el resultado de este comando se observa que cada **commit** posee un código *HASH*, que sirve como identificador único, y se tiene información sobre el autor, fecha y mensaje. 

## Ignorar archivos o directorios
Puede ser que existan archivos o directorios del repositorio de Git de los que no se quiera hacer el manejo de versiones. Esto puede ser porque no son archivos de texto plano (jpg, pdf, entre otros) o porque almacenan información confidencial. 

Para evitar realizar el manejo de versiones con Git de ciertos archivos o directorios se puede emplear el archivo `.gitignore`, en el que se puede añadir una lista de archivos y directorios, o añadir expresiones regulares para especificar arhivos con una extensión determinada u otro criterio. 

Entonces, crearemos algunos archivos con extensión de imágenes para mostrar el funcionamiento de `.gitignore`: 

```shell
$ touch imagen1.png
$ touch imagen2.jpg
$ touch imagen3.jpg
$ mkdir sub_directorio1
$ touch sub_directorio1/imagen4.png
$ git status

On branch master
Untracked files:
  (use "git add <file>..." to include in what will be committed)

        imagen1.png
        imagen2.jpg
        imagen3.jpg
        sub_directorio1/

nothing added to commit but untracked files present (use "git add" to track)
```
Observamos que los archivos que creamos están en la lista de archivos sin seguimiento. Entonces, vamos a añadir `imagen1.png` al archivo `.gitignore` de la siguiente forma: 

```shell 
$ echo "imagen1.png" > .gitignore
$ git status

On branch master
Untracked files:
  (use "git add <file>..." to include in what will be committed)

        .gitignore
        imagen2.jpg
        imagen3.jpg
        sub_directorio1/

nothing added to commit but untracked files present (use "git add" to track)
```
```{admonition} Nota
:class: note
Cuando se crea un repo de Git suele crearse también el archivo `.gitignore` por defecto, pero si no es así y te aparece un error mencionando que no existe este archivo, puedes hacerlo con el comando touch, de la siguiente forma: 

touch .gitignore

Además, en este caso usamos el comando **echo** para escribir en el archivo `.gitignore`, pero esto también se puede hacer de forma manual con tu editor de texto de preferencia. 
```
En el resultado del anterior comando observamos que `imagen1.png` ya no aparece en la lista de archivos sin seguimiento, como estaba previsto. Ahora, vamos a añadir al archivo `.gitignore` todos los archivos con extensión `.jpg` de la siguiente forma: 

```shell
$ echo "*.jpg" >> .gitignore
$ git status

On branch master
Untracked files:
  (use "git add <file>..." to include in what will be committed)

        .gitignore
        sub_directorio1/

nothing added to commit but untracked files present (use "git add" to track)
```
Finalmente. añadimos el directorio `sub_directorio1` al archivo `.gitignore`: 

```bash
$ echo "sub_directorio1/" >> .gitignore
$ git status

On branch master
Untracked files:
  (use "git add <file>..." to include in what will be committed)

        .gitignore

nothing added to commit but untracked files present (use "git add" to track)
```
Con esto, hemos evitado que se realice el manejo de versiones de todos los archivos y directorios que creamos. Ahora, añadimos el archivo `.gitignore` a la lista de archivos con seguimiento y hacemos un commit:

```bash
$ git add -A
$ git commit -m "Añadimos .gitignore"
$ git status

On branch master
nothing to commit, working tree clean
```
## Ramas
Se puede considerar las ramas de Git como una **copia del repo en un punto específico de tiempo** que se puede modificar de forma independiente de las otras ramas. Permiten trabajar con un conjunto de archivos de un repositorio de forma independiente a otras copias de estos archivos. Así, es posible modificar varias partes de un archivo en diferentes ramas, y luego unir los cambios en un archivo consenso. 

Un ejemplo para entender esto es en el caso de la escritura de un libro, donde tendríamos las siguientes ramas:

* rama principal (main o master)
* tabla de contenidos 
* capítulo 1
* capítulo 2
* etc 

La tabla de contenidos y capítulos se pueden escribir de forma independiente y luego unir todo en el documento final. Las ramas de Git siguen un principio similar, como veremos a continuación.

### Verificar las ramas del repo
Para listar las ramas de un repositorio de Git se usa el coamndo `git branch`:

```shell
$ git branch

* master
```
De momento en nuestro repo solamente tenemos la rama master. 
```{admonition} Tip
:class: tip
De forma general, la rama principal de los repositorios de Git o GitHub se nombran como master o main. 
```
### Crear una nueva rama
Para crear una nueva rama se usa el comando `git branch` seguido del nombre de la rama:

```shell
$ git branch test_branch
$ git branch

* master
  test_branch
```
Ahora, nuestro reositorio tiene dos ramas. Para conocer la rama de trabajo actual se usa el símbolo `*`, en este caso sería la rama *master*.

### Cambiarse de una rama a otra
Para cambiar la rama actual de trabajo se usa el comando `git checkout`:

```shell
$ git checkout test_branch
$ git branch

  master
* test_branch
```
Como vemos, la rama de trabajo cambió y por tanto el `*` está antes de la rama *test_branch*. 

### Elimnar una rama
Para eliminar una rama se usa el comando `git branch` con la opción *-d*. 

```{admonition} Nota
:class: note
No es posible eliminar la rama de trabajo actual, por lo que para eliminar `test_branch` primero debemos movernos a `master`. 
```

```shell 
$ git checkout master
$ git branch -d test_branch
$ git branch

* master
```

### Crear una rama y convertirla en la rama de trabajo
Es posible crear una rama y hacer que esta sea la rama de trabajo actual al mismo tiempo, para lo que se usa el comando `git checkout` con la opción *-b*, seguido del nombre de la nueva rama:

```shell
$ git checkout -b nueva_rama
$ git branch

  master
* nueva_rama
```

En la nueva rama modificaremos el archivo `readme.txt`, lo añadiremos a la lista de seguimiento, haremos commit, y verificaremos el contenido del archivo modificado:

```shell
$ echo "Esta línea se añadió en el archivo de la nueva rama" >> readme.txt
$ git add -A
$ git commit -m "Modificación readme.txt en nueva rama"
$ cat readme.txt

Este es mi repositorio de prueba
Esta línea se añadió en el archivo de la nueva rama
```
Ahora, volvemos a la rama *master* y verificamos el contenido del archivo `readme.txt`:

```shell
$ git checkout master
$ cat readme.txt

Este es mi repositorio de prueba
```
Como observamos, el cambio se guardó en la versión del archivo `readme.txt` solamente de la rama *nueva_rama*. 

### Unir los contenidos de diferentes ramas
Para unir los cambios realizados de un archivo en diferentes ramas se usa el comando `git merge`: 

```shell
$ git merge nueva_rama
$ cat readme.txt

Este es mi repositorio de prueba
Esta línea se añadió en el archivo de la nueva rama
```
Con esto, las versiones de `readme.txt` de las dos ramas es la misma. Así, Git permite trabajar de forma paralela sobre un mismo código base, lo que ayuda al trabajo colaborativo de escritura de código y desarrollo de software. 

### Resolución de conflictos de merge

Sin embargo, si el contenido de los archivos de dos ramas diferentes, de los que se ha hecho commit, possen cambios distintos en las mismas líneas pueden surgir `conflictos`. A continuación se creará un conflicto y se mostrará cómo resolverlo.

Primero, cambiamos la palabra *archivo* por *documento* en `readme.txt` de la rama *nueva_rama*, lo añadimos a la lista de seguimiento y hacemos el commit:

```shell
$ git checkout nueva_rama
$ sed -i 's/archivo/documento/g' readme.txt
$ cat readme.txt

Este es mi repositorio de prueba
Esta línea se añadió en el documento de la nueva rama

$ git add -A
$ git commit -m "Cambio de archivo por documento"
```
Ahora regresamos a la rama *master*, cambiamos la palabra arhivo por file, lo añadimos a la lista de seguimiento, hacemos commit y tratamos de hacer el merge como hicimos antes:


```shell
$ git checkout master
$ sed -i 's/archivo/file/g' readme.txt
$ cat readme.txt

Este es mi repositorio de prueba
Esta línea se añadió en el file de la nueva rama

$ git add -A
$ git commit -m "Cambio de archivo por file"
$ git merge nueva_rama

Auto-merging readme.txt
CONFLICT (content): Merge conflict in readme.txt
Automatic merge failed; fix conflicts and then commit the result.
```
Observamos que se ha generado un conflicto, lo que se verifica al correr el comando `git status` y ver el contenido del archivo *readme.txt*:

```bash
$ git status

On branch master
You have unmerged paths.
  (fix conflicts and run "git commit")
  (use "git merge --abort" to abort the merge)

Unmerged paths:
  (use "git add <file>..." to mark resolution)

        both modified:   readme.txt

no changes added to commit (use "git add" and/or "git commit -a")

$ cat readme.txt

Este es mi repositorio de prueba
<<<<<<< HEAD
Esta línea se añadió en el file de la nueva rama
=======
Esta línea se añadió en el documento de la nueva rama
>>>>>>> nueva_rama
```
Se observa que al imprimir el contenido del archivo se añadieron algunos caracteres especiales que indican la línea del conflicto. La parte que aparece entre los símbolos `<<<<<<< HEAD` y `=======` indica la versión de la rama local, mientras que lo que se ubica entre los símbolos `=======` y `>>>>>>> nueva_rama` es la versión de la rama externa. 

Para resolver el conflicto se tienen tres opciones: 
1. Utilizar `git merge --abort` para revertir el merge.
2. Aceptar los cambios de la rama externa, eliminar el resto de líneas y hacer el commit. 
3. Aceptar los cambios de la rama local y eliminar el resto de líneas y hacer el commit.

En este caso vamos a quedarnos con los cambios de la rama local, de la siguiente forma: 

```bash
$ git merge --abort
$ sed -i '2,6d' readme.txt
$ git add -A
$ git commit -m "Conflicto resuelto"
$ git status

On branch master
nothing to commit, working tree clean
```
Realiza las otras opciones de resolución de conflictos de merge por tu cuenta y verifica que funcionen tambień. 

## Ayuda sobre comandos de git 
El comando `git help` permite obtener información de otros comandos de git. Por ejemplo, si queremos conocer detalles del comando `git status` podemos usar el siguiente código: 

```shell
$ git help status

GIT-STATUS(1)                                           Git Manual                                          GIT-STATUS(1)

NAME
       git-status - Show the working tree status

SYNOPSIS
       git status [<options>...] [--] [<pathspec>...]

DESCRIPTION
       Displays paths that have differences between the index file and the current HEAD commit, paths that have
       differences between the working tree and the index file, and paths in the working tree that are not tracked by Git
       (and are not ignored by gitignore(5)). The first are what you would commit by running git commit; the second and
       third are what you could commit by running git add before running git commit.

OPTIONS
       -s, --short
           Give the output in the short-format.
...
```
## Material sumplementario 

* Kross, S. (2017). The unix workbench. Capítulo *Git and GitHub* (pp 154-209). Leanpub. <https://leanpub.com/unix>
* <https://www.freecodecamp.org/news/practical-git-and-git-workflows/>