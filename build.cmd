@echo off

SET VERSION=0.0.0
IF NOT [%1]==[] (set VERSION=%1)

SET TAG=0.0.0
IF NOT [%2]==[] (set TAG=%2)
SET TAG=%TAG:tags/=%

curl -o nuget.exe https://dist.nuget.org/win-x86-commandline/latest/nuget.exe
.\nuget.exe restore .\src\ViewModels.RavenDB.Tests\ViewModels.RavenDB.Tests.csproj -PackagesDirectory .\src\packages -Verbosity detailed

dotnet test src/ViewModels.RavenDB.Tests/ViewModels.RavenDB.Tests.csproj -- RunConfiguration.TargetPlatform=x64 for RavenDB Tests
if %errorlevel% neq 0 exit /b %errorlevel%

dotnet pack src/ViewModels.RavenDB/ViewModels.RavenDB.csproj -o ../../dist -p:Version=%version% -p:PackageVersion=%version% -p:Tag="%TAG%" -c Release