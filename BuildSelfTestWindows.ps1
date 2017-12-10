$cmakeCmd = "cmake.exe"

if (!(Get-Command $cmakeCmd -ErrorAction SilentlyContinue)) 
{ 
   $cmakeCmd = "C:\Program Files\CMake\bin\cmake.exe"
}

if (!(Get-Command $cmakeCmd -ErrorAction SilentlyContinue)) 
{
    Write-Host -ForegroundColor Red "Cannot find CMAKE.exe"
    Exit
}

if (!(Get-Command "msbuild" -ErrorAction SilentlyContinue)) 
{
    Write-Host -ForegroundColor Red "Cannot find MSBuild.exe"
    Write-Host "Make sure that you are running from within a Visual Studio Developer Command prompt"
    Exit
}

if (!(Get-Command "git" -ErrorAction SilentlyContinue)) 
{
    Write-Host -ForegroundColor Red "Cannot find Git.exe"
    Write-Host "Make sure that Git for Windows is installed and on the path"
    Exit
}

git submodule init
git submodule update

cd StABIlize
& $cmakeCmd .
msbuild StABIlize.sln
& "bin\Debug\StABIlize-Tests.exe"
cd ..