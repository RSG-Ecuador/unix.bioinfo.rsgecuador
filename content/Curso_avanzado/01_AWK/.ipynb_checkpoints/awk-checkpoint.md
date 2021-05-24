# **AWK**
* Lenguaje de programación diseñado para procesamiento de archivos de texto. Fue implementado en UNIX. 
* *awk* es el programa de UNIX que permite correr scripts escritos en AWK.
* AWK es un lenguaje interpretado por el intérprete *awk*.
* *awk* fue implementado en GNU/Linux con el nombre de *gawk*, del que actualmente hay mucha [documentación](https://www.gnu.org/software/gawk/manual/gawk.html).

## **1. Verificar *gawk* en el sistema o instalarlo**
Para verificar si poseen *awk* en el sistema deben abrir una terminal y escribir:


```bash
gawk --version
```

En caso de que no tengan instalada la aplicación deben instalarla usando el gestor de paquetes apt, de la siguiente manera:

> sudo apt install gawk

## **2. Elementos y variables internas de *gawk***

* El intérprete *awk* necesita dos elementos:
    1. Archivo con instrucciones escritos en AWK.
    2. Uno o más archivos de entrada.
    
    
  La estructura sería de la siguiente forma:
    
> gawk ‘programa_AWK’ archivo1 archivo2 …

* El nombre del archivo que se procesa por *gawk* se guarda en la variable interna (vi) **FILENAME**.
* *gawk* procesa los archivos por elementos llamados *registros* que siguen las instrucciones del archivo AWK.
* El **separador de registros** se almacena en la vi **RS**. Por defecto, los registros se separan por saltos de línea (RS = "\n"), pero esto se puede cambiar. 
* El número de registros del archivo en procesamiento se almacena en la vi **FNR**. 
* El número de registros que se han procesado se guarda de forma acumulativa en la vi **NR**.

**Pregunta: ¿En archivos multifasta y pdb cuáles serían separadores de registros adecuados?**


Ejemplo sencillo con archivos multifasta:


```bash
gawk '{print FILENAME, FNR, NR}' archivos/secuencias.fasta
```

**Preguntas: ¿Porqué los valores de FNR y NR son iguales en todas las líneas? ¿Cuántas líneas se imprimen y porqué se imprime este número de líneas?**


```bash
gawk '{print FILENAME, FNR, NR}' archivos/secuencias.fasta archivos/secuencias3.fastq
```

**Pregunta: ¿Son iguales los valores FNR y NR en todas las líneas?**

* Por defecto, cada registro procesado por *gawk* se divide por campos separados por espacios, tabuladores o saltos de línea. El separador de campo se almacena en la vi **FS**. Por defecto, el separador de campo es un espacio (FS = " ").
* Cada campo del registro se guarda en variables internas entre `$1` y `$n`

* El contenido completo del registro se almacena en `$0`, y el número total de campos en la vi **NF**


```bash
echo -e  " campo1  campo2\tcampo3,-#%...  " | gawk '{print NF, "["$1"]", "["$2"]"}'
echo -e  " campo1  campo2\tcampo3,-#%...  " | gawk '{print NF, "["$3"]", "["$1"]"}'
echo -e  " campo1  campo2\tcampo3,-#%...  " | gawk '{print NF, "["$0"]"}'
```


```bash
echo -e  " campo1  campo2\tcampo3,-#%...  " | gawk '{print NF, $NF}'
```

**Pregunta: ¿Porqué al poner $NF se imprime el campo 3?**

Notas importantes:
1. Múltiples espacios en blanco (incluyendo tabuladores) separando campos de texto se ignoran, colapsándose, por lo que NF vale 3.
2. Por lo explicado en 1, las variables `$1-$n` sólo llevan el valor del campo delimitado por los espacios, como muestran las salidas de las líneas 1 a 3.
3. En cambio la variable `$0`, que lleva un registro completo, imprime los separadores de campo del mismo, como muestra la línea 4 de la salida mostrada arriba.
4.Print imprime los argumentos que se le pasan separados por comas, dejando por defecto un espacio sencillo entre ellos (OFS=" “).

Para encadenar otro programa de GNU/Linux con *awk* se realiza lo siguiente:
> programa_GNU/Linux | gawk ‘programa_AWK’ > resultado.txt

## **3. Estructura programas AWK**

Un script típico del lenguaje AWK consiste en varias líneas de código con la siguiente estructuras:
* `/patrón/ {acción}`: Se ejecuta una acción o acciones en las líneas que tengan un patrón (caracteres normales o regex).
* `/patrón/`: Se imprimen las líneas que contengan un patrón.
* `{acción}`: Se ejecuta una acción en todos los registros del archivo analizado. 
* `BEGIN {acción}`: Ejecuta ciertas acciones antes de que el o los archivo(s) sea(n) procesado(s). Se establecen variables como RS, FS, OFS, entre otras.
* `END {acción}`: Ejecuta ciertas acciones luego de procesar el o los archivo(s). 

El intérprete *gawk* analiza el script de AWK línea por línea, de izquierda a derecha. Si existen dos sentencias *BEGIN*, sus contenidos se ejecutan en orden de aparición. *BEGIN* y *END* no deben estar en orden en el script.

Como vimos, un separador de registro adecuado para los archivos multifasta sería el símbolo `>`, por lo que podemos establecer esta vi en la sentencia *BEGIN* para trabajar con estos archivos, de la siguiente forma:


```bash
gawk 'BEGIN {RS=">"} {print RS, NR, $1, $2}' archivos/secuencias.fasta
```

Algunos ejemplos sencillos de comandos de AWK:

**Pregunta: ¿Cómo imprimo la inicial del elemento de los átomos del archivo 3c5x.pdb usando un comando de AWK?**


```bash
gawk 'BEGIN {RS="ATOM"} {print $11}' archivos/3c5x.pdb
```

**Pregunta: ¿Cómo imprimo las líneas del archivo 3c5x.pdb solamente de los átomos, sin incluir la parte informativa inicial, usando un comando de AWK y otros comandos de GNU/Linux aprendidos?**


```bash
sed '1, 579d' archivos/3c5x.pdb | gawk 'BEGIN {RS="ATOM"} {print $11}' 
```

**Pregunta: ¿Cómo imprimo las líneas del archivo 3c5x.pdb que contengan un aminoácido de cisteína (CYS) usando un comando de AWK?**


```bash
gawk 'BEGIN {RS="ATOM"} /CYS/' archivos/3c5x.pdb
```

**Pregunta: Sin usar el comando sed ¿De qué otra forma puedo imprimir las líneas del archivo 3c5x.pdb solamente de los átomos que contengan CYS, sin incluir la parte informativa inicial, usando un comando de AWK y otros comandos de GNU/Linux aprendidos?**


```bash
grep "CYS " archivos/3c5x.pdb | gawk 'BEGIN {RS="ATOM"} /CYS/'
```

**Pregunta: Sin especificar RS como `>` y dejando el separador de registros por defecto, ¿De qué otra forma imprimo los nombres de las secuencias del archivo secuencias.fasta usando un comando de AWK?**


```bash
gawk '/>/' archivos/secuencias.fasta
```

**Pregunta: ¿Cómo imprimo la línea 1000 del archivo 3c5x.pdb usando un comando de AWK? Pista: se puede usar la vi NR**


```bash
gawk 'NR == 1000' archivos/3c5x.pdb
```

    ATOM    421  CG  LYS A  51      13.218 -28.565 -15.894  1.00 69.90           C


**Pregunta: ¿Cómo imprimo las líneas del archivo sul_genomas.fasta que tengan más de 3 espacios usando un comando de AWK? Pista: se puede usar la vi NF**


```bash
gawk 'NF > 3' archivos/sul_genomas.fasta
```

**Pregunta: ¿Cómo imprimo la información solo de la cepa TETUND de Candidatus Sulcia muelleri del archivo sul_genomas.fasta usando un comando de AWK?**


```bash
gawk 'BEGIN{RS=">"} /TETUND/ {print $0}' archivos/sul_genomas.fasta
```


```bash
gawk 'BEGIN{RS=">"} $6 =="TETUND," {print $0}' archivos/sul_genomas.fasta
```

**Pregunta: ¿Cómo imprimo el ID de la cepa OLIH de Candidatus Sulcia muelleri del archivo sul_genomas.fasta usando un comando de AWK?**


```bash
gawk 'BEGIN{RS=">"} /OLIH/ {print $1}' archivos/sul_genomas.fasta
```


```bash
gawk 'BEGIN{RS=">"} $6 == "OLIH" {print $1}' archivos/sul_genomas.fasta
```

**Pregunta: ¿Cómo verifico si la cepa GWSS de Candidatus Sulcia muelleri del archivo sul_genomas.fasta posee el motivo CXXXAAA usando un comando de AWK?**


```bash
gawk 'BEGIN{RS=">"} $5 == "GWSS,"  && /C...AAA/ {print $1}' archivos/sul_genomas.fasta 
```

## **4. Sintaxis de AWK**

Los usos que se han visto hasta ahora se podrían haber realizado con otras herramientas ya conocidas como grep, sed, y otras. Sin embargo, AWK va más allá de las herramientas mencionadas, puesto que es un lenguaje de programación completo y posee condicionales, bucles, algunos operadores y muchas funciones para trabajar con archivos de texto. A continuación se presenta un resumen de las principales estructuras sintácticas:

* **Condicionales:** `if(condicion1){code1}else if(condición2){code2}else{code3}`
* **Bucles for:** `for (i in array){code}; for(initialization;condition;increment|decrement)`
* **Bucles while:** `while(true){code}`
* **Operadores aritméticos:** `+, -, *, /, %, =, ++, –, +=, -=)`
* **Operadores boleanos:** `||, &&`
* **Operadores relacionales:** `<, <=, == !=, >=, >`
* **Funciones integradas:** `length(str); int(num); index(str1, str2); split(str,arr,del); substr(str,pos,len); printf(fmt,args); tolower(str); toupper(str); gsub(regexp, replacement [, target])`
* **Funciones escritas por el usuario:** `function FUNNAME (arg1, arg1){code}`
* **Estructuras de datos (hashes o arreglos asociativos):** `array[string]=value`

En este resumen se encuentran las estrcuturas más usadas, pero existen muchas más partes en el lenguaje AWK.

## **5. Resumen de las variables internas de AWK más comunes**

* `$0`: guarda el valor de la fila actual en memoria de un archivo de entrada

* `$1-$n`: guarda los contenidos de los campos de una fila

* `ARGC`: variable que guarda el número de argumentos (+1) pasados al script desde la línea de comandos, después del bloque de código
* `ARGV`: arreglo que guarda los argumentos pasados al script desde la línea de comandos, después del bloque de código. ARGV[0] contiene awk
* `FILENAME`: nombre del archivo de entrada actualmente en procesamiento
* `FS (Field Separator)`: separador de campos (por defecto SPACE or TAB)
* `NR (Number or Records)`: guarda el número de campos delimitados por FS en registro o fila actual
* `OFS (Output Field Separator)`: separador de campo de la salida (SPACE por defecto)
* `ORS (Output Return Separator)`: separador de registro de la salida (\n por defecto)

Algunos ejemplos más complicados de awk aplicados a Bioinformática: 

**Pregunta: ¿Cómo se podría determinar la longitud de una cadena (de oligonucleótido de DNA) usando un comando de AWK?**


```bash
echo 'atattGAATTCTAGCACATACTAACGGACC' | awk 'END{print "oligo",  $0, "tiene", length($0), "nt de longitud"}'
```

    oligo atattGAATTCTAGCACATACTAACGGACC tiene 30 nt de longitud


**Ejemplo de uso de awk para determinar el número de procesadores de un equipo**


```bash
awk '/^processor/ {n++} END{ print "This computer has", n, "processors"}' /proc/cpuinfo 
```

    This computer has 4 processors


**Ejemplo de uso de awk para limpiar archIvos pdb**


```bash
awk '$1=="ATOM" || $1=="HETATM" || $1=="TER" || $1=="END"' archivos/3c5x.pdb > 3c5x_clean.pdb
```

## **Referencias**

* Vinuesa, P (2020). Curso avanzado de programación AWK y Bash para bioinformática y biocómputo en sistemas GNU/Linux. https://vinuesa.github.io/intro2linux/index.html#el-lenguaje-de-procesamiento-de-patrones-awk-y-su-sucesor-gawk

