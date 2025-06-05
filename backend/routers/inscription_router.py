from fastapi import APIRouter, Query
from typing import List
from controllers.inscription_controller import get_classes_by_email, delete_inscription
from pydantic import BaseModel

router = APIRouter()

class ClassInfo(BaseModel):
    id: int
    time: str
    modality: str
    instructor: str
    duration: str
    capacity: int

@router.get("/get/", response_model=List[ClassInfo])
def list_classes(user_email: str = Query(..., alias="user_email")):
    return get_classes_by_email(user_email)

@router.delete("/delete")
def delete_class_inscription(inscription_id: int = Query(..., alias="inscription_id"), user_email: str = Query(..., alias="user_email")):
    return delete_inscription(inscription_id, user_email)
