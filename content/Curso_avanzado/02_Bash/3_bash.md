# Bucles y funciones

Los bucles, o `loops` en inglés, permiten repetir líneas de código iterando sobre una secuencia o estructura de datos, como los arreglos que vimos antes, o en base a condiciones/operaciones lógicas. En bash hay dos tipos de bucles: `for` y `while`. Dentro de los bucles se pueden añadir estructuras de control condicional `if-else`, variables, operaciones aritméticas, funciones de bash, entre otras cosas.

## *For loops* sobre secuencias/estructuras de datos

Se realizan acciones iterativas sobre cada elemento de una `secuencia o estructura de datos` (braces, arreglos, u otras). La estructura general del for loop es la siguente: 
```bash
for índice in brace o arreglo
do
    Acciones que se ejecutan de forma iterativa
done 
```
La estructura general del for loop sobre estructuras con condicionales if-else es la siguente:
```bash
for índice in brace o arreglo
do
    if [[ operación lógica ]]
    then
        Acciones que se ejecutan de forma iterativa 
    fi
done 
```
Creamos un 

```bash
#!/bin/bash    
# File: forloop.sh    
min=1000
echo Ingrese la cantidad de numeros:
read n
for((i=1;i<=n; i++))
do    
    echo Elemento $i:
    read num
    if (( num < min ))
    then
        let min=num
    fi
done
echo   El menor es: $min  
```






