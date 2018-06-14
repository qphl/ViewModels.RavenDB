#!/bin/bash
set -e
version="0.0.0"
if [ -n "$1" ]; then version="$1"
fi

dotnet test src/ViewModels.RavenDB.Tests/ViewModels.RavenDB.Tests.csproj -- RunConfiguration.TargetPlatform=x64 for RavenDB Tests

dotnet pack src/ViewModels.RavenDB/ViewModels.RavenDB.csproj -o ../../dist -p:Version="$version" -p:PackageVersion="$version" -c Release