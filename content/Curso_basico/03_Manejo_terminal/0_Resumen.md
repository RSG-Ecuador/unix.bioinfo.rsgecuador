# Resumen

En esta unidad vamos a entender cómo usar la terminal. Para eso vamos a ver conceptos importantes teóricos. Luego, vamos a usar comandos útiles para visualizar directorios y archivos. El objetivo principal de este capítulo es ganar confianza y familiarizarse con los comandos de la terminal. Aunque la complejidad de los conceptos no es alta, es muy importante dominar los comandos para trabajar de manera eficiente. 

0. [Resumen](0_Resumen.md)
1. [Bash como shell de GNU/Linux](1_def.md)
2. [Terminal: Interacción con la Shell en Linux, MacOS y Windows](2_terminal.md)
3. [Comandos en la `shell`](3_comandos.md)
4. [Directorios y archivos en UNIX: Parte 1](4_directorios.md)
5. [Wildcards y Streams](5_wildcards.md)
6. [Directorios y archivos en UNIX: Parte 2](6_directorios_2.md)
8. [Variables de ambiente](8_variables_amb.md)


```{admonition} Deber
:class: note
Entregable: un jupyter notebook que contenga todos los ejercicios del capítulo.

Ejercicios:
- [Algunos casos de `ls`](3_comandos.md)
- [Crear y elminiar directorios. Crear, mover y elminiar archivos.](4_directorios.md)
- [Directorios absolutos y relativos](4_directorios.md)
- [Renombrar archivos y copiar archivos](4_directorios.md)
- [Uso básico de wildcards](5_wildcards.md)
- [Output streams, input streams](5_wildcards.md)
- [Uso de comandos](6_directorios_2.md)
- [Conocer el sistema](6_directorios_2.md)
- [Variable `PATH`](8_variables_amb.md)
- [Otras variables  de ambiente](8_variables_amb.md)
```

## Notas adicionales
```{admonition} Importante
:class: important
Ingresa al directorio donde guardas el material del curso si no lo has hecho ya y activa tu ambiente de conda. En este caso es `~/taller_unix`. Si seguiste las instrucciones de la unidad anterior, deberías tener un archivo llamado `deber_1.ipynb` dentro de 
`~/taller_unix/3_manejo_terminal`. Sigue las instrucciones de abajo si necesitas ayuda.
```
```shell
$ cd ~/taller_unix/
$ conda activate bash
$ jupyter lab
```

Ahora que has accedido a Jupyter Lab crea un notebook para que puedas hacer los ejercicios dentro. **Debes entregar un notebook recopilando todos los ejercicios hechos en este capítulo. Los ejercicios son secciones completas llamadas *`Ejercicio`***. El notebook debería tener esta ubicación en tu computador: `~/taller_unix/3_manejo_terminal/deber_2.ipynb`.

```{admonition} Sugerencia
:class: attention
Aunque el deber se debe entregar en un jupyter notebook, todo esto se puede hacer en Terminal. Te sugiero que hagas los ejercicios primero en Terminal y luego, cuando tengas la seguridad de que los entiendes, los vuelves a hacer desde un jupyter notebook.
```

```{image} ./img/good_luck.jpeg
:alt: ./img/good_luck.jpeg
:width: 350px
:align: center
```