from fastapi import HTTPException
from typing import Any
from datetime import datetime

from src.connection import get_db_connection


def get_all_locations():
    conn = get_db_connection()
    cursor = conn.cursor()
    try:
        cursor.execute(
            """
            SELECT 
                e.Endereco_PK AS id,
                e.Logradouro AS rua,
                e.Cidade AS cidade,
                e.Complemento AS complemento,
                e.CEP AS cep
            FROM Endereco e
            ORDER BY e.Endereco_PK
        """
        )
        locations = cursor.fetchall()

        if not locations:
            raise HTTPException(status_code=404, detail="Nenhuma localização encontrada")

        return [
            {
                "id": loc[0],
                "rua": loc[1],
                "cidade": loc[2],
                "complemento": loc[3],
                "cep": loc[4]
            } for loc in locations
        ]
    except Exception as e:
        print(f"Error fetching locations: {e}")
        raise HTTPException(status_code=500, detail="Erro ao buscar localizações")
    finally:
        cursor.close()
        conn.close()


def create_location(location: Any):
    conn = get_db_connection()


    cursor = conn.cursor()

    try:
        cursor.execute(
            """
            INSERT INTO Endereco (Endereco_Pk, Logradouro, Cidade, CEP, Complemento)
            VALUES (%s, %s, %s, %s, %s)
            """,
            (
                location.id,
                location.rua,
                location.cidade,
                location.cep,
                location.complemento if hasattr(location, 'complemento') else None
            )
        )
        conn.commit()
        return {"message": "Localização criada com sucesso", "id": location.id}
    except Exception as e:
        print(f"Error creating location: {e}")
        raise HTTPException(status_code=500, detail="Erro ao criar localização")
    finally:
        cursor.close()
        conn.close()
    