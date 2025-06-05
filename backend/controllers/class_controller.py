
from typing import Any
from fastapi import HTTPException
from src.connection import get_db_connection

def get_all_classes():
    try:
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("""
            SELECT 
            a.ID_Aula AS id,
            a.Horario AS horario,
            a.Modalidade AS modalidade,
            i.Nome AS instrutor,
            a.Duracao AS duracao,
            a.Max_Alunos AS capacidade,
            a.Data AS data,
            a.DiaSemana AS dia
            FROM Aula a
            JOIN Instrutor i ON a.fk_Instrutor_ID_Instrutor = i.ID_Instrutor
        """)
        aulas = cursor.fetchall()

        query_count_inscriptions = """
            SELECT COUNT(*) AS inscricoes
            FROM Participa p
            WHERE p.fk_Aula_ID_Aula = %s"""
        for aula in aulas:
            cursor.execute(query_count_inscriptions, (aula["id"],))
            inscricoes = cursor.fetchone()
            aula["inscricoes"] = inscricoes["inscricoes"]

        if not aulas:
            raise HTTPException(status_code=404, detail="Nenhuma aula encontrada")
        return [
            {
                "id": aula["id"],
                "horario": str(aula["horario"]),
                "modalidade": aula["modalidade"],
                "instrutor": aula["instrutor"],
                "duracao": str(aula["duracao"]),
                "capacidade": aula["capacidade"],
                "inscricoes": aula["inscricoes"],
                "data": str(aula["data"]),
                "dia": aula["dia"]
            } for aula in aulas
        ]
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        cursor.close()
        conn.close()



def create_class(inscription: Any):
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        email = inscription.email
        print(f"Email recebido: {email}")
        cursor.execute("SELECT ID_Aluno FROM Aluno WHERE Email = %s", (email,))
        aluno = cursor.fetchone()

        if not aluno:
            raise HTTPException(status_code=404, detail="Aluno não encontrado com o email fornecido.")
        aluno_id = aluno[0]
        aula_id = inscription.fk_Aula_ID_Aula

        cursor.execute("""
            INSERT INTO Participa (fk_Aluno_ID_Aluno, fk_Aula_ID_Aula)
            VALUES (%s, %s)
        """, (aluno_id, aula_id))

        if cursor.rowcount == 0:
            raise HTTPException(status_code=400, detail="Erro ao realizar inscrição. Verifique os dados fornecidos.")

        conn.commit()
        return {"message": "Inscrição realizada com sucesso!"}
    except HTTPException as http_exc:
        raise http_exc
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        cursor.close()
        conn.close()