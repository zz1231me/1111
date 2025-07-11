@echo off
setlocal enabledelayedexpansion

set "startDir=%cd%"

for /r "%startDir%" %%D in (.) do (
    set "folder=%%~fD"

    rem node_modules 또는 .git가 경로에 포함되면 건너뜀
    echo !folder! | findstr /i "\\node_modules\\">nul
    if errorlevel 1 (
        echo !folder! | findstr /i "\\.git\\">nul
        if errorlevel 1 (
            echo Folder: !folder!
            for %%F in ("!folder!\*") do (
                if exist "%%F" (
                    echo     File: %%~nxF
                )
            )
        )
    )
)
