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