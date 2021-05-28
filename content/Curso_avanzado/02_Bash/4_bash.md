# Funciones
Una función es un fragmento de código que tiene un nombre y que cumple una función específica. Como en matemática, una función es un mapa que transforma una cosa en otra. Por ejemplo, una función cuadrática puede escribirse de la forma:

```{math}
f(x) = x^2
```

Esta transformación cambia 2 a 4, 3 a 9, etc. Es una regla. Las funciones en programación se entienden de la misma manera, pero pueden operar con mucho más que solo números. Pueden ser strings, arreglos, objetos y varias otras funciones. La mayor ventaja es que se pueden reutilizar muchas veces dentro de un programa o desde la terminal. El principal propósito de una función es *encapsular* un programa que vamos a usar una y otra vez. Esto es para evitar que debamos escribir todo de nuevo cuando queramos reusar el programa. Para definir una función en Bash, primero se debe escribir la palabra clave **function** y luego se le da un nombre. La estructura general del una función es la siguente: 
```bash
function nombre_función() {
    Acciones. 
}
```
Utilizando el comando `source` se pueden usar como comandos de Terminal. También es posible correrlos con el comando `bash`.
```shell
$ bash nombre_archivo_con_función.sh
$ source nombre_archivo_con_función.sh
```

Es importante saber que las funciones pueden operar como programas independientes, por lo que tienen sus propios accesos a argumentos de entrada con los caracteres especiales `1`, `2`, etc. Por ejemplo, para la función cuadrática antes vista, en Bash se la debería escribir de esta manera:
```bash
#!/bin/bash
# Files: funcion1.sh
function cuadratica_v1(){
    echo "El cuadrado de $1 es $(($1**2))"
}
function cuadratica_v2(){
    f=$(($1**2))
}
function suma_de_tres(){
    suma=$(($1 + $2 + $3))
}

cuadratica_v1 2
cuadratica_v2 3
echo "El cuadrado de 3 es $f"
suma_de_tres 1 2 3
echo "La suma da $suma"
```
```shell
$ source funcion1.sh
```

Es importante saber que una función **siempre debe ser declarada antes de ser usada**. Sino Bash no sabrá que esta función existe. Es decir, no es posible hacer esto:
```bash
#!/bin/bash
# File: funcion1.sh
cuadratica_v1 2
cuadratica_v2 3
echo "El cuadrado de 3 es $f"
suma_de_tres 1 2 3
echo "La suma da $suma"

function cuadratica_v1(){
    echo "El cuadrado de $1 es $(($1**2))"
}
function cuadratica_v2(){
    f=$(($1**2))
}
function suma_de_tres(){
    suma=$(($1 + $2 + $3))
}
```
Todas las variables en Bash son `globales` a menos que se especifique lo contrario. Es decir, se puede acceder a ellas desde cualquier lugar del script. En el ejemplo, se ha escrito `echo "El cuadrado de 3 es $f"`. Esta línea de código accede a una variable declarada dentro de la función `cuadratica_v2`. A veces esto puede ser problemático, otras veces puede ser necesario. Depende del uso que se le de a la función. Se puede usar la palabra `local` para especificar a Bash que una función tenga uso exclusivo de una variable, y que no se la pueda usar fuera:
```bash
#!/bin/bash
# File: funcion2.sh
variable1=1
variable2=2
function variables_locales(){
    local variable1=3
    local variable2=4
    echo "Las variables locales son $variable1 y $variable2"
}

variables_locales
echo "Las variables globales son $variable1 y $variable2"
```
```shell
$ source funcion2.sh
```
Ahora, un ejemplo de una función para calcular la suma de un conjunto de números:
```bash
#!/bin/bash
# File: funcion_suma.sh
function funcion_suma() {
    sum=0
    for element in $@
    do
        let sum=sum+$element
    done

    echo $sum
}

funcion_suma 1 2 3 4
```
```shell
$ source funcion_suma.sh
```

```{admonition} Deber
:class: hint
Escribir estos scripts, correr los archivos, tomar screenshot. Entregar scripts y screenshots.
```