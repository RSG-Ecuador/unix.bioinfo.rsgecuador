# Extracción de información de archivos fastq   
   
   
En este ejercicio se obtendrá información de archivos fastq, que cotienen secuencias de nucleótidos y la calidad de su proceso de secuenciación. Para esto usaremos los archivos `secuencias1.fastq`, `secuencias2.fastq` y `secuencias3.fastq` que se encuentra en la carpeta `_files` dentro del directorio raíz del repositorio de GitHub   
   
   
**6.1** La letra `N` representa un nucleótido que no pudo ser leído correctamente, y se reporta como ninguno, o `missing data`. Imprime el número de secuencias que tenga diez `N` seguidas por cada uno de los archivos `fastq` de la carpeta `_files`.

**Nota:** Es posible realizar esto con un comando de una sola líne, intenta resolverlo de esta forma.

```bash

```

**6.2** Ahora, determina el número de secuencias de cada archivo `.fastq` por separado. Se conoce que los títulos de las corridas de las secuencias en cada archivo `.fastq` empiezan con el string `@SRR098026`.

```bash

```

**6.3** Pero esta información está muy desordenada. No sabemos a qué corrida le petenece esta secuencia (identificador) ni la calidad de la secuencia con diez **N** seguidas. Entonces, podríamos incluir las 4 líneas de cada corrida. ¿Cómo incluirías las 4 lineas de información de cada corrida que contenga la secuencia `NNNNNNNNNN` del archivo `secuencias1.fastq`? 

```bash

```

**6.4** Pero esta información nos podría servir mucho más si está en un archivo `fastq` y no solo en la pantalla del `jupyter notebook` o de la `terminal`. Qué tal si exportamos la información de todas las secuencias que contienen diez **N** seguidas, de todos los archivos `.fastq`, a un archivo llamado `malas_lecturas.fastq` en la carpeta `_files`.

```bash

```

**6.5** ¿Cuántas líneas de las secuencias de cada uno de los tres archivos `fastq` contienen el motivo `ACG`?

```bash

```

**6.6** Ahora, coloca las anteriores secuencias que contienen `ACG` en el archivo `malas_lecturas.fastq` **sin sobre escribir el archivo**. Luego imprime las últimas 40 líneas del archivo `malas_lecturas.fastq`.

```bash

```

**6.7** Ahora vamos a buscar patrones en el archivo `malas_lecturas.fastq`. Antes creamos un archivo llamado`patrones.txt`, donde imprimirás estos motivos *ACTG, CCCCC, NNNCNNN, NNNGNNN, TTTT, TATA, AAA*. Luego, usa este archivo para buscar estos patrones en el arcvhio `malas_lecturas.fastq`.

```bash

```

**6.8** Tomando el archivo `acg.txt`, convierte los fragmentos `ACG` en secuencias de ARN. Recuerda que se puede hacer eso cambiando las timinas por uracilos (Reemplzar T por U).**5.8.** Tomando el archivo `acg.txt`, convierte los fragmentos `ACG` en secuencias de ARN. Recuerda que se puede hacer eso cambiando las timinas por uracilos (Reemplzar T por U).

```bash

```