# Lógica, condicionales y arreglos

## Lógica
Los programas son capaces de ejecutar lógicas bastante complejas. La forma de hacerlo es concatenando **estructuras de control** o sentecias de control. Estas sentencias permiten controlar el flujo de ejecución de las instrucciones de un programa. La primera estructura que veremos son los condicionales. 

Los condicionales le permiten a un programa decidir en función de la veracidad de una sentencia lógica. Una sentencia lógica puede clasificarse en 2 tipos de acuerdo a su veracidad: *verdadera* o *falsa*. Por ejemplo, al procesar un archivo de secuencias de ADN, un script puede analizar de un conjunto de lecturas solo las que cumplan con un criterio de calidad o un script podría decidir si extraer secuencias con un patrón específico. Los tipos de datos que guardan el estado de verdad de una sentencia se llaman **booleanos**. 

En Bash, las variables booleanas se llaman `true` y `false`. Ambas se guardan en memoria como un `0` y un `1`, respectivamente. Esto se puede ver al imprimir la *variable de estado de salida* `$?`. 
```shell
$ true
$ echo $?
$ false
$ echo $?
```
Hay varios tipos de *estados de salida*. Uno importante es el `127`, que denota un error en el script. 
```shell
$ variable
$ echo $?
```
Es posible también concatenar variables lógicas y evaluar su veracidad a la vez. Por ejemplo, podríamos evaluar si la sentencia `E. coli es un animal y un procariota` es verdadera. Hay dos proposiciones de verdad que evaluar: *si E. coli es animal* y *si E. coli es procariota*. Sabemos que la primera es `falsa` y la segunda es `verdadera`. Si juntamos ambas en una sola sentencia, claramente es `falsa`, porque *E. coli* no puede ser procariota `Y (&&)` animal a la vez. Instantáneamente al combinar una sentencia falsa con una verdadera mediante el operador lógico `Y (&&)`, el conjunto es falso. Las 4 combinaciones posibles de sentencias son:
```shell
$ true && false
$ echo $?
$ false && true
$ echo $?
$ false && false
$ echo $?
$ true && true
$ echo $?
```
¡Hay solo 1 sentencia verdadera! El operador lógico para `AND` en Bash es `&&`. Es binario, por lo que concatena dos proposiciones lógicas a la vez. Por ejemplo, podemos hacer dos comparaciones de equivalencia y ver si ambas son verdad a la vez.
```shell
$ [[ 1 == 2 ]] && [[ 1 == 1 ]]
$ echo $?
```
Si repetimos el penúltimo escript con el operador `OR` `||`, veremos que los resultados son distintos. Ahora solo hay 1 sentencia falsa. En `OR` basta que uno de ambas propociciones comparadas sea verdad, para que el resultado sea también verdad. Entonces solo cuando hubiera dos false sería el resultado false. 
```shell
$ true || false
$ echo $?
$ false || true
$ echo $?
$ false || false
$ echo $?
$ true || true
$ echo $?
```
Podemos combinar `AND` y `OR`. ¿Qué resulta de estas sentencias? ¿Verdadero o falso?
```shell
$ true || false && true
$ echo $?
$ false || false && true
$ echo $?
$ true || false && false
$ echo $?
$ true || false && true || false
$ echo $?
```
Las expresiones condicionales utilizan este tipo de variables para analizar si una propocición es verdadera o falsa, y dependiendo del resultado, ejecutar o no una acción. Las `sentencias lógicas` se declaran utilizando doble corchete o `double braces`, y aceptan **operadores lógicos** como AND y OR, o también **flags lógicas**. Existen varios flags útiles en Bash `revisar página 104` del libro de Sean Kross, como `-ge`, *greater or equal to*, que vemos a continuación.
```shell
$ [[ 4 -lt 3 ]]
$ echo $?
```
```shell
$ [[ 4 -ge 3 ]]
$ echo $?
```
```shell
$ number=7
$ [[ $number -gt 3 ]] && echo t || echo f
$ [[ $number -gt 10 ]] && echo t || echo f
$ [[ -e $number ]] && echo t || echo f
```

## Estructuras de control condicional: `if-else`
```{image} ./img/if.png
:alt: ./img/if.png
:width: 600px
:align: center
```
La estructura general de los condicionales `if-else` es la siguente. Siempre inicia con la sentencia `if`, seguida de una operación lógica. Inmediatamente sigue, en la siguiente línea, la sentencia `then`. Esta sentencia inicia la sección de código que se ejecuta solo si la operación lógica anterior es verdad. Se pueden concatenar las secuencias lógicas para armar cada vez más casos de evaluación, con `elif`, que equivale a pensar *else if ...*, para una nueva operación lógica y un `then`. Finalmente, si no hay más operaciones lógicas que evaluar, se incluye la sentencia `else`, seguida de una acción a realizar si ninguna operación lógica previa se cumplió. Se usa mucho para mostrar mensajes de error o mensajes de aviso:
```bash
if [[ operación lógica 1 ]]
then
    Acciones si la operación lógica 1 es verdad
elif [[ operación lógica 2 ]]
then
    Acciones si la operación lógica 2 es verdad
else
    Acciones si ninguna operación lógica es verdad
fi 
```
Ahora veamos como funciona un script de Bash utilizando sentencias `if`, para averiguar si un número es par o impar. Este número será el primer argumento del programa. Como verás, en la cuarta línea del script usamos la sentencia `let n=$1%2`. Lo que hacemos es declarar una operación algebraica con el primer argumento del programa. Es decir, al programa le daremos un número que evaluar si es par o no. Este número se guarda bajo la variable `1`. Es un caracter reservado por Bash para guardar el primer argumento que se le da a un script. El segundo sería con `2`, el tercero con `3`, etc.
```bash
#!/bin/bash
# File: oddeven.sh

echo "Empieza el programa"
let n=$1%2
if [[ $n -eq 0 ]]
then
    echo "El número $1 es par."
else 
    echo "El número $1 es impar."
fi
echo "Termina el programa"
```
```shell
$ bash oddeven.sh 4
$ bash oddeven.sh 5
```
Ahora veamos cómo podemos aumentar las capas lógicas al utilizar sentencias `if` anidadas, y hacer un poco más complejo el código.
```bash
#!/bin/bash
# File: oddeven.sh

echo "Empieza el programa"
let n=$1%2
if [[ $n -eq 0 ]] && [[ $1 -gt 0 ]]
then
    echo "El número $1 es par positivo."
    let t=$1%3
    let c=$1%5
    if [[ $t -eq 0 ]]
    then
        echo "Es divisible para 3."
    elif [[ $c -eq 0 ]]
    then
        echo "Es divisible para 5."
    else
        echo "No es divisible para 3 ni para 5"
    fi
else
    echo "El número $1 puede ser impar, menor a 0 o ambos."
fi
echo "Termina el programa"
```

```shell
$ bash oddeven.sh 2
$ bash oddeven.sh 25
$ bash oddeven.sh -7
$ bash oddeven.sh 30
```
```{admonition} Deber
:class: hint
Crea el script `oddeven.sh` más completo y córrelo las 4 veces. Toma una captura de pantalla del proceso. Guarda la captura de pantalla en `~/taller_unix/9_bash`, o en otra carpeta si tu instalación de Linux dificulta que guardes en este directorio.

También responde: 

1. El número 30 es divisible para 5 y 3. ¿Por qué nos dice nuestro programa que 30 es divisible para 3 y no de 5? ¿Cómo podríamos cambiar el código para que atrape las dos condiciones a la vez?
2. ¿Por qué crees que fue útil usar las variables `n`, `t` y `c` en este script?
3. ¿Ya entiendes mejor cómo funciona el último scritp de la sección anterior?
```

## Arreglos

La información puede ser procesada de manera eficiente en **estructuras de datos**. Las esturcturas de datos son formas de organizar los datos. Pueden ser tan complejas como sea necesario. Varios algoritmos requieren el diseño de estructuras de datos con particularidades para facilitar el procesamiento de datos. La primera estructura de datos se deriva del *álgebra lineal*, específicamente de las **tuplas**. Una *n-tupla* es una lista finita con *n* elementos ordenados. Abajo tenemos una tupla llamada *x*. El conteo empieza desde 0, hasta *n-1*.

```{math}
\textbf{x} = (x_0, x_1, x_2, \ldots, x_{n-1})
```

```{admonition} Nota
:class: note
Puede ser que en MacOS funcionen los accesos desde 1 y no desde 0. Esto significa que `echo ${bichos[0]}` no arroja nada, pero `echo ${bichos[1]}` arroja el primer elemento. También que `echo ${bichos[10]}` arroja lo que debería `echo ${bichos[9]}`, porque está una posición adelantada. Si corres esto en un Jupyter no debería haber ese problema.
```

Otros objetos matemáticos similares son los vectores y las matrices. Las tuplas se pueden operar con ciertas reglas algebráicas, e inspiraron varios tipos de estructuras de datos similares en computación. El primero que vamos a aprender son los **arreglos unidimensionales**. Estos contenedores se declaran con paréntesis `()` y cada elemento va separado por espacios, no por comas, como en una tupla. Podemos acceder a cada elmento

```shell
$ bichos=(mosca maroposa araña cucaracha saltamontes abeja piojo libelula escarabajo mantis)
$ echo ${bichos[0]}
$ echo ${bichos[1]}
$ echo ${bichos[2]}
$ echo ${bichos[*]}
```
También podemos actualizar los valores.
```shell
$ echo ${bichos[*]}
$ bichos[4]=hormiga
$ echo ${bichos[*]}
```
Podemos declarar subconjuntos de el mismo arreglo.
```shell
$ echo ${bichos[*]:5:3}
```
O encontrar la cantidad de elementos de una arreglo con el operador `#`.
```shell
$ echo ${#bichos[*]}
```
Si intentamos utilizar más de los elementos que posee el arreglo, entonces busca fuera del arreglo o no retorna nada. 
```shell
$ echo ${bichos[10]}
$ echo ${bichos[9]}
```

Y podemos usar el operador `+=` para concatenar dos arreglos. Concatenamos el anterior creado con *(lombriz escorpion pulga)*
```shell
$ bichos+=(lombriz escorpion pulga)
$ echo ${bichos[*]}
```
```{admonition} Deber
:class: hint
Coloca todas las operaciones de la sección de arreglos en un archivo llamado `arreblos.sh` en `~/taller_unix/9_bash`, luego correlo con bash. Toma una captura de pantalla del resultado. Guarda la captura de pantalla en `~/taller_unix/9_bash`, o en otra carpeta si tu instalación de Linux dificulta que guardes en este directorio.
```


## Tabla de comandos frecuentes

**Comando**| **Función**
-----------| --------------
`true`     | booleano para verdad 
`false`    | booleano para flasedad
`$?`       | variable de estado de salida (*exit status*)
`&&`       | operador lógico binario AND 
\| \|      | operador lógico binario OR 
`if`       | inicio de una sentencia condicional
`fi`       | final de una sentencia condicional
`else`     | siguiente posible decisión condicional en una estructura *if*
\[\[ \]\]  | doble braces
( )        | declaración de arreglos
`#`        | longitud de un arreglo
|<img width=100/>   | |