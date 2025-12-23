# Usa la imagen oficial de .NET 8 runtime
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 80

# Copia los archivos publicados
COPY publish/ .

# Comando para ejecutar la aplicación
ENTRYPOINT ["dotnet", "MOD01.dll"]
