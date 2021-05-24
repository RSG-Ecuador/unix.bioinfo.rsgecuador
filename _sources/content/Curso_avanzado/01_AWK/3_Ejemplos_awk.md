# Ejemplos generales y con enfoque en Bioinformática

En esta parte veremos algunos ejemplos generales y otros con enfoque en Bioinformática aplicando las estructuras y sintaxis de AWK. 

```{admonition} Advertencia
:class: warning
En este tutorial usaremos la herramienta *gawk*, que viene instalada por defecto en la mayoría de distribuciones de GNU/Linux. Puede que algunos de los comandos usados con esta herramienta no sean compatibles con otras versiones del programa usadas en MacOS, por lo que les recomendamos instalar *gawk* usando el gestor de paquetes *brew*, cuyas indicaciones de instalación se encuentran en el siguiente [link](https://formulae.brew.sh/formula/gawk).
```

## Archivos para este tutorial
En este tutorial usaremos algunos de los archivos que se encuentran en la carpeta `_files` dentro del directorio raíz del [repositorio de Github](https://github.com/RSG-Ecuador/unix.bioinfo.rsgecuador), por lo que si no poseen este directorio, descarguen el repositorio de GitHub y copien la carpeta `_files` a su directorio de trabajo. En todos los ejercicios asumiremos que están trabajando dentro de la carpeta `_files`, por lo que no usamos ningún path relativo para trabajar con los archivos.

## Ejemplos de scripts de AWK solo con patrones

Utilizando la estructura de scripts de AWK solo con patrones, su funcionamiento es similar al comando [grep](https://rsg-ecuador.github.io/unix.bioinfo.rsgecuador/content/Curso_basico/04_Procesamiento_ficheros_regex_pipes/4_Grep.html), que vimos en un tema anterior. 

Por ejemplo, si queremos imprimir todos los headers de las secuencias del archivo `sul_genomas.fasta` con AWK podemos usar el siguiente comando: 

```bash
$ gawk '/>/' sul_genomas.fasta
```

Por otra parte, si queremos imprimir las líneas que contienen información del aminoácido CYS del archivo `3c5x.pdb` con AWK, usaríamos el siguiente comando:

```bash
$ gawk '/CYS/' 3c5x.pdb
```
En el resultado del comando anterior se observa se imprimen líneas que no corresponden a la información de las coordenadas de los átomos, que sería lo deseado. Para obtener la información solamente de los átomos podemos modificar la regex de la siguiente forma: 

```bash
$ gawk '/^ATOM.*CYS/' 3c5x.pdb
```

En lugar de patrones, también se pueden definir operaciones lógicas con las variables internas de AWK. Por ejemplo, para imprimir la línea 1000 del archivo `3c5x.pdb` podemos usar el siguiente comando: 

```bash
$ gawk 'NR == 1000' 3c5x.pdb
```

O si queremos imprimir las líneas del archivo `sul_genomas.fasta` que tengan más de 3 espacios funcionaría el siguiente comando: 

```bash
$ gawk 'NF > 3' sul_genomas.fasta
```

Además, podemos usar un comando de AWK añadiendo algunos operadores `OR` para eliminar la información extra de un archivo pdb, como `3c5x.pdb`, de la siguiqnete forma: 

```bash
$ gawk '$1=="ATOM" || $1=="HETATM" || $1=="TER" || $1=="END"' 3c5x.pdb > 3c5x_clean.pdb
```

## Ejemplos de scripts de AWK solo con acciones 

También es posible definir un script de AWK solamente con acciones. Por ejemplo, podemos escribir el típico script de **Hola mundo** en AWK de la siguiente forma: 

```{admonition} Nota
:class: note
Para ver el resultado debes pulsar la tecla `Enter`, y para terminar la ejecución `Control+C`. 
```

```bash
$ gawk '{print "Hola mundo!"}' 
```

Ahora les presentamos un ejemplo de piping usando el comando echo y AWK: 

```bash
$ echo "Hola Sebastián" | awk '{$2="reemplaza aquí tu nombre"; print $0}'
```

Para imprimir todas las líneas del archivo `secuencia1.fasta` con información del nombre de archivo, registro y número de registro, se puede usar el siguiente comando: 

```bash
$ gawk '{print FILENAME, $0, NR}' secuencia1.fasta
```

Finalmente, les presentamos un ejemplo para conocer la ubicación de todas las cuentas de usuario registradas en su SO, información disponible en el archivo `/etc/passwd`:

```{admonition} Nota
:class: note
El archivo `/etc/passwd` está disponible en SO GNU/Linux, por lo que es posible que para usuarios de MacOS el comando no funcione.  
```

```bash
$ gawk -F: '{print $1 " home at " $6}' /etc/passwd
```

## Ejemplos de scripts de AWK con patrones, acciones y bloques BEGIN 

Otra forma de imprimir la información de los headers de las secuencias del archivo `sul_genomas.fasta` con AWK sería especificando el separador de registros (`RS`) en un bloque `BEGIN`, de la siguiente forma: 

```bash
$ gawk 'BEGIN {RS=">"} {print $1, $2, NR}' sul_genomas.fasta
```

De esta forma, podemos trabajar de forma más eficiente con la información de este archivo. Por ejemplo, para imprimir el ID de la cepa `OLIH` de Candidatus Sulcia muelleri podría usar los siguientes comandos: 

```bash
$ gawk 'BEGIN{RS=">"} /OLIH/ {print $1}' sul_genomas.fasta
```

```bash
$ gawk 'BEGIN{RS=">"} $6 == "OLIH" {print $1}' sul_genomas.fasta
```

Por otra parte, si quisiera obtener la secuencia solamente de la cepa `TETUND` de Candidatus Sulcia muelleri se aplicaría el siguiente comando: 

```bash
$ gawk 'BEGIN{RS=">"} $6 =="TETUND," {print $0}' sul_genomas.fasta
```

Ahora, si queremos verifcar el número de veces que se repite el motivo **CXXXAAA** en la secuencia de la cepa `OLIH` de Candidatus Sulcia muelleri podemos usar el siguiente comando: 

```bash
$ gawk 'BEGIN{RS=">"} $6 == "OLIH"' sul_genomas.fasta | gawk '/C...AAA/{x++}END{print x}'
```

Y si queremos conocer el número de línea y los nucleótidos de las líneas que coinciden con el motivo **CXXXAAA**, usamos el siguien código: 

```bash
$ gawk 'BEGIN{RS=">"} $6 == "OLIH"' sul_genomas.fasta | gawk '/C...AAA/{print NR, $0}'
```

También podemos especificar los caracteres `ATOM` como separador de registros para imprimir información específica sobre los átomos del archivo `3c5x.pdb`: 

```bash
$ gawk 'BEGIN {RS="ATOM"} {print $1, $2, NR}' 3c5x.pdb
```

Por ejemplo, para imprimir el nombre del aminoácido, la cadena proteica, y la inicial del elemento de todos los átomos del archivo `3c5x.pdb`, podemos usar el siguien código: 

```bash
$ gawk 'BEGIN {RS="ATOM"} {print $3, $4, $11}' 3c5x.pdb
```

## Ejemplos de scripts de AWK con patrones, acciones, y bloques BEGIN y END

Para determinar la longitud de una secuencia de nucleótidos con AWK, a partir de un string excrito con el comando echo, podemos usar el siguiente comando: 

```bash
$ echo 'atattGAATTCTAGCACATACTAACGGACC' | awk 'END{print $0, "tiene", length($0), "nt de longitud"}'
```

Podemos usar una idea similar para determinar el tamaño de la secuencia de la cepa `OLIH` de Candidatus Sulcia muelleri del archivo `sul_genomas.fasta`:

```bash
$ gawk 'BEGIN{RS=">"} $6 == "OLIH"' sul_genomas.fasta | sed '1d' | gawk '{sum=sum+length($0)} END{print "Secuencia de cepa OLIH de Candidatus Sulcia muelleri tiene", sum, "nt de longitud"}'
```

Además, podemos usar un comando de AWK para verificar el número de procesadores de nuestra computadora, usando la información del archivo `/proc/cpuinfo`, de la isguiente forma:

```{admonition} Nota
:class: note
El archivo `/proc/cpuinfo` está disponible en SO GNU/Linux, por lo que es posible que para usuarios de MacOS este comando no funcione.  
```

```bash
$ gawk '/^processor/ {n++} END{ print "Esta computadora tiene", n, "procesadores"}' /proc/cpuinfo 
```

```{admonition} Nota importante
:class: note
En los ejemplos presentados en este capítulo no usamos algunas estructuras de programación importantes como condicionales, bucles, y funciones, ya que esto lo veremos en detalle en el tema de Bash. Luego de revisar los temas de estructuras de programación en Bash ustedes podrán aplicarlos sin problemas en AWK. 
```

## Material suplementario

La mayoría de los contenidos de esta parte se obtuvieron de la documentación oficial de *GNU*, que pueden acceder con el siguiente [link](https://www.gnu.org/software/gawk/manual/gawk.html) y del manual del Curso avanzado de programación AWK y Bash para bioinformática y biocómputo en sistemas GNU/Linux del profesor Pablo Vinuesa de la UNAM, que pueden encontrar en este [link](https://vinuesa.github.io/intro2linux/index.html).