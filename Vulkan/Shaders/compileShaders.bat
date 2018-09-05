@echo off
rem Vulkan Path

if %1 == Debug goto :debug else goto :release

:release
echo Release

mkdir Release\Shaders
set copyfolder=%cd%\Release\Shaders

goto :main

:debug
echo Debug

mkdir Debug\Shaders
set copyfolder=%cd%\Debug\Shaders

goto :main

:main
echo Main
set vulkanPath=C:/VulkanSDK/1.0.61.1/Bin32

cd Shaders
for %%i in (*.frag *.vert) do call :compileshaders %%i
goto :copyshaders

:compileshaders
echo Compiling %1
start %vulkanPath%/glslangValidator.exe -V %1
goto :EOF

:copyshaders
echo %cd%
echo %copyfolder%
call robocopy %cd% %copyfolder%\ *.spv
exit 0