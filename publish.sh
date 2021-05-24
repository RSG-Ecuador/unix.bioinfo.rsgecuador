cp -r Ejercicios_fines_de_semana _build/html/
cp -r _files _build/html/
cp README_LIBRO.md _build/html/
cp Linux_BashAwk_scripting_BootCampt_RSG_iGEM_Ecuador_portada.png _build/html/
mv ./_build/html/README_LIBRO.md ./_build/html/README.md
cd ./_build/html/
git init -b gh-pages
git remote add origin https://github.com/RSG-Ecuador/unix.bioinfo.rsgecuador
git status
git add -A
git commit -m “actualización”
git push origin gh-pages
