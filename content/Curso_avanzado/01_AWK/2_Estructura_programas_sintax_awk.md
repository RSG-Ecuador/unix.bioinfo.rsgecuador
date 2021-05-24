# Estructura de scripts y sintaxis AWK

En esta parte estudiaremos cómo se estructuran los scripts de AWK, y la sintaxis de las estructuras de programación más usuales. 

## Estructura scripts AWK

Un script típico del lenguaje AWK consiste en varias líneas de código con alguna(s) de la(s) siguiente(s) estructura(s):

|**Estructura de script**| **Descripción**|
|:---:|:---:|
|`/patrón/`|Se imprimen las líneas que contengan un patrón|
|`{acción}`|Se ejecuta una acción en todos los registros del archivo analizado|
|`/patrón/ {acción}`|Se ejecuta una acción o acciones en las líneas que tengan un patrón (caracteres normales o regex)|
|`BEGIN {acción}`|Ejecuta ciertas acciones antes de que el o los archivo(s) sea(n) procesado(s). Se establecen variables como `RS`, `FS`, `OFS`, entre otras|
|`END {acción}`|Ejecuta ciertas acciones luego de procesar el o los archivo(s)|

El intérprete *gawk* analiza el script de AWK línea por línea, de izquierda a derecha. Si existen dos sentencias *BEGIN*, sus contenidos se ejecutan en orden de aparición. No es necesario que *BEGIN* y *END* estén en orden en el script.

## Sintaxis de AWK

Los usos que se han visto hasta ahora se podrían haber realizado con otras herramientas ya conocidas como grep, sed, y otras. Sin embargo, AWK va más allá de las herramientas mencionadas, puesto que es un lenguaje de programación completo y posee condicionales, bucles, algunos operadores y muchas funciones para trabajar con archivos de texto. A continuación se presenta un resumen de las principales estructuras sintácticas:

|**Estructura de programación**| **Sintaxis**|
|:---:|:---:|
|**Condicionales**|`if(condición1){script1} else if(condición2){script2} else{script3}`|
|**Bucles for**|`for(índice in arreglo){script}; for(inicializar contador;condición;aumentar/disminuir contador)`|
|**Bucles while**|`while(condición){script}`|
|**Operadores aritméticos**|`+, -, *, /, %, =, ++, –, +=, -=`|
|**Operadores boleanos**|`||, &&`|
|**Operadores relacionales**|`<, <=, == !=, >=, >`|
|**Funciones integradas**|`length(str); int(num); index(str1, str2); split(str,arr,del); substr(str,pos,len); printf(fmt,args); tolower(str); toupper(str); gsub(regexp, replacement [, target])`|
|**Funciones escritas por el usuario**|`function FUNNAME (arg1, arg1){code}`|
|**Estructuras de datos (arreglos):**|`array[string]=value`|

En este resumen se encuentran las estrcuturas más usadas, pero existen muchas más partes en el lenguaje AWK que no revisaremos en este curso.

## Material suplementario

La mayoría de los contenidos de esta parte se obtuvieron de la documentación oficial de *GNU*, que pueden acceder con el siguiente [link](https://www.gnu.org/software/gawk/manual/gawk.html) y del manual del Curso avanzado de programación AWK y Bash para bioinformática y biocómputo en sistemas GNU/Linux del profesor Pablo Vinuesa de la UNAM, que pueden encontrar en este [link](https://vinuesa.github.io/intro2linux/index.html).