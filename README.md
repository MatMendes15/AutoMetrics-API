# Projeto Integrador – Cloud Developing 2025/1

> CRUD simples + API Gateway + Lambda /report + RDS + CI/CD

**Grupo**:
1. RA: 10417820 - Mateus Mendes Cabral - API Backend, Banco e CI/CD
1. RA: 10414699 - Thiago Felipe Garcia - Gateway e função

---

## 1. Visão geral

O domínio deste projeto é **Dados Técnicos Automotivos**, escolhido pela relevância crescente de monitoramento de eficiência energética e emissões de carbono na indústria automobilística e na política ambiental. 

A API REST construída em .NET 8 oferece um **CRUD** completo sobre a entidade **Veículo**, permitindo:

- **Listar** todos os veículos cadastrados (`GET /api/veiculos`)  
- **Adicionar** um novo veículo com seus atributos técnicos e de emissão (`POST /api/veiculos`)  
- **Atualizar** informações específicas de um veículo existente (`PUT /api/veiculos/{id}`)  
- **Remover** um registro de veículo que não seja mais necessário (`DELETE /api/veiculos/{id}`)  

O sistema garante a manutenção consistente de um catálogo de veículos.

---

## 2. Arquitetura

![Diagrama](docs/arquitetura.png)

| Camada | Serviço | Descrição |
|--------|---------|-----------|
| Backend | ECS Fargate (ou EC2 + Docker) | API containerizada em .NET 8 |
| Banco   | Amazon RDS              | PostgreSQL / MySQL em subnet privada |
| Gateway | Amazon API Gateway      | Rotas CRUD → ECS · `/report` → Lambda |
| Função  | AWS Lambda              | Consome a API, gera estatísticas JSON |
| CI/CD   | CodePipeline + GitHub   | push → build → ECR → deploy |

---

## 3. Como rodar localmente

```bash
# 1. Clone o repositório e entre na pasta do projeto
git clone https://github.com/MatMendes15/AutoMetrics-API.git
cd AutoMetrics-API

# 2. Suba API e PostgreSQL com Docker Compose em background
docker-compose up --build --detach

# 3. Aguarde até ver os containers “Up” e teste no Postman ou navegador:
#    GET http://localhost:8080/api/veiculos

# 4. Para parar e remover containers e rede:
docker-compose down
