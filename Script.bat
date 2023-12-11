@echo off
echo Choisissez la source de la musique :
echo 1. Spotify
echo 2. SoundCloud
set /p choice="Entrez votre choix (1 ou 2) : "

if "%choice%"=="1" (
    set "folder=Spotify"
) else if "%choice%"=="2" (
    set "folder=SoundCloud"
) else (
    echo Choix invalide.
    goto end
)

if not exist "%folder%" mkdir "%folder%"
set /p titre="Entrez le nom de la playlist : "
set /p url="Entrez l'URL de la playlist : "

if "%choice%"=="1" (
    if not exist "%folder%\%titre%" mkdir "%folder%\%titre%"
    spotdl --output "%folder%\%titre%" %url%
) else if "%choice%"=="2" (
    if not exist "%folder%\%titre%" mkdir "%folder%\%titre%"
    scdl -l %url% --path "%folder%\%titre%"
)

:end
pause