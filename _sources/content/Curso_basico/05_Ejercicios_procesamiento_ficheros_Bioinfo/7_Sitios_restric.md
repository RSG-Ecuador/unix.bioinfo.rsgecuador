# Búsqueda de sitios de restricción en archivos fasta de secuencias de nucleótidos   
   
   
En este ejercicio se buscarán sitios d reconocimiento de enzimas de restricción en secuencias ITS de hongos. Para esto usaremos los archivos `.fasta` de la carpeta `ITS_region` que se encuentra en la carpeta `_files` dentro del directorio raíz del repositorio de GitHub   
   
   
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

**8.1** Determinar qué archivo(s) poseen la secuencia de reconocimiento de la enzima `EcoRI` y cuántas de estas secuencias existen en cada uno de los archivos.

```bash

```

**8.2** Determinar qué archivo posee doble o triple secuencia de reconocimiento de las enzimas `SmaI` y `TaiI`.

```bash

```

**8.3** Especificar el número de la línea donde hubo la o las coincidencias del sitio de reconocimiento de la enzima `TaiI` del archivo `T_delbrueckii.fasta`

```bash

```

**8.4** La enzima `HincII` presenta una secuencia de reconocimiento "degenerada", en la que la letra Y puede ser los nucleótidos C o T y la letra R puede ser G o A. Buscar la cantidad de estas secuencias en todos los archivos `.fasta` de las secuencias ITS.

```bash

```

**8.5** Buscar las 10 lineas posteriores y 10 anteriores donde hubo la coincidencia de la enzima `EcoRI` de todas las secuencias `.fasta` y almcacenar los resultados en un archivo llamado `sitios_rec_EcoRI.fasta`. Intenta evitar imprimir el nombre del archivo del que provienen las secuencias. 

```bash

```

**8.6** Verifica si la secuencia del archivo `secuencia.txt` está presente en el archivo `secuencias.txt`.

```bash

```

**8.7** Utiliza la información del archivo `sites.txt` para buscar si estos sitios de restricción estań presentes en los archivos fasta de la carpeta `ITS_region` y cuántos existen.

```bash

```

**8.8** Utilizar la información del archivo `sites.txt` para buscar todos los sitios de restricción únicos presentes en los archivos fasta de la carpeta `ITS_region`

```bash

```