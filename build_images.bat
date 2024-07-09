@echo off
setlocal enabledelayedexpansion

:: Array of Dockerfile names
set dockerfiles[0]=Dockerfile_1
set dockerfiles[1]=Dockerfile_2
set dockerfiles[2]=Dockerfile_3

:: Array of image names corresponding to the Dockerfiles
set images[0]=image1
set images[1]=image2
set images[2]=image3

:: Variable to hold successfully built images
set built_images=

:: Loop through the Dockerfiles and build the images
for /L %%i in (0,1,2) do (
    set dockerfile=!dockerfiles[%%i]!
    set image=!images[%%i]!

    echo Building image !image! from !dockerfile!...
    docker build -f !dockerfile! -t !image! .

    if !ERRORLEVEL! neq 0 (
        echo Failed to build !image!
        exit /b 1
    ) else (
        echo Successfully built !image!
        set built_images=!built_images!!image! 
    )
)

:: Loop through the images and run containers
for /L %%i in (0,1,2) do (
    set image=!images[%%i]!

    echo Starting container for !image!...
    start /B docker run --name container_!image! -d !image!

    if !ERRORLEVEL! neq 0 (
        echo Failed to start container for !image!
        exit /b 1
    ) else (
        echo Successfully started container for !image!
    )
)

echo All images built and containers started successfully.
echo Built images: !built_images!
endlocal
