from fastapi import HTTPException
from typing import Any
from datetime import datetime

from src.connection import get_db_connection


def get_all_users(page: int):
    conn = get_db_connection()
    cursor = conn.cursor()

    LIMIT = 10
    OFFSET = page * LIMIT

    try:
        cursor.execute(
            """
            SELECT a.ID_Aluno, a.Nome, a.Email, a.Data_Nascimento, a.Celular, a.CPF, e.Endereco_PK, e.Logradouro, e.Cidade, e.CEP, e.Complemento
            FROM Aluno AS a
            JOIN Endereco AS e ON a.fk_Endereco_Endereco_PK = e.Endereco_PK
            LIMIT %s OFFSET %s
        """,
            (LIMIT, OFFSET),
        )

        rows = cursor.fetchall()

        return [
            {
                "aluno_id": row[0],
                "name": row[1],
                "email": row[2],
                "birth_date": str(row[3]),
                "contact": row[4],
                "cpf": row[5],
                "endereco" : {
                    "endereco_pk" : row[6],
                    "logradouro": row[7],
                    "cidade": row[8],
                    "cep": row[9],
                    "complemento": row[10]
                }
            }
            for row in rows
        ]
    except Exception as e:
        print(f"Error fetching users: {e}")
        raise HTTPException(status_code=500, detail="Erro ao buscar usuários")
    finally:
        cursor.close()
        conn.close()


def create_user(user: Any):
    conn = get_db_connection()
    cursor = conn.cursor()
    print(f"Creating user: {user}")

    try:
        cursor.execute(
            """
            INSERT INTO Aluno (Nome, Email, Data_Nascimento, Celular, CPF, fk_Endereco_Endereco_PK)
            VALUES (%s, %s, %s, %s, %s, %s)
        """,
            (
                user.name,
                user.email,
                datetime.strptime(user.birth_date, "%Y-%m-%d").date(),
                user.contact,
                user.cpf,
                user.endereco_id,
            ),
        )
        conn.commit()
        return {"message": "Usuário criado com sucesso"}
    finally:
        cursor.close()
        conn.close()


def update_user(user: Any):
    conn = get_db_connection()
    cursor = conn.cursor()

    try:
        cursor.execute("SELECT * FROM Aluno WHERE ID_Aluno = %s", (user.id,))
        if not cursor.fetchone():
            raise HTTPException(status_code=404, detail="Usuário não encontrado")

        cursor.execute(
            """
            UPDATE Aluno
            SET Nome = %s, Email = %s, Data_Nascimento = %s, Celular = %s, CPF = %s, fk_Endereco_Endereco_PK = %s
            WHERE ID_Aluno = %s
        """,
            (
                user.name,
                user.email,
                user.birth_date,
                user.contact,
                user.cpf,
                user.endereco_id,
                user.id,
            ),
        )
        conn.commit()
        return {"message": "Usuário atualizado com sucesso"}
    finally:
        cursor.close()
        conn.close()


def delete_user(user_id: int):
    conn = get_db_connection()
    cursor = conn.cursor()
    print(f"Deleting user with ID: {user_id}")

    try:
        cursor.execute("SELECT * FROM Aluno WHERE ID_Aluno = %s", (user_id,))
        if not cursor.fetchone():
            raise HTTPException(status_code=404, detail="Usuário não encontrado")

        cursor.execute("DELETE FROM Participa WHERE fk_Aluno_ID_Aluno = %s", (user_id,))
        cursor.execute("DELETE FROM Aluno WHERE ID_Aluno = %s", (user_id,))
        conn.commit()
        return {"message": "Usuário deletado com sucesso"}
    finally:
        cursor.close()
        conn.close()
