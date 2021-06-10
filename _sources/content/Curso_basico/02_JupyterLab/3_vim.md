# Primer encuentro con Vim
Vim es un editor de texto que sirve para manipular archivos *solamente desde línea de comando*, es decir, desde Terminal. A veces es muy útil tener un editor por línea de comando ya que abrir un editor como Jupyter Lab requiere tiempo y abrirlo puede interrumpir el flujo de trabajo. Además, Jupyter se usa para notebooks y para proyectos de programación. `Vim` también puede ser utilizado para eso, pero es mucho más conveniente si se quiere realizar ediciones cortas a un script o algún archivo de texto.

```{image} ./img/vim_1.png
:alt: ./img/vim_1.png
:width: 800px
:align: center
```

```{admonition} Nota
:class: note
Dependiendo de cómo hayas instalado Linux o si tienes una Mac, puede que necesites instalar Vim. Para conocer si lo posees ya instalado, abre Terminal y usa el comando
```


```shell
$ vim --version
```
Si el comando te devuelve la versión de Vim, ya lo tienes instalado. Si no, entonces debes instalarlo

## Instalación de Vim en Linux
En linux se usa `apt`. Escribe el siguiente comando en Terminal

```shell
$ sudo apt install vim
```

## Instalación de Vim en MacOS
Es muy bueno usar el administrador de paquetes [`Homebrew`] (https://brew.sh) para instalar programas como Vim y muchos otros en MacOS. Si no lo has instalado puedes seguir las instrucciones de Corey Schafer
en el siguiente [video](https://www.youtube.com/watch?v=SELYgZvAZbU). Después de que hayas instalado, usa el siguiente comando.
```shell
$ brew install vim
```
Se hace como se instruye en <https://formulae.brew.sh/formula/vim>.

## Usemos Vim

```{admonition} Nota
:class: note
Realiza esta parte para que tengas práctica con Vim. No tienes que entregar esto como deber.   
```

Abre una ventana de Terminal y usa los comandos:
```shell
$ cd ~/taller_unix/2_jupyter_lab
$ touch test_vim.txt
$ vim test_vim.txt
```
Ahora es posible usar varios de los modos de vim. Ya que `test_vim.txt` aún no tiene nada dentro, llenémoslo de texto usando del modo `INSERT` de Vim. Para ello aplastamos la tecla <kbd>i</kbd>. Debe aparecer en la esquina inferior izquierda de la pantalla de terminal `-- INSERT --`:
```{image} ./img/vim_2.png
:alt: ./img/vim_2.png
:width: 800px
:align: center
```
Solo escribe algo que quieras que tenga este archivo de texto. Escribe como lo harías normalmente. No uses el mouse para moverte en el texto, sino usa las flechas del teclado.
```{image} ./img/vim_3.png
:alt: ./img/vim_3.png
:width: 800px
:align: center
```
Ahora, aplasta la tecla <kbd>esc</kbd> para salir del modo `INSERT`.
```{image} ./img/vim_4.png
:alt: ./img/vim_4.png
:width: 800px
:align: center
```
Para guardar los cambios vamos a aplastar *dos puntos* seguidos de las letras *w* y *q* <kbd>:</kbd>+<kbd>w</kbd>+<kbd>q</kbd>. Luego damos <kbd>return</kbd>. Esto significa que primer guardamos y luego cerramos Vim. Si solo cerramos Vim <kbd>:</kbd>+<kbd>q</kbd> no quedaría nada de nuestro texto en el archivo `test_vim.txt`.
```{image} ./img/vim_5.png
:alt: ./img/vim_5.png
:width: 800px
:align: center
```

```{admonition} Importante
:class: seealso
En este libro vemos comandos avanzados de Vim en la [Sección 4](../04_Procesamiento_ficheros_regex_pipes/2_Editores_de_texto.md)
```