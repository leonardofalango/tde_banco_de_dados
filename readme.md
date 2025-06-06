# 📚 Sistema de Gerenciamento MaxPerformance

Este é um sistema web completo para visualização, inscrição e administração de aulas, desenvolvido com **FastAPI**, **MySQL**, e **HTML/JavaScript** para a matéria de Banco de Dados.

## 🚀 Funcionalidades

- Visualização de aulas disponíveis
- Inscrição de alunos em aulas via popup com email
- CRUD completo de usuários (alunos)
- Integração com banco de dados relacional MySQL
- Interface simples e funcional com HTML, CSS e JavaScript

---


## 🧠 Requisitos

- Python 3.10+
- MySQL 8.0+
- Navegador moderno

### Instalação de dependências:

```bash
pip install fastapi uvicorn mysql-connector-python
```

---

## 🏁 Como Rodar

- Crie um arquivo .env contendo
- Variáveis de ambiente necessárias são as que estão em .env.example
```.env
DB_HOST="localhost"
DB_USER="root"
DB_PASSWORD="password"
DB_DATABASE_NAME="maxperformance"
```
- Configure seu banco de dados corretamente.
- Rode o arquivo de criação do Banco de Dados ├─ database_creation.sql
- Rode o arquivo de popular do Banco de Dados ├─ pop_database.sql
- Execute o servidor backend:

```bash
cd backend
python app.py
```
Ou com uvicorn diretamente:
```bash
cd backend
python uvicorn app:app --reload
```
- Rode o frontend abrindo um servidor local ou ainda, abra diretamente o arquivo HTML

---

## 📆 Arquivos adicionais

Dentro da pasta *database* possui os arquivos utilizados para criação do banco de dados, os arquivos para popular ele e alguns arquivos adicionais.
Na atividade `Proj. Parte 2` era necessária a criação de comandos SELECT, de comandos TRIGGER e de PROCEDURES, como não utilizamos no frontend e nem no backend esses triggers, separei em arquivos adicionais
Estutura dos arquivos adicionais:

├── database/
│ ├── database_creation.sql # Criação do database
│ ├── logger_trigger.sql # Criação de trigger para logger / INSERT/UPDATE/DELETE | atividade 6.4
│ ├── pop_database.sql # Popular o database com 15 valores em cada tabela
│ ├── procedures.sql # Criação de uma procedure | atividade 6.3
│ ├── selects.sql # Retornar alguns comandos SELECT com AGGREGATIONS/JOINS | atividade 6.1 e 6.2
│ └── triggers.sql # Criação de um INSERT TRIGGER para não estourar a quantidade de alunos em cada aula | atividade 6.4
└── readme.md
