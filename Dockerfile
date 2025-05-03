# 1) Build stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copia só o arquivo de projeto e restaura as dependências
COPY ["AutoMetrics-API.csproj", "./"]
RUN dotnet restore "./AutoMetrics-API.csproj"

# Copia todo o código e publica em Release (sem apphost para imagem menor)
COPY . .
RUN dotnet publish "./AutoMetrics-API.csproj" \
    -c Release \
    -o /app/publish \
    /p:UseAppHost=false

# 2) Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app

# Copia o resultado do publish
COPY --from=build /app/publish .

# Configurações de ambiente e porta
ENV ASPNETCORE_URLS=http://+:80
ENV ASPNETCORE_ENVIRONMENT=Production

EXPOSE 80

# Inicia a aplicação
ENTRYPOINT ["dotnet", "AutoMetrics-API.dll"]