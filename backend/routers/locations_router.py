from fastapi import APIRouter, Query
from typing import List
from controllers.location_controller import create_location, get_all_locations
from pydantic import BaseModel
import datetime

router = APIRouter()

class Location(BaseModel):
    id: int
    rua: str
    cidade: str
    complemento: str
    cep: str

@router.get("/get_all", response_model=List[Location])
def get_all():
    return get_all_locations()

@router.post("/create")
def create(location: Location):
    print(f"Creating location: {location}")
    return create_location(location)