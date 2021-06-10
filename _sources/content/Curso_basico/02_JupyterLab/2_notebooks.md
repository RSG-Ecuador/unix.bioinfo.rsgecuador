# Creación de Jupyter Notebooks

## ¿Cómo creo un *Jupyter Notebook*?
Vamos a crear un notebook para el primer deber. Este será creado en la carpeta que ya creamos previamente `~/taller_unix/2_jupyter_lab`. Primero, asegúrate de dirigirte al directoio `~/taller_unix`. Segundo, activa tu ambiente de anaconda llamado `bash`. Tercero, llama a Jupyter Lab. 

```{admonition} Alerta
:class: caution
La instrucción para el deber está al final del documento. Lee con atención por favor :D. Es necesario que llames a Jupyter Lab dentro del directorio donde vas a trabajar.
```
Esto se puede hacer con los siguientes comandos:

```shell
$ cd ~/taller_unix/
$ conda activate bash
$ jupyter lab
```

Vas a ver la siguiente ventana en tu explorador. Aquí se ven todas las carpetas correspondientes al taller. Para crear un notebook en la carpeta `~/taller_unix/2_jupyter_lab`, damos click en `2_jupyter_lab` y seguimos la instrucción de abajo.
```{image} ./img/jupyter_activate.png
:alt: ./img/jupyter_activate.png
:width: 750px
:align: center
```

1. Ve a *File &rarr; New &rarr; Notebook* en el menú de arriba. Te puede salir una pantalla pidiendo que selecciones el kernel a usar con el notebook. Elige `Bash`. 
    ```{image} ./img/j_3.png
    :alt: ./img/j_3.png
    :width: 800px
    :align: center
    ```
    ```{image} ./img/j_4.png
    :alt: ./img/j_4.png
    :width: 800px
    :align: center
    ```
    ```{image} ./img/j_5.png
    :alt: ./img/j_5.png
    :width: 300px
    :align: center
    ```
2. Es posible también crear un cuaderno desde el `Launcher`, un panel con todas las opciones de documentos que se pueden crear en Jupyter Lab. Basta con dar un click en el icono del lenguaje de programación que se usará en el cuaderno. 
    ```{image} ./img/j_8.png
    :alt: ./img/j_8.png
    :width: 800px
    :align: center
    ```
3. Ahora, renombra al notebook `deber_1.ipynb`
    ```{image} ./img/j_6.png
    :alt: ./img/j_6.png
    :width: 800px
    :align: center
    ```
4. Si usas Terminal para ir al directorio `~/taller_unix/2_jupyter_lab`, debes ver que el jupyter notebook está dentro de `2_jupyter_lab`: 
    ```shell
    $ cd ~/taller_unix/2_jupyter_lab
    $ ls -l
    ```
    ```{image} ./img/ipynb_file.png
    :alt: ./img/ipynb_file.png
    :width: 800px
    :align: center
    ```


```{admonition} Customización
:class: info
Si deseas puedes cambiar el estilo de Jupyter Lab a uno oscuro.
```
```{image} ./img/j_7.png
:alt: ./img/j_7.png
:width: 800px
:align: center
```
<div id="anatomia"/>

## Anatomía de un *Jupyter Notebook*

Hay varias partes importantes de un *jupyter notebook* que debes conocer:
1. Celdas *Markdown*: Celdas donde puedes ingresar texto, imágenes, fórmulas, tablas y mucha más información que **documenta** el contenido de las céldas de código.
2. Celdas de código: Celdas donde se coloca código y se lo corre para producir el resultado. Estas celdas interpretan el lenguaje de programación establecido por el kernel. 
3. Kernel actual: Kernel utilizado por el notebook. Especifica el lenguaje de programación utilizado en las celdas de código.
4. Barra de herramientas: Herramientas importantes como guardar, copiar, cortar,
5. Contenido del directorio de trabajo actual: El icono de carpeta muestra todo el contenido del directorio en donde se llamó a Jupyter Lab. Es el directorio de trabajo porque desde ahí Jupyter creará y accederá a los archivos y subdirectorios.
6. Menú de opciones: Barra de opciones que permite modificar y guardar archivos, cambiar acciones del kernel, configuraciones de Jupyter Lab, etc.

Estas se encuentran señaladas en la imagen. El resto son herramientas muy útiles. Hay varias otras funcionalidades que puedes explorar. 
```{image} ./img/j_9.png
:alt: ./img/j_9.png
:width: 800px
:align: center
```

El posible cambiar el tipo de celda al que se requiera ese momento. Por defecto se crea una nueva celda de código, pero es posible cambiarla a una celda de Markdown. Desde la barra de herramientas.
```{image} ./img/j_11.png
:alt: ./img/j_11.png
:width: 800px
:align: center
```
```{image} ./img/j_12.png
:alt: ./img/j_12.png
:width: 200px
:align: center
```

```{admonition} Alerta
:class: caution
Recuerda siempre guardar el progreso de tu notebook para evitar pérdida de datos
```


## `Markdown`
Markdown es una simplificación para HTML usado en programación web. Markdown es la herramienta que permite que existan celdas que contengan datos, imágenes y texto para describir código. Usaremos Markdown durante los deberes. Existen varias guías que puedes usar. Algunas de ellas las son:
- <https://www.markdownguide.org/>
- <https://ia.net/writer/support/general/markdown-guide>

Las tres cosas que debes saber de Markdown para este taller son:
1. Insertar títulos Y texto
2. Insertar imágenes
3. Usar negritas, cursiva y comillas `(``)`

La celda Markdown en la imagen anterior contiene el siguiente código. 
```markdown
# Deber No. 1: Jupyter Lab
### Nombre: Juanes

En este deber debo:
1. Colocar mi nombre.
2. Correr el comando `conda env list` en una celda del Jupyter notebook y verificar que he creado correctamente el ambiente `bash`.
3. Correr mi primer código en Bash (copiar y pegar el que está más abajo en una celda del Jupyter notebook y correr la celda).
4. Colocar una imágen en Markdown ( un meme por ejemplo :D )

<center><img width="150px" src="./ilp.png"></center
```
Aquí se pueden evidenciar: el título principal maracdo por `#`, el título terciario mar cado por `###`, una lista enumerada desde el `1`, texto en *curvisiva* utilizando dos asteriscos para comprimir al texto que se quiere hacer cursiva `*TEXT*`, texto en **negrita** con doble asterisco `**TEXT**` y una imagen centrada. Las comillas comillas `(``)` generan texto resaltado. Por ejemplo, esta `PALABRA` en Mardown se escribe

```markdown
`PALABRA`
```
Se usa generalmente para **resaltar código**, pero puede ser usada libremente para resaltar lo que sea.
La imagen se ha insertado mediante una instrucción en HTML. Para esto es necesario especificar dimensión y ubicación de la imagen `ilp.png`:
```markdown
<img width="150" src="./ilp.png">
```
 He especificado que la imagen se encuentra en la misma carpeta del notebook. También he especificado un ancho de 150 pixeles. Además de especificar que se requiere que la imágen sea centrada.
```markdown
<center><img width="150" src="./ilp.png"></center>
```

## Celdas de código

Eventualmente necesitarás usar celdas de código. Para ello hay que especificarle a Jupyter Lab que vas a crear una célda de código desde la barra de herramientas, usando el signo `+`. Además, para correr el código debes usar el icono de flecha.
```{image} ./img/j_13.png
:alt: ./img/j_13.png
:width: 600px
:align: center
```
El código de la imágen anterior es el siguiente. Este, dar click en el icono de flecha, imprime en pantalla los números 1, 2 y 3, además de la frase `Eso es todo :)`. Los cuadernos siempre mostrarán los resultados de un programa a menos que se especifique lo contrario.

```bash
counter=1
while [ $counter -le 3 ]
do
    echo -n $counter
    ((counter++))
done
echo 
echo "Eso es todo :)"
```
```{admonition} Alerta
:class: caution
Cuando se inicia Jupyter Lab se crea una carpeta llamada `.ipynb_checkpoints`. No borrar esta carpeta. Aquí se guardan borradores.
```

## *Ejercicio: Creación de un Jupyter Notebook en Jupyter Lab*

Como deber replica la imagen de [Anatomía de un Jupyter Notebook](#anatomia). Hacer los 4 elementos de la lista de la imagen. Seguir los ejemplos de arriba. 

```{admonition} Nota
:class: note
El entregable es un jupyter notebook. 
```
