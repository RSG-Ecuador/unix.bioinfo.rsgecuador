# Extracción de información de archivo multifasta de secuencias de aminoácidos (proteoma)   
   
   
En este ejercicio se obtendrá información de un archivo multifasta, compuestos por varias secuencias de proteínas, en el que cada secuencia es una proteína de la bacteria *Streptomyces calvuligerus*. Para esto usaremos el archivo `S_clavuligerus_proteome.fasta` que se encuentra en la carpeta `_files` dentro del directorio raíz del repositorio de GitHub   
   
   
**5.1** Determinar cuántas proteínas posee el proteoma de *Streptomyces calvuligerus* en base al archivo `S_clavuligerus_proteome.fasta`

```bash

```

**5.2** Listar los headers de las secuencias de todas las proteínas y colocar esta información en una archivo llamado `headers_S_clavuligerus_proteome.txt` en la carpeta `_files`. 

```bash

```

**5.3** Obtener solamente el código Uniprot (que está entre | |, por ejemplo B5H048) de los headers de todas las secuencias de proteínas y añadir esta información en un archivo llamado `codigosUniptot_S_clavuligerus_proteome.txt` en la carpeta `_files`. Para realizar esto se puede tomar como input el archivo generado en el anterior literal.

```bash

```

**5.4** Obtener solamente el nombre de los organismos (caracteres que están luego de OS=) de los headers de todas las secuencias de proteínas y añadir esta información en un archivo llamado `organismos_S_clavuligerus_proteome.txt` en la carpeta `_files`. Para realizar esto se puede tomar como input el archivo del literal **1.3**.

**Nota:** En este caso todos los nombres serán los mismos, pero en archivos fasta con información de varios organismos sería muy útil.

```bash

```

**5.5** Obtener solamente el nombre de las proteínas (caracteres antes de OS=) de los headers de todas las secuencias de proteínas y añadir esta información en un archivo llamado `proteinas_S_clavuligerus_proteome.txt` en la carpeta `_files`. Para realizar esto se puede tomar como input el archivo generado en el literal **1.3**.

```bash

```

**5.6** Separar los headers y las secuencias de aminoácidos de las proteínas que tienen los siguientes códigos: `B5GNS8`, `B5H296`, `B5GRF2` y `B5GTR3` (para esto debes usar el archivo fasta inicial: `S_clavuligerus_proteome.fasta`). Colocar esta información en un archivo llamado `4seq_S_clavuligerus_proteome.fasta` en la carpeta `_files`.

```bash

```

**5.7** Determinar si en la secuencia de la proteína con código Uniprot `B5H296` existe un aminoácido de serina (S), seguido de una prolina (P), con tres alaninas (A) en medio de los dos aminoácidos (S y P). El patrón a buscar sería `SAAAP`. Puedes usar la información de la ubicación de la secuencia obtenida en el anterior literal. 

```bash

```