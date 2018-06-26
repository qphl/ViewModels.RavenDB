#!/bin/bash
set -e
version="0.0.0"
if [ -n "$1" ]; then version="$1"
fi

tag="0.0.0"
if [ -n "$2" ]; then tag="$2"
fi
tag=${tag/tags\//}

curl -o nuget.exe https://dist.nuget.org/win-x86-commandline/latest/nuget.exe -k
.\\nuget.exe restore .\\src\\ViewModels.RavenDB.Tests\\ViewModels.RavenDB.Tests.csproj -PackagesDirectory .\\src\\packages -Verbosity detailed

dotnet test .\\src\\ViewModels.RavenDB.Tests\\ViewModels.RavenDB.Tests.csproj -- RunConfiguration.TargetPlatform=x64 for RavenDB Tests

dotnet pack .\\src\\ViewModels.RavenDB\\ViewModels.RavenDB.csproj -o ..\\..\\dist -p:Version="$version" -p:PackageVersion="$version" -p:Tag="$tag" -c Release