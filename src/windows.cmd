echo 'FreeImage Build Started'

cd src
rd /s /q "FreeImage"
tar -xf FreeImage3180.zip

rd /s /q "build"
mkdir build

cd FreeImage
msbuild /p:Platform=x64 /p:Configuration=Release /p:PlatformToolset=v142 FreeImage.2013.vcxproj

cd Dist\x64
dir
cd ..\..

copy /y Dist\x64\FreeImage.dll build\FreeImage.dll
copy /y Dist\x64\FreeImage.lib build\FreeImage.lib

cd ..

echo 'FreeImage Build Finished'
