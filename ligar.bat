@echo off
REM Liga o servidor da Copa com o banco de dados ativo.
REM Clique duplo neste arquivo antes de usar o sistema.
cd /d "%~dp0server"
set ADMIN_HASH=a73060afb61efe1b7c817645d00c342df02407f65435a64c88d251d56150ff42
echo Copa no ar em http://localhost:3000/  (inicio em http://localhost:3000/inicio.html)
echo Nao feche esta janela enquanto usa o sistema.
node server.js
pause
