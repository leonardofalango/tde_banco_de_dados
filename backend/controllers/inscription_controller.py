from typing import List, Any
from fastapi import HTTPException

from src.connection import get_db_connection


def get_classes_by_email(email: str) -> List[dict]:
    conn = get_db_connection()
    cursor = conn.cursor()

    try:
        query = """
            SELECT A.ID_Aula, A.Horario, A.Modalidade, I.Nome, A.Duracao, A.Max_Alunos
            FROM Aluno AL
            JOIN Participa P ON AL.ID_Aluno = P.fk_Aluno_ID_Aluno
            JOIN Aula A ON A.ID_Aula = P.fk_Aula_ID_Aula
            JOIN Instrutor I ON I.ID_Instrutor = A.fk_Instrutor_ID_Instrutor
            WHERE AL.Email = %s
        """
        cursor.execute(query, (email,))
        results = cursor.fetchall()

        return [
            {
                "id": row[0],
                "time": str(row[1]),
                "modality": row[2],
                "instructor": row[3],
                "duration": str(row[4]),
                "capacity": row[5],
            }
            for row in results
        ]
    finally:
        cursor.close()
        conn.close()


def delete_inscription(inscription_id: int, user_email: str) -> dict:
    conn = get_db_connection()
    cursor = conn.cursor()
    print(f"Deleting inscription with ID: {inscription_id}")

    try:
        cursor.execute(
            """
            SELECT P.fk_Aluno_ID_Aluno
            FROM Participa P
            JOIN Aluno A ON P.fk_Aluno_ID_Aluno = A.ID_Aluno
            WHERE P.fk_Aula_ID_Aula = %s AND A.Email = %s
        """,
            (inscription_id, user_email),
        )
        result = cursor.fetchone()
        if not result:
            raise HTTPException(
                status_code=404,
                detail="Inscrição não encontrada ou não pertence ao usuário",
            )
        user_id = result[0]
        print(f"User ID associated with inscription: {user_id}")

        cursor.execute(
            "DELETE FROM Participa WHERE fk_Aula_ID_Aula = %s AND fk_Aluno_ID_Aluno = %s",
            (inscription_id, user_id),
        )
        conn.commit()

        if cursor.rowcount == 0:
            raise HTTPException(
                status_code=404,
                detail="Inscrição não encontrada ou não pertence ao usuário",
            )

        print(f"Inscription with ID {inscription_id} deleted successfully")
        return {"message": "Inscrição deletada com sucesso"}
    finally:
        cursor.close()
        conn.close()
