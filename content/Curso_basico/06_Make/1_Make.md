# Make 

## ¿Qué es Make?

El comando `make` es un programa que crea relaciones entre archivos y programas de forma que los archivos que depende de otros se pueden reconstruir de forma automática. Esto se usa mucho en la instalación de programas. 

## Requisitos para instalar un software con Make

Para instalar un nuevo software usando make se deben seguir los siguientes pasos: 

1. Descargar todos los archivos que se requieren para la instalación
2. Ir al directorio de trabajo (cd)
3. Correr el comando make

Para correr el comand `make` se requiere un archivo llamado `makefile`, que describe las relaciones entre diferentes archivos y programas mediante un conjunto de reglas. 

## Reglas del makefile

Las reglas del archivo `makefile` se forman de:

1. Archivos objetivo 
2. Comandos de bash que se realizarán en los archivos objetivo
3. Dependencias: archivos de los que el objetivo depende para ser construido.

## *Ejercicio: Construir un makefile*

En este ejercicio crearemos un archivo `readme.txt` que se llena automáticamente con información de un archivo del directorio actual. 

Para esto, primero debemos crear un archivo de texto con una línea de texto: 

```bash
echo "Esta es la primera línea del archivo toc.txt" > toc.txt
```
Luego, debemos crear un `makefile` usando `touch`: 

```bash
touch makefile 
```

Ahora, usando el editor de texto de tu preferencia debes agregar las siguientes reglas en el archivo `makefile`: 

all: archivo_temporal.txt readme.txt

archivo_temporal.txt:

	touch archivo_temporal.txt
	
readme.txt: toc.txt
	
	echo "Este archivo temporal tiene el siguiente número de líneas: " > readme.txt
	
	wc -l toc.txt | grep -E -o "[0-9]+" >> readme.txt
	
clean:

	rm archivo_temporal.txt
	
	rm readme.txt
    
Realizando esto, tu archivo `makefile` debería quedar de la siguiente forma:

```{image} ./img/makefile.png
:alt: ./img/makefile.png
:width: 600px
:align: center
```

Entonces, debes correr el comando `make`: 

```bash
make
```

Ahora revisa los archivos de tu carpeta con `ls` e imprime el contenido de `toc.txt` y `readme.txt` con `cat`:

```bash
ls
cat toc.txt
cat readme.txt
```

Entonces, usa el comando `make` seguido de clean: 


```bash
make clean
```

Verifica los archivos de tu carpeta con `ls`: 

```bash
ls
```