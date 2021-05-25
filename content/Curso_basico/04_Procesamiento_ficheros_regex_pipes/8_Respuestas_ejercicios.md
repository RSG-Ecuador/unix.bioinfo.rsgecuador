# Respuestas ejercicios deber
**4.4**
1. 3
2. Usar flag i
3. No 

**4.5**
1. lan[sz]an
2. [d-pQ-W1-3]
3. tan, lansan, representan, lanzan 
4. caracter de espacio, s, z
5. [+*]
6. Verso [\d]:[Rc]o[mb][pe][ur][to][ao]
7. s (single-line)
8. \d\d[-\/.]\d\d[-\/.]\d\d

**4.6**
1. Flag m (multiple line)
2. No
3. No
4. \AFecha:\d\d[-\/.]\d\d[-\/.]\d\d
5. corazón \Z
6. tercera, primera, computadora, Porque, representan

**4.7**
1. Si
2. No

**4.8**
1. compasión 
2. La línea que posee solo Ni se identifica con el metacaracter *, pero no con +
3. ^Ni[\w ]*computadora$ (es solo un símbolo de ancla de final de línea) o ^Ni[\w ]+computadora$
4. \bNi[\w ]*computadora\b o \bNi[\w ]+computadora\b
5. [1-9][0-9]{1,2}

**4.9**
1. Si
2. Si
3. tan, ufano

**5.3**

1. Si, el metacaracter | fue reconocido de forma adecuada

**5.4**

1. No hay una sola respuesta, depende de tu SO
2. grep -i "computadora" Contrapunto_para_Humano_y_Computadora_Cuarteto_de_Nos.txt
3. echo "computadora" > palabras.txt 
   echo "Roberto" >> palabras.txt 	
   grep -i -f palabras.txt Contrapunto_para_Humano_y_Computadora_Cuarteto_de_Nos.txt
4. Los comandos coincidieron
5. Si hay diferencia, la opción `-w` busca solo palabras completas 
6. Si hay diferencia, la opción `-x` busca líneas enteras que coincidan con el patrón.
7. grep -E -i -v "computadora|Roberto" Contrapunto_para_Humano_y_Computadora_Cuarteto_de_Nos.txt
8. grep -E -c "^\[" Contrapunto_para_Humano_y_Computadora_Cuarteto_de_Nos.txt 
   grep -E -c "\[[A-Z a-Z0-9:]*\]" Contrapunto_para_Humano_y_Computadora_Cuarteto_de_Nos.txt   
9. grep -E -i -c "[0-9]:computadora" Contrapunto_para_Humano_y_Computadora_Cuarteto_de_Nos.txt
   grep -E -i -c "[0-9]:Roberto" Contrapunto_para_Humano_y_Computadora_Cuarteto_de_Nos.txt
   grep -E -i -c "[0-9]:Roberto y " Contrapunto_para_Humano_y_Computadora_Cuarteto_de_Nos.txt
10. ¿Sin alma ni corazón?
11. grep -E -n "(ión|ono|ando)$" Contrapunto_para_Humano_y_Computadora_Cuarteto_de_Nos.txt
12. 3 con `ión`, 2 con `ono`, y 2 con `ando`
13. Si, se coloca un tab antes de cada línea 
14. 3: 9, 5: , 10: , 12: 
15. grep -E -n -A 9 "Verso 3" Contrapunto_para_Humano_y_Computadora_Cuarteto_de_Nos.txt > verso3.txt
16. Contrapunto_para_Humano_y_Computadora_Cuarteto_de_Nos.txt, verso10.txt, verso12.txt
17. alumnos.txt, notas.txt, verso3.txt, verso5.txt
18. La opción `-H` imprime el nombre de los archivos y `-h` no imprime esto

**6.3**
1. No hay una sola respuesta, depende de tu SO

**6.5**
1. sed -r 's!([0-9]){2}[-\/.]\([0-9]\){2}[-\/.]\([0-9]\){2}!20/04/20!g' Contrapunto_para_Humano_y_Computadora_Cuarteto_de_Nos.txt
2. sed -r 's/^O[a-zA-Z ]*ver$/Quizá no quiere observar/m' Contrapunto_para_Humano_y_Computadora_Cuarteto_de_Nos.txt
3. sed -r 's/\bVerso/Estrofa/g' Contrapunto_para_Humano_y_Computadora_Cuarteto_de_Nos.txt
4. sed -r 's|/|-|2' Contrapunto_para_Humano_y_Computadora_Cuarteto_de_Nos.txt

**6.6**
1. sed -r '/:Roberto/d' Contrapunto_para_Humano_y_Computadora_Cuarteto_de_Nos.txt
2. sed -r -n '/^¿/p' Contrapunto_para_Humano_y_Computadora_Cuarteto_de_Nos.txt
3. sed -r '/^\[/a \ ' Contrapunto_para_Humano_y_Computadora_Cuarteto_de_Nos.txt

**6.7**
1. sed -r '20i \ ' Contrapunto_para_Humano_y_Computadora_Cuarteto_de_Nos.txt
2. sed -r '$c FIN' Contrapunto_para_Humano_y_Computadora_Cuarteto_de_Nos.txt

**7.3**
1. No hay una sola respuesta, depende de tu SO
2. cut -f 2-4 notasfinal.txt
3. cut -f 1 -d "," notasfinal.txt
4. cut -f 1 -d "," --complement notasfinal.txt
5. --output-delimiter ","
6. No se cumple la predicción, el resultado es el caracter *ñ*, que se representa con dos bytes

**7.5**
1. sort -k 3 -u alumnos.txt
2. sort -g -k 7 -r  notasfinal.txt

**8.3**
1. ls -l img | grep "png"
2. cut -f 1 -d "," alumnos.txt | sort -u
3. paste alumnos.txt notas.txt | cut -f 1-2,4 | sort -u | sort -g -k 6 -r
4. paste alumnos.txt notas.txt | sort -u | grep "Moore"
5. grep "^\[" Contrapunto_para_Humano_y_Computadora_Cuarteto_de_Nos.txt | sed -r '/computadora|Computadora/d' > versos.txt
