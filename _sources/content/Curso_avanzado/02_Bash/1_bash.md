# Scripts en Bash

```{image} ./img/b.png
:alt: ./img/b.png
:width: 300px
:align: center
```
Los `scripts` son archivos de texto que contienen instrucciones ejecutables por un intérprete de un lenguaje de programación para la ejecución de tareas. El formato `.sh` se utiliza para escribir `scripts ejecutables` por un intérprete como Bash. En esta sección crearemos varios scripts de Bash y usaremos varios comandos y operadores. 

Primero es necesario crear una carpeta para trabajar. Si recuerdas la sección [Jupyter Lab](../../Curso_basico/02_JupyterLab/0_terminal_primera.md), tenemos ya el directorio `~/taller_unix`. Podemos crear una carpeta nueva:
```shell
$ mkdir ~/taller_unix/9_bash
$ cd ~/taller_unix/9_bash
```


## Primer programa: Álgebra
Vamos a crear un archivo de formato `.sh` llamado **algebra.sh**, usando el comando `touch`. Luego colocamos el contenido que se encuentra debajo con Vim, Jupyter Lab o el editor de texto que prefieras. La primera línea contiene una combinación de los caracteres `#!`, llamados *shebang*, y el directorio del intérprete de Bash */bin/bash* (compruébalo con `which bash`). Shebang es una convención para scripts de la shell que permite ubicar al intérprete en la coputadora al momento de ejecutarlo. El caracter `#` permite comentar una línea en el script. Es un comentario porque el intérprete ignora la línea que empieza por `#` (no por `#!`).
```bash
#!/bin/bash
# File: algebra.sh

expr 4 + 3
expr 4 - 3
expr 4 \* 3
expr 4 / 3
```
```{admonition} Nota
:class: note
Recuerda que solamente las líneas de texto que empiezan con `$` deben usarse directamente en Terminal. El bloque de código anterior debes escribirlo en el archivo `algebra.sh` que acabas de crear.
```
Si usamos el comando `ls -la` se puede ver toda la información de los archivos en la carpeta actual. Yo usó el comando `l` porque es una configruación personal. Puedes ver que `algebra.sh` posee la descripción **-rw-r--r--**. Esto significa que el sistema operativo ha otorgado permisos para que el archivo solamente se escriba y se lea. 
```{image} ./img/b1.png
:alt: ./img/b1.png
:width: 650px
:align: center
```
Lo que queremos es ejecutar este archivo, pero no será posible sin modificar los permisos. Es posible hacer esto con el comando `chmod +x` (que aprendimos antes), donde `x` significa *ejecutable*. Verás que la descripción cambia a **-rwxr-xr-x**. Es posible que también veas que el archivo cambia de color, de blanco a rojo. Esto hace posible usar `algebra.sh` como un archivo ejecutable, como se ve en la imagen a continuación. Los archivos ejecutables son scripts autorizados por el sistema operativo para correr los comandos escritos en ellos. 
```{image} ./img/b2.png
:alt: ./img/b2.png
:width: 650px
:align: center
```
Ahora, para ejecutar el script debemos llamarlo con `./algebra.sh`.
```{image} ./img/b3.png
:alt: ./img/b3.png
:width: 500px
:align: center
```
```{admonition} Deber
:class: hint
Crea el script, modifica sus permisos y córrelo como se indica. Toma una captura de pantalla del proceso. Guarda la captura de pantalla en `~/taller_unix/9_bash`, o en otra carpeta si tu instalación de Linux dificulta que guardes en este directorio.
```
Esta convención puede ser reemplazada. Si no deseas cambiar los permisos del archivo, puedes llamar directamente al intérprete y como argumento colocar el nombre o directorio del archivo. Así, no es necesario incluir la línea del shebang ni usar `chmod +x`, y si la incluyes no importa tampoco. Para hacer esto, borra el ejecutable y reescribe el código previo. Luego, ejecuta el comando:
```shell
$ bash algebra.sh
```
Vemos cómo claramente la expresión `4 / 3` devuelve el valor 1, cuando sabemos que equivale al número `1.333333...`. Esto ocurre porque la división entera aproxima el resultado: 
```{math}
\frac{4}{3} \sim 1
```
A veces retornará resultados extraños, pero ahora ya sabemos que solo está aproximando. Solamente cuando la división es perfecta, retorna el resultado completo:
```shell
$ expr 1 / 10
$ expr 10 / 4
$ expr 10 / 2
```
Si usamos el operador de residuo `%` vemos cuanto nos queda de remanente al dividir una fracción irracional:
```{image} ./img/remainder.png
:alt: ./img/remainder.png
:width: 250px
:align: center
```
```shell
expr 487 % 32
expr 1 % 10
expr 10 % 4
expr 10 % 5
```
Esto es un poco restrictivo ya que habrá ocasiones donde necesitemos utilizar todos los decimales posibles de una división. Para esto podemos exportar un string con una operación algebraica al programa bench calculator `bc` con un pipe. Creemos un archivo `pi.sh` con el siguiente contenido:
```bash
#!/bin/bash
# File: pi.sh

# aproximación de pi
echo "scale=7; 355 / 113" | bc -l
echo "4 ^ 2" | bc -l
echo "scale=2; sqrt(4)" | bc -l
echo "scale=3; (1.23 / 0.32) + (5 * 2)" | bc -l
```
Ahora, corremos el script con `bash`:
```shell
bash pi.sh
```
```{image} ./img/b4.png
:alt: ./img/b4.png
:width: 500px
:align: center
```
Es posible darle precisión a los números de output después de usar `bc` con el comando `scale` en el string después de `echo`.
```{admonition} Deber
:class: hint
Crea el script y córrelo. Toma una captura de pantalla del proceso. Guarda la captura de pantalla en `~/taller_unix/9_bash`, o en otra carpeta si tu instalación de Linux dificulta que guardes en este directorio.
```



## Segundo programa: Variables
Es importante guardar datos en la memoria del computador mientras ejecutamos un script, porque queremos usar varias veces un mismo valor, por ejemplo. Para ello usamos `variables`. Las variables son *strings*, o nombres simbólicos, que representan un conjunto de datos guardados en la memoria de la computadora. A veces las variables pueden cambiar su data inicial. Esto permite usar la data bajo el nombre de una variable independientemente de su estado.  Hay cinco reglas que seguir para **declarar variables** en Bash:
1. El nombre de la variable debe estar en minúsculas
2. La variable empieza con una letra, no un número
3. Solo debe contener caracteres alfanuméricos y guiones bajos.
4. Es útil separar las palabras por guiones bajos.
5. Los valores que se asignen a las variables y los nombres de las variables siempre deben estar pegados al operador `=` se asignación.

Vamos a crear una variable para guardar el capítulo del libro. Luego, para imprimir el contenido de la variable usamos el operador `$`
```shell
$ rsg_unidad=9
$ echo $rsg_unidad
```
Podemos modificar la variable utilizando el operador de asignación. ¡Hay que tener cuidado! Es posible que actualicemos el valor de la variable inicial y ya no tenga el mismo significado que antes. Es decir, una variable puede ser de varios tipos: número entero, número float, string, caracter, etc. Accidentalmente podemos intercambiar los tipos de variables y luego el programa ya no sirve. Por ejemplo:
```shell
$ rsg_unidad="ahora es un string"
$ echo $rsg_unidad
$ rsg_unidad="volvamos a ser un entero"
$ echo $rsg_unidad
$ rsg_unidad=9
$ echo $rsg_unidad
$ echo "mejor :)"
```
Si usamos expresiones algebraicas al momento de actualizar una variable podemos usar el comando `let`. Además podemos imprimir variables en un string si usamos el operador `$` antes de la variable que queremos imprimir.
```shell
$ a=1
$ b=41
$ c=0
$ let c=a-b
$ echo "La variable c almacena el valor $c."
```
Ahora podemos usar el comando `$()` y guardar el resultado en una variable. Por ejemplo, vamos a guardar el número de líneas con código en el archivo `pi.sh`
```shell
$ lines=$(cat ./pi.sh | wc -l)
$ echo $lines
```
Hay variables especiales de Bash que podemos usar para **pasar argumentos al script cuando lo corremos**, es decir, le damos variables al script para que las procese de una manera en especial. Primero creemos un archivo `.sh` llamado `vars` con el siguiente contenido:
```bash
#!bin/bash
# File: vars.sh

echo "Argumentos del script: $@"
echo "Primer argumento: $1. Segundo argumento: $2."
echo "Numero de argumentos: $#"
```
```shell
$ bash vars.sh
$ bash vars.sh amo
$ bash vars.sh la programacion
```
¿Y qué pasa si ingresamos más argumentos de los que teníamos planeados?
```shell
$ bash vars.sh red blue green
```
```{admonition} Deber
:class: hint
Crea el script y córrelo las cuatro veces. Toma una captura de pantalla del proceso. Guarda la captura de pantalla en `~/taller_unix/9_bash`, o en otra carpeta si tu instalación de Linux dificulta que guardes en este directorio.
```


## Tercer programa: Ingresar datos desde teclado
Es posible hacer un script de Bash que interactúe con un usuario y le permita ingresar un string desde el teclado y guardarlo como variable. La meta es que el script haga algo con esa variable. Para ello usamos el comando `read` antes del nombre de una variable nueva que vamos a usar. Por ejemplo, creemos un archivo llamado `input.sh` y coloquemos el siguiente código:
```bash
#!/bin/bash
# File: input.sh

echo "Quieres continuar? (y/n): "
read response
echo "Ok, seleccionaste: $response"
```
```shell
$ bash input.sh
```
```{admonition} Deber
:class: hint
Crea el script y córrelo. Toma una captura de pantalla del proceso. Guarda la captura de pantalla en `~/taller_unix/9_bash`, o en otra carpeta si tu instalación de Linux dificulta que guardes en este directorio.
```


## ¿Qué tiene que ver todo esto con bioinformática?
Todo. ¡Podemos automatizar procesamiento de datos en bash utilizando todo lo que hemos aprendido antes! Veamos un ejemplo con un ejercicio previo del capítulo sobre [ejercicios de procesamiento de ficheros](../../Curso_basico/05_Ejercicios_procesamiento_ficheros_Bioinfo/5_Info_fastq.md). Colocaremos varias de las instrucciones de ese ejercicio en un archivo llamado `demo.sh`. Luego, lo correremos en la Terminal para ver el resultado. Este script hará el siguiente procesamiento:
1. Tomará como input el nombre del archivo `./_files/secuencias_bash.fastq` de secuencias fastq para analizar.
2. Buscará dentro del archivo provisto por el usuario las secuencias con el string @SRR098026 y las contará.
3. Exportará las malas secuencias a un archivo llamado `malas_lecturas.fastq`, usando el string "NNNNNNNNNN" como plantilla. 
4. Reportará el número de malas secuencias.
5. Luego buscaremos patrones en el archivo `buenas_lecturas.fastq`, si es que el usuario lo desea.

```bash
#!/bin/bash
# File: demo.sh

# Input de archivo
echo "Archivo a procesar > $@"
echo "Numero de argumentos: $#"

# Conteo de secuencias, separación de malas secuencias
numero_secuencias=$(grep -c '^@SRR098026' $@)
grep -B1 -A2 NNNNNNNNNN $@ > malas_lecturas.fastq
malas=$(cat malas_lecturas.fastq | wc -l)
echo "Número de malas lecturas: $malas"

# Búsqueda de patrones
echo "Desea buscar patrones (y/n): "
read d

if [[ $d == "y" ]]; then
    echo "Los patrones se guardarán en: patrones.txt"
    echo -e 'ACTG\nCCCCC\nNNNCNNN\nNNNGNNN\nTTTT\nTATA\nAAA' > patrones.txt
    grep -f patrones.txt $@ > busqueda.txt
    echo "Búsqueda de patrones guardada en: busqueda.txt"
else
    echo "ok :P"
fi

# Mensaje final
echo "Fin :)"
```

Deberías correr el script así, una vez que hayas descargado el archivo `secuencias_bash.fastq` y lo hayas colocado en `~/taller_unix/9_bash`:
```shell
$ bash demo.sh secuencias_bash.fastq
```
```{image} ./img/b5.png
:alt: ./img/b5.png
:width: 650px
:align: center
```
```{admonition} Deber
:class: hint
Vas a notar que este script posee el nuevo comando `if`. Lo veremos en la próxima sección. Por ahora, crea el script y córrelo. Toma una captura de pantalla del proceso. Guarda la captura de pantalla en `~/taller_unix/9_bash`, o en otra carpeta si tu instalación de Linux dificulta que guardes en este directorio.
```

## Tabla de comandos frecuentes

**Comando** | **Función**
----------- | --------------
`expr`      | Comando para evaluar una expresión de Bash.
`#!`        | Shebang.
`+`         | Operador de suma entre dos números.
`/`         | Operador de división entera entre dos números. Devuelve el entero más cercano al resutado real. 
`-`         | Operador de resta entre dos números.
`*`         | Operador de producto entre dos números. Hay que **escapar el caracter `\*` *antes de usarlo en la shell*** como operador de producto o Bash creerá que será usado como expresión regular. Si se usa en *bc* no hay problema.
`%`         | Operador residuo entre dos números. Retorna el residuo de una división larga entre números.
`bc`        | Programa *bench calculator*. Toma strings de operaciones algebraicas y da el resultado.
`=`         | Operador de asignación
`$`         | Caracter especial que revela contenido de una variable.
`let`       | Comando que permite actualizar una variable con una operación algebraica.
`()`        | Operador para *sustitución de comando*. Corre un comando y guarda el resultado en una variable.
`@`         | Variable nativa que imprime los nombres de los argumentos dados a un script.
`1`         | Variable nativa que guarda el primer argumento pasado al script.
`2`         | Variable nativa que guarda el segundo argumento pasado al script.
`#`         | Variable nativa que guarda el número de argumentos pasados al scritp.
`read`      | Comando para guardar un input del usuario desde el teclado.
|<img width=100/>   | |
