@echo off

SET VERSION=0.0.0
IF NOT [%1]==[] (set VERSION=%1)

dotnet test src/ViewModels.RavenDB.Tests/ViewModels.RavenDB.Tests.csproj -- RunConfiguration.TargetPlatform=x64 for RavenDB Tests
if %errorlevel% neq 0 exit /b %errorlevel%

dotnet pack src/ViewModels.RavenDB/ViewModels.RavenDB.csproj -o ../../dist -p:Version=%version% -p:PackageVersion=%version% -c Release