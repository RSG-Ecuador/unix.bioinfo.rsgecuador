# Respuestas ejercicios deber

A continuación se presentan algunos ejercicios sobre el tema de [procesamiento de ficheros, regex y pipes](https://rsg-ecuador.github.io/unix.bioinfo.rsgecuador/content/04_Procesamiento_ficheros_regex_pipes/0_Resumen.html) aplicados a Bioinformática. 

**Nota:** Para resolver estos ejercicios se necesita que hayan entenido de forma adecuada los temas de [Introducción a Unix y GNU/Linux](https://rsg-ecuador.github.io/unix.bioinfo.rsgecuador/content/01_Unix_GNU-Linux/0_Resumen.html), [Jupyter Lab](https://rsg-ecuador.github.io/unix.bioinfo.rsgecuador/content/02_JupyterLab/0_Resumen.html), y [Manejo terminal](https://rsg-ecuador.github.io/unix.bioinfo.rsgecuador/content/03_Manejo_terminal/0_Resumen.html).

El primer paso para realizar los ejercicios será descargar el repositorio de GitHub del curso, que lo pueden encontrar en el siguiente [link](https://github.com/RSG-Ecuador/unix.bioinfo.rsgecuador). Después, deben abrir una terminal y moverse a la carpeta en la que está el archivo del notebook, como se muestra a continuación: 

``` bash
cd ~/Downloads/unix.bioinfo.rsgecuador-gh-pages/Ejercicios_fines_de_semana/Curso_basico
```

Después, deben activar su ambiente de conda en el que instalaron Jupyter-Lab con kernel de Bash, e iniciar un servidor de Jupyter-Lab, como se muestra a continuación: 

``` bash
conda activate bash 
jupyter-lab
```

Finalmente, deben abrir una celda del notebook y moverse al directorio `_files` con el comando `cd`, como se muestra a continuación: 


```bash
cd ../../_files
```

Pueden verificar que están en la carpeta `_files` con el comando `ls`. 

**Nota:** Para todos los ejercicios asumimos que están trabajando dentro del directorio `_files`, por lo que comprueben que est se cumpla siempre que corran un comando. 


```bash
ls
```

**1. Vamos a realizar una simulación de dinámica molécular de la proteína prM del virus del Dengue (PDB ID: 3c5x) para replicar las condiciones biológicas en las que esta proteína se encuentra y obtener una estructura estable. Para esto usaremos el archivo `3c5x.pdb` que se encuentra en la carpeta `_files` dentro del directorio raíz del repositorio de GitHub**

**1.1.** Los archivos del Protein Data Bank (PDB) tienen una nomenclatura por defecto para los aminoácidos. En esta nomenclatura, la cysteína se nombra como *CYS*. Sin embargo, en algunos programas de simulación como *Amber* la nomenclatura de los aminoácidos es diferente. Para que el programa pueda reconocer los aminoácidos de cisteína, estos se deben nombrar como *CYX* en lugar de *CYS*. Usando los conocimientos adquiridos en el curso, transformar el nombre de todos los aminoácidos de cisteína del archivo `3c5x.pdb` de *CYS* a *CYX* y guardar el nuevo archivo como `3c5x_cyx.pdb` en la carpeta `_files`.


```bash
sed 's/CYS/CYX/g' 3c5x.pdb > 3c5x_cyx.pdb
```

**1.2.** Las primeras 579 líneas del archivo *3c5x.pdb* son informativas y no son parte de la secuencia que necesita el programa para realizar la simulación. Por tanto, queremos reemplazar el nombre *CYX* por *CYS* de las primeras 579 líneas del archivo `3c5x_cyx.pdb` creado previamente, y guardar el nuevo archivo como `3c5x_cyx_cys.pdb` en la carpeta `_files`.


```bash
sed '1,579 s/CYX/CYS/g' 3c5x_cyx.pdb > 3c5x_cyx_cys.pdb
```

**1.3.** Las primeras 579 líneas son solamente informativas y no influyen en la simulación de la proteína. Por tanto, queremos eliminar las líneas 4-579 del archivo `3c5x_cyx_cys.pdb` y guardar el nuevo archivo como `3c5x_cyx_cys_clean.pdb` en la carpeta `_files`.


```bash
sed '4,579d' 3c5x_cyx_cys.pdb  > 3c5x_cyx_cys_clean.pdb
```

**1.4.** Además de la información de los aminoácidos de las proteínas, los archivos PDB suelen tener información sobre átomos especiales como metales o puentes de hidrógeno, que se identifican con el código *HETATM* al inicio de las líneas. Supongamos que en nuestra simulación no nos interesan estos átomos y queremos eliminarlos del archivo `3c5x_cyx_cys_clean.pdb` y guardar el nuevo archivo como `3c5x_no_HETATM.pdb` en la carpeta `_files`.


```bash
# Primero buscamos las líneas que poseen el código HETATM 
grep -E -n "^HETATM" 3c5x_cyx_cys_clean.pdb
```


```bash
# Ahora eliminamos estas líneas
sed '3693,3776d' 3c5x_cyx_cys_clean.pdb >  3c5x_no_HETATM.pdb
```

**1.5.** Otros datos que se muestran en los archivos PDB  son los puentes disulfuro entre átomos S de los aminoácidos de cisteína, que se identifican con el código *CONECT* al inicio de las líneas. Supongamos que también queremos eliminar esta información del archivo `3c5x_no_HETATM.pdb` y guardar el nuevo archivo como `3c5x_no_HETATM_CONN.pdb` en la carpeta `_files`.


```bash
# Primero buscamos las líneas que poseen el código CONECT 
grep -E -n "^CONECT" 3c5x_no_HETATM.pdb
```


```bash
# Ahora eliminamos estas líneas
sed '3693,3710d' 3c5x_no_HETATM.pdb > 3c5x_no_HETATM_CONN.pdb
```

**1.6.** Los archivos PDB suelen tener más de una cadena en su estructura proteica. Para establecer el fin de una cadena y el inicio de otra, en estos archivos se usa el código *TER*. Busca el número de línea en el que finaliza la cadena A y empieza la cadena C del  del archivo `3c5x_no_HETATM_CONN.pdb`.


```bash
# Opción 1
grep -n "TER"  3c5x_no_HETATM_CONN.pdb
```

**1.7.** Ahora que conocemos el número de línea en la que termina la cadena A y empieza la cadena C del archivo `3c5x_no_HETATM_CONN.pdb`, queremos separar las dos cadenas y colocar su información en dos archivos diferentes llamados  `3c5x_cadA.pdb` y `3c5x_cadB.pdb` en la carpeta `_files`.


```bash
# Opción 1 sed
# Cadena A
sed -n '1,3051p'  3c5x_no_HETATM_CONN.pdb >  3c5x_cadA.pdb
# Cadena B 
sed -n '3052,3692p'  3c5x_no_HETATM_CONN.pdb>  3c5x_cadC.pdb
```


```bash
# Opción 2 sed
# Cadena A
sed '3052,3692d'  3c5x_cyx_clean.pdb >  3c5x_cadA.pdb
# Cadena B 
sed '1,3051d'  3c5x_cyx_clean.pdb >  3c5x_cadC.pdb
```


```bash
# Opción 3 split
split -l 3051  3c5x.pdb
```

**1.8.** Intenta juntar los comandos de los ejercicios 1.1 a 1.5 usando piping y aplica esta secuencia de comandos al archivo  `3c5x.pdb`. Guarda el archivo final en un fichero llamado `3c5x_procesado.pdb` en la carpeta `_files`. Usa el comando `diff` para verificar que los archivos `3c5x_procesado.pdb` y `3c5x_no_HETATM_CONN.pdb` son iguales. 


```bash
sed 's/CYS/CYX/g'  3c5x.pdb | sed '1,579 s/CYX/CYS/g' | sed '4,579d' | sed '3693,3776d' | sed '3693,3710d' > 3 c5x_procesado.pdb
```


```bash
diff  3c5x_no_HETATM_CONN.pdb  3c5x_procesado.pdb
```

**2. En este ejercicio se obtendrá información de un archivo fasta, que contiene la secuencia de nucleótidos de un gen de un microorganismo.  Para esto usaremos el archivo `secuencia1.fasta` que se encuentra en la carpeta `_files` dentro del directorio raíz del repositorio de GitHub**

**2.1.** En las secuencias de ADN se encuentran varios motivos (secuencias pequeñas muy conservadas) como los que dan inicio y término a los procesos de replicación, transcripción y traducción. La señal para el inicio de la transcripción es dada por la presencia de la TATA box (*TATAAA* o *TATAAT*) y la señal para el término de la transcripción es la presencia de varias Adeninas (5 o más), con lo que se obtiene un transcrito (ARN mensajero). Determinar el número de señales de inicio y de terminación del archivo `secuencia1.fasta` y establecer si hay igual número de señales de inicio y terminación.


```bash
# Opción 1
# Señales de inicio 
grep -E -c "TATAAA|TATAAT"  secuencia1.fasta
# Señales de terminación 
grep -E -c "A{5,}"  secuencia1.fasta
```


```bash
# Opción 2
# Señales de inicio 
grep -E "TATAAA|TATAAT"  secuencia1.fasta | wc -l
# Señales de terminación 
grep -E  "A{5,}"  secuencia1.fasta | wc -l
```

**2.2.** Otros motivos importantes son los de unión para factores de transcripción (FT). Se conoce que un FT se puede unir específicamente a los motivos *ATXXTC*, *ACAXTT*, o *TTTCXXA* en donde la X puede corresponder a cualquier nucleótido. Determine si la secuencia del archivo `secuencia1.fasta` posee motivos de unión a FTs, y en caso de tenerlos cuántos de estos motivos posee.

**Nota:** Considera que en una misma línea puede haber más de una coincidencia. 


```bash
# Opción 1
grep -E -o "AT..TC|ACA.TT|TTC..A"  secuencia1.fasta | wc
```

**2.3.** Determinar la o las sub-secuencias del archivo `secuencia1.fasta` que empiezan con el motivo *TACA* y terminan con *AAAAAT*. 

**Nota:** Las sub-secuencias pueden estar en cualquier parte del texto, no necesariamente al inicio de la línea. 


```bash
grep -E "TACA.+AAAAAT"  secuencia1.fasta
```

**2.4.** Determinar si la secuencia del archivo `secuencia1.fasta` termina con el motivo *TATACAATGA*


```bash
grep -E "TATACAATGA$"  secuencia1.fasta
```

**3. En este ejercicio se obtendrá información de un archivo multifasta, compuestos por varias secuencias de nucleótidos, en el que cada secuencia es un genoma completo de diferentes cepas o muestras de *Sulcia muelleri* (un endosimbionte de insectos). Para esto usaremos el archivo `sul_genomas.fasta` que se encuentra en la carpeta `_files` dentro del directorio raíz del repositorio de GitHub**

**3.1.** Se debe considerar que en un archivo multifasta cada secuencia posee un header que empieza con el caracter `>`. Determinar cuántos genomas en total se encuentran en el archivo `sul_genomas.fasta`


```bash
# Opción 1
grep -E -c ">"  sul_genomas.fasta
```


```bash
# Opción 2
grep ">"  sul_genomas.fasta | wc -l
```

**3.2.** Se desea identificar los códigos de todas las secuencias del archivo `sul_genomas.fasta`, que se encuentran en los headers junto al caracter `>` (por ejemplo `CP006060.1`), y exportar estos códigos a un nuevo archivo llamado `codigos_sul_genomas.txt` en la carpeta `_files`. Se deben eliminar los caracteres `>` en el archivo de salida. 


```bash
# Opción 1
grep -E -o "^>[A-Z]{1,2}_?[A-Z0-9]{1,8}\.[0-9]"  sul_genomas.fasta | sed -r 's/>/ /g' >  codigos_sul_genomas.txt
```


```bash
# Opción 2
grep -E ">"  sul_genomas.fasta | cut -f1 -d ' ' | sed -r 's/>/ /g' >  sul_genomas_codigos.txt
```

**3.3.** Se desea identificar el nombre completo de las cepas o muestras de todas las secuencias del archivo `sul_genomas.fasta` y exportar estos códigos a un nuevo archivo llamado `nombres_sul_genomas.txt` en la carpeta `_files`. Por ejemplo, el nombre completo de una de las secuncias sería: `Candidatus Sulcia muelleri isolate SMAURBIH`.


```bash
grep -E -o "(Candidatus Sulcia muelleri|Blattabacterium cuenoti)( str.| strain| | isolate) ?[A-Za-z-]{2,10}"  sul_genomas.fasta >  nombres_sul_genomas.txt
```

**3.4** Se desea buscar la secuencia *TTTATTCCTAAAATAAAAGAAGATGAA* en el genoma de *Candidatus Sulcia muelleri CARI* del archivo `sul_genomas.fasta`.


```bash
grep -n ">"  sul_genomas.fasta
```


```bash
sed -n '5446,8903p'  sul_genomas.fasta | grep -n "TTTATTCCTAAAATAAAAGAAGATGAA"
```

**4. En este ejercicio se obtendrá información de un archivo multifasta, compuestos por varias secuencias de proteínas, en el que cada secuencia es una proteína de la bacteria *Streptomyces calvuligerus*. Para esto usaremos el archivo `S_clavuligerus_proteome.fasta` que se encuentra en la carpeta `_files` dentro del directorio raíz del repositorio de GitHub**

**4.1.** Determinar cuántas proteínas posee el proteoma de *Streptomyces calvuligerus* en base al archivo `S_clavuligerus_proteome.fasta`


```bash
# Opción 1
grep -E -c ">"  S_clavuligerus_proteome.fasta
# Opción 2 
grep -E ">"  S_clavuligerus_proteome.fasta | wc -l
```


```bash
cd ../../_files
```

**4.2.** Listar los headers de las secuencias de todas las proteínas y colocar esta información en una archivo llamado `headers_S_clavuligerus_proteome.txt` en la carpeta `_files`. 


```bash
grep -E ">"  S_clavuligerus_proteome.fasta >  headers_S_clavuligerus_proteome.txt
```


```bash
cat headers_S_clavuligerus_proteome.txt
```

**4.3.** Obtener solamente el código Uniprot (que está entre | |, por ejemplo B5H048) de los headers de todas las secuencias de proteínas y añadir esta información en un archivo llamado `codigosUniptot_S_clavuligerus_proteome.txt` en la carpeta `_files`. Para realizar esto se puede tomar como input el archivo generado en el anterior literal.


```bash
# Opción 1
grep -E -o "\|[A-Za-z0-9]{1,6}\|"  headers_S_clavuligerus_proteome.txt | sed -r 's/\|/ /g' >  codigosUniptot_S_clavuligerus_proteome.txt
```


```bash
# Opción 2
cut -d '|' -f2  headers_S_clavuligerus_proteome.txt >  codigosUniptot_S_clavuligerus_proteome.txt
```


**4.4.** Obtener solamente el nombre de los organismos (caracteres que están luego de OS=) de los headers de todas las secuencias de proteínas y añadir esta información en un archivo llamado `organismos_S_clavuligerus_proteome.txt` en la carpeta `_files`. Para realizar esto se puede tomar como input el archivo del literal **1.3**.

**Nota:** En este caso todos los nombres serán los mismos, pero en archivos fasta con información de varios organismos sería muy útil.


```bash
# Opción 1
grep -E -o "OS=[A-Z a-z]+"  headers_S_clavuligerus_proteome.txt | sed -r 's/OS=/ /g' >  organismos_S_clavuligerus_proteome.txt 
```


```bash
# Opción 2
cut -d'=' -f2  headers_S_clavuligerus_proteome.txt | grep -E -o "[A-Z a-z]+ \(" | sed -r 's/\(/ /g' >  Organismos_S_clavuligerus_proteome.txt
```

**4.5.** Obtener solamente el nombre de las proteínas (caracteres antes de OS=) de los headers de todas las secuencias de proteínas y añadir esta información en un archivo llamado `proteinas_S_clavuligerus_proteome.txt` en la carpeta `_files`. Para realizar esto se puede tomar como input el archivo generado en el literal **1.3**.


```bash
# Opción 1
grep -P -o "\|[A-Z0-9]{1,6}_[A-Z0-9]{1,5}[A-Za-z0-9 \[\]()+,.'/:_\-]+ OS"  headers_S_clavuligerus_proteome.txt | sed -r 's/\|[A-Z0-9]{1,6}_[A-Z0-9]{1,5}/ /g' | sed -r 's/OS/ /g' >  proteinas_S_clavuligerus_proteome.txt
```

**4.6.** Separar los headers y las secuencias de aminoácidos de las proteínas que tienen los siguientes códigos: `B5GNS8`, `B5H296`, `B5GRF2` y `B5GTR3` (para esto debes usar el archivo fasta inicial: `S_clavuligerus_proteome.fasta`). Colocar esta información en un archivo llamado `4seq_S_clavuligerus_proteome.fasta` en la carpeta `_files`.


```bash
grep -E -A10 -n -e 'B5GNS8' -e 'B5H296' -e 'B5GRF2' -e 'B5GTR3'  S_clavuligerus_proteome.fasta
```


```bash
sed -n '12114,12118p'  S_clavuligerus_proteome.fasta >  4seq_S_clavuligerus_proteome.fasta
sed -n '27251,27256p'  S_clavuligerus_proteome.fasta >>  4seq_S_clavuligerus_proteome.fasta
sed -n '27310,27317p'  S_clavuligerus_proteome.fasta >>  4seq_S_clavuligerus_proteome.fasta
sed -n '40706,40712p'  S_clavuligerus_proteome.fasta >>  4seq_S_clavuligerus_proteome.fasta
```

**4.7.** Determinar si en la secuencia de la proteína con código Uniprot `B5H296` existe un aminoácido de serina (S), seguido de una prolina (P), con tres alaninas (A) en medio de los dos aminoácidos (S y P). El patrón a buscar sería `SAAAP`. Puedes usar la información de la ubicación de la secuencia obtenida en el anterior literal. 


```bash
sed -n '27251,27256p'  S_clavuligerus_proteome.fasta | grep -E -n "SA{3}P"
```

**5. En este ejercicio se obtendrá información de archivos fastq, que cotienen secuencias de nucleótidos y la calidad de su proceso de secuenciación. Para esto usaremos los archivos `secuencias1.fastq`, `secuencias2.fastq` y `secuencias3.fastq` que se encuentra en la carpeta `_files` dentro del directorio raíz del repositorio de GitHub**

**5.1.** La letra `N` representa un nucleótido que no pudo ser leído correctamente, y se reporta como ninguno, o `missing data`. Imprime el número de secuencias que tenga diez `N` seguidas por cada uno de los archivos `fastq` de la carpeta `_files`.

**Nota:** Es posible realizar esto con un comando de una sola líne, intenta resolverlo de esta forma.


```bash
grep -E -c "NNNNNNNNNN"  *.fastq
```

**5.2.** Ahora, determina el número de secuencias de cada archivo `.fastq` por separado. Se conoce que los títulos de las corridas de las secuencias en cada archivo `.fastq` empiezan con el string `@SRR098026`.


```bash
grep -E -c '^@SRR098026' *.fastq
```

**5.3.** Pero esta información está muy desordenada. No sabemos a qué corrida le petenece esta secuencia (identificador) ni la calidad de la secuencia con diez **N** seguidas. Entonces, podríamos incluir las 4 líneas de cada corrida. ¿Cómo incluirías las 4 lineas de información de cada corrida que contenga la secuencia `NNNNNNNNNN` del archivo `secuencias1.fastq`? 


```bash
grep -A2 -B1 "NNNNNNNNNN" secuencias1.fastq
```

**5.4.** Pero esta información nos podría servir mucho más si está en un archivo `fastq` y no solo en la pantalla del `jupyter notebook` o de la `terminal`. Qué tal si exportamos la información de todas las secuencias que contienen diez **N** seguidas, de todos los archivos `.fastq`, a un archivo llamado `malas_lecturas.fastq` en la carpeta `_files`.


```bash
grep -A2 -B1 "NNNNNNNNNN" *.fastq > malas_lecturas.fastq
```

**5.5.** ¿Cuántas líneas de las secuencias de cada uno de los tres archivos `fastq` contienen el motivo `ACG`?


```bash
grep -E -c "ACG" *.fastq 
```

**5.6.** Ahora, coloca las anteriores secuencias que contienen `ACG` en el archivo `malas_lecturas.fastq` **sin sobre escribir el archivo**. Luego imprime las últimas 40 líneas del archivo `malas_lecturas.fastq`.


```bash
grep "ACG"  *.fastq >> malas_lecturas.fastq
tail -n 40 malas_lecturas.fastq
```

**5.7.** Ahora vamos a buscar patrones en el archivo `malas_lecturas.fastq`. Antes creamos un archivo llamado`patrones.txt`, donde imprimirás estos motivos *ACTG, CCCCC, NNNCNNN, NNNGNNN, TTTT, TATA, AAA*. Luego, usa este archivo para buscar estos patrones en el arcvhio `malas_lecturas.fastq`.


```bash
echo -e 'ACTG\nCCCCC\nNNNCNNN\nNNNGNNN\nTTTT\nTATA\nAAA' >  patrones.txt
grep -f  patrones.txt  malas_lecturas.fastq
```

**5.8.** Tomando el archivo `acg.txt`, convierte los fragmentos `ACG` en secuencias de ARN. Recuerda que se puede hacer eso cambiando las timinas por uracilos (Reemplzar T por U).**5.8.** Tomando el archivo `acg.txt`, convierte los fragmentos `ACG` en secuencias de ARN. Recuerda que se puede hacer eso cambiando las timinas por uracilos (Reemplzar T por U).


```bash
#sed -i '' -e 's/T/U/' acg.txt # macOS
sed -i -e 's/T/U/' acg.txt # Linux
```

**6. En este ejercicio se obtendrá información de un archivo obtenido de un experimento de microarray, en el que se calcula la expresión génica de una muestra. Para esto usaremos el archivo `microarray.txt` que se encuentra en la carpeta `_files` dentro del directorio raíz del repositorio de GitHub**

**6.1.** Determinar el número genes relacionados con la leucemia (en el documento se encuentra como `leukemia`). En este caso esto se determinará por la presencia del nombre de la enfermedad en los nombres de los genes.


```bash
# Opción 1
grep -E -c 'leukemia' microarray.txt
```


```bash
# Opción 2
grep -E 'leukemia' microarray.txt | wc
```

**6.2.** De todo el registro, solo queremos el nombre y la descripción de los genes relacionados con leucemia (campos/columnas 3 y 4 del archivo), lo que se desea copiar a un archivo llamado `genes_leucemia.txt` en la carpeta `_files`.  


```bash
# Usando comandos como grep, set, cut, etc
grep 'leukemia' microarray.txt | cut -f3,4 > genes_leucemia.txt
```

**6.3.** Se desea eliminar las comillas de los nombres y descripción de los genes relacionados con leucemia, obtenidos en el archivo del literal anterior, y guardar los cambios en el mismo archivo `genes_leucemia.txt`.


```bash
# Usando comandos como grep, set, cut, etc
sed -i 's/\"//g' genes_leucemia.txt
```

**6.4.** Ahora, se desea ordenar alfabéticamente los genes del archivo `genes_leucemia.txt` y eliminar los genes repetidos. Con estos cambios, guardar el resultado en un archivo llamado `genes_leucemia_ord_uniq.txt`


```bash
sort -u genes_leucemia.txt > genes_leucemia_ord_uniq.txt
```

**6.5.** Finalmente, se desea dterminar el número de genes que estaban repetidos


```bash
# Los repetidos serían la diferencia de ambos números 
wc -l genes_leucemia.txt
sort -u genes_leucemia.txt | wc -l
```

**7. En este ejercicio se buscarán sitios d reconocimiento de enzimas de restricción en secuencias ITS de hongos. Para esto usaremos los archivos `.fasta` de la carpeta `ITS_region` que se encuentra en la carpeta `_files` dentro del directorio raíz del repositorio de GitHub**

Para este ejercicio se debe conocer lo que es un mapa de restricción, que es un gráfico en el que se representan los sitios en los que diferentes enzimas de restricción poseen dianas en una molécula particular de ADN

```{image} ./img/map_plasmid.png
:alt: ./img/map_plasmid.png
:width: 600px
:align: center
```

```{image} ./img/lineal_map.png
:alt: ./img/lineal_map.png
:width: 600px
:align: center
```

En este ejemplo se seleccionaron las siguientes enzimas de restricción:

```{image} ./img/enz_restriccion.png
:alt: ./img/enz_restriccion.png
:width: 500px
:align: center
```

En los siguientes ejercicios se buscarán los sitios de reconocimiento de estas enzimas en la región ITS de diferentes especies de hongos.

**7.1.** Determinar qué archivo(s) poseen la secuencia de reconocimiento de la enzima `EcoRI` y cuántas de estas secuencias existen en cada uno de los archivos.


```bash
grep -c "GAATTC" ITS_region/*.fasta
```

**7.2.** Determinar qué archivo posee doble o triple secuencia de reconocimiento de las enzimas `SmaI` y `TaiI`.


```bash
grep -c "CCCGGG" ITS_region/*.fasta
```


```bash
grep -c "ACGT" ITS_region/*.fasta
```

**7.3.** Especificar el número de la línea donde hubo la o las coincidencias del sitio de reconocimiento de la enzima `TaiI` del archivo `T_delbrueckii.fasta`


```bash
grep -n "ACGT" ITS_region/T_delbrueckii.fasta
```

**7.4.** La enzima `HincII` presenta una secuencia de reconocimiento "degenerada", en la que la letra Y puede ser los nucleótidos C o T y la letra R puede ser G o A. Buscar la cantidad de estas secuencias en todos los archivos `.fasta` de las secuencias ITS.


```bash
# Opción 1
grep -E -c "GTCAAC|GTCGAC|GTTAAC|GTTGAC" ITS_region/*.fasta
```


```bash
# Opción 2
grep -E -c "GT[CT][AG]AC" ITS_region/*.fasta
```


```bash
# Esto se puede verificar mediante la etiqueta -o de egrep
grep -E -o "GTCAAC|GTCGAC|GTTAAC|GTTGAC" ITS_region/*.fasta
```

**7.5.** Buscar las 10 lineas posteriores y 10 anteriores donde hubo la coincidencia de la enzima `EcoRI` de todas las secuencias `.fasta` y almcacenar los resultados en un archivo llamado `sitios_rec_EcoRI.fasta`. Intenta evitar imprimir el nombre del archivo del que provienen las secuencias. 


```bash
grep -B10 -A10 -h "GAATTC" ITS_region/*.fasta > sitios_rec_EcoRI.fasta
```

**7.6.** Verifica si la secuencia del archivo `secuencia.txt` está presente en el archivo `secuencias.txt`.


```bash
grep -f ITS_region/secuencia.txt ITS_region/secuencias.fasta
```

**7.7.** Utiliza la información del archivo `sites.txt` para buscar si estos sitios de restricción estań presentes en los archivos fasta de la carpeta `ITS_region` y cuántos existen.


```bash
grep -c -f ITS_region/sites.txt ITS_region/*.fasta
```

**7.8.** Utilizar la información del archivo `sites.txt` para buscar todos los sitios de restricción únicos presentes en los archivos fasta de la carpeta `ITS_region`


```bash
grep -h -o -f  ITS_region/sites.txt ITS_region/*.fasta | sort -u
```
