# 1 - Run Build the Aplication
FROM mcr.microsoft.com/dotnet/core/sdk:3.0-alpine AS build
WORKDIR /code
COPY . .
RUN dotnet restore
RUN dotnet publish --output /output --configuration Release

# 2 - Run the Aplication
FROM mcr.microsoft.com/dotnet/core/aspnet:3.0-alpine
COPY --from=build /output /app
WORKDIR /app
ENTRYPOINT ["dotnet", "AspNetCoreOnDocker.dll"]