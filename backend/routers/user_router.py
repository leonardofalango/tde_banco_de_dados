from fastapi import APIRouter, Query
from typing import List
from controllers.user_controller import (
    get_all_users,
    delete_user,
    create_user,
    update_user
)
from pydantic import BaseModel

router = APIRouter()

class UserInfo(BaseModel):
    aluno_id: int
    name: str
    email: str
    birth_date: str
    contact: str
    cpf: str
    endereco: dict

class UserCreate(BaseModel):
    name: str
    email: str
    birth_date: str
    contact: str
    cpf: str

class UserUpdate(UserCreate):
    id: int

@router.get("/get_all", response_model=List[UserInfo])
def get_users(page: int = Query(0, ge=0)):
    u = get_all_users(page)
    print(f"Fetching users for page: {page}")
    print(f"Users fetched: {u}")
    print("userKeys", u[0].keys() if u else "No users found")
    return get_all_users(page)

@router.post("/create")
def create_new_user(user: UserCreate):
    return create_user(user)

@router.put("/update")
def update_existing_user(user: UserUpdate):
    return update_user(user)

@router.delete("/delete")
def remove_user(user_id: int = Query(..., alias="user_id")):
    return delete_user(user_id)
