# Imagen runtime de .NET 8
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app

# Copiar los archivos publicados
COPY publish/ .

# Exponer puerto para Railway
ENV ASPNETCORE_URLS=http://+:8080
EXPOSE 8080

# Comando para ejecutar la app
ENTRYPOINT ["dotnet", "MOD01.API.dll"]
