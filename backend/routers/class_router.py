from fastapi import APIRouter, Query
from typing import List
from controllers.class_controller import create_class, get_all_classes
from pydantic import BaseModel
import datetime

router = APIRouter()

class Aula(BaseModel):
    id: int
    horario: str
    modalidade: str
    instrutor: str
    duracao: datetime.timedelta
    capacidade: int
    data: datetime.date
    inscricoes: int
    dia: str

class Inscription(BaseModel):
    email: str
    fk_Aula_ID_Aula: int

@router.get("/getAll", response_model=List[Aula])
def get_all():
    return get_all_classes()

@router.post("/create")
def create(inscription: Inscription):
    return create_class(inscription)