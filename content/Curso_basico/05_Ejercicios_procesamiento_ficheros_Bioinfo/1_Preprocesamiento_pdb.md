# Preprocesamiento de archivo PDB antes de realizar dinámica molecular    
    
    
Vamos a realizar una simulación de dinámica molecular de la proteína prM del virus del Dengue (PDB ID: 3c5x) para replicar las condiciones biológicas en las que esta proteína se encuentra y obtener una estructura estable. Para esto usaremos el archivo `3c5x.pdb` que se encuentra en la carpeta `_files` dentro del directorio raíz del repositorio de GitHub   
   
   
   
**2.1** Los archivos del Protein Data Bank (PDB) tienen una nomenclatura por defecto para los aminoácidos. En esta nomenclatura, la cysteína se nombra como *CYS*. Sin embargo, en algunos programas de simulación como *Amber* la nomenclatura de los aminoácidos es diferente. Para que el programa pueda reconocer los aminoácidos de cisteína, estos se deben nombrar como *CYX* en lugar de *CYS*. Usando los conocimientos adquiridos en el curso, transformar el nombre de todos los aminoácidos de cisteína del archivo `3c5x.pdb` de *CYS* a *CYX* y guardar el nuevo archivo como `3c5x_cyx.pdb` en la carpeta `_files`.

```bash

```
    
**2.2** Las primeras 579 líneas del archivo *3c5x.pdb* son informativas y no son parte de la secuencia que necesita el programa para realizar la simulación. Por tanto, queremos reemplazar el nombre *CYX* por *CYS* de las primeras 579 líneas del archivo `3c5x_cyx.pdb` creado previamente, y guardar el nuevo archivo como `3c5x_cyx_cys.pdb` en la carpeta `_files`.

```bash

```

**2.3** Las primeras 579 líneas son solamente informativas y no influyen en la simulación de la proteína. Por tanto, queremos eliminar las líneas 4-579 del archivo `3c5x_cyx_cys.pdb` y guardar el nuevo archivo como `3c5x_cyx_cys_clean.pdb` en la carpeta 

```bash

```

**2.4** Además de la información de los aminoácidos de las proteínas, los archivos PDB suelen tener información sobre átomos especiales como metales o puentes de hidrógeno, que se identifican con el código *HETATM* al inicio de las líneas. Supongamos que en nuestra simulación no nos interesan estos átomos y queremos eliminarlos del archivo `3c5x_cyx_cys_clean.pdb` y guardar el nuevo archivo como `3c5x_no_HETATM.pdb` en la carpeta `_files`.

```bash

```

**2.5** Otros datos que se muestran en los archivos PDB  son los puentes disulfuro entre átomos S de los aminoácidos de cisteína, que se identifican con el código *CONECT* al inicio de las líneas. Supongamos que también queremos eliminar esta información del archivo `3c5x_no_HETATM.pdb` y guardar el nuevo archivo como `3c5x_no_HETATM_CONN.pdb` en la carpeta `_files`.

```bash

```

**2.6** Los archivos PDB suelen tener más de una cadena en su estructura proteica. Para establecer el fin de una cadena y el inicio de otra, en estos archivos se usa el código *TER*. Busca el número de línea en el que finaliza la cadena A y empieza la cadena C del  del archivo `3c5x_no_HETATM_CONN.pdb`.

```bash

```

**2.7** Ahora que conocemos el número de línea en la que termina la cadena A y empieza la cadena C del archivo `3c5x_no_HETATM_CONN.pdb`, queremos separar las dos cadenas y colocar su información en dos archivos diferentes llamados  `3c5x_cadA.pdb` y `3c5x_cadB.pdb` en la carpeta `_files`.

```bash

```

**2.8** Intenta juntar los comandos de los ejercicios 1.1 a 1.5 usando piping y aplica esta secuencia de comandos al archivo  `3c5x.pdb`. Guarda el archivo final en un fichero llamado `3c5x_procesado.pdb` en la carpeta `_files`. Usa el comando `diff` para verificar que los archivos `3c5x_procesado.pdb` y `3c5x_no_HETATM_CONN.pdb` son iguales. 

```bash

```