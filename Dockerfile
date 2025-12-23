# Stage 1: Build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copia la solución y restaura dependencias
COPY MOD01.sln .
COPY MOD01.Application/ MOD01.Application/
COPY MOD01.Domain/ MOD01.Domain/
COPY MOD01.Infrastructure/ MOD01.Infrastructure/
COPY WebApplication1/ WebApplication1/

RUN dotnet restore MOD01.sln
RUN dotnet publish WebApplication1/WebApplication1.csproj -c Release -o /app/publish

# Stage 2: Runtime
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app

# Copia archivos publicados desde el build
COPY --from=build /app/publish .

# Exponer puerto correcto para Railway
ENV ASPNETCORE_URLS=http://+:8080
EXPOSE 8080

# Comando para ejecutar la app
ENTRYPOINT ["dotnet", "WebApplication1.dll"]
