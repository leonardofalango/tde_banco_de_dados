from dotenv import load_dotenv

load_dotenv(override=True)

from fastapi import FastAPI
from routers import inscription_router, user_router, class_router, locations_router
from fastapi.middleware.cors import CORSMiddleware
from src.connection import get_db_connection

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(inscription_router.router, prefix="/inscriptions")
app.include_router(user_router.router, prefix="/user")
app.include_router(class_router.router, prefix="/classes")
app.include_router(locations_router.router, prefix="/address")

@app.get("/health")
def health_check():
    try:
        conn = get_db_connection()
        conn.close()
        return {"status": "ok"}
    except Exception as e:
        return {"status": "error", "message": str(e)}


@app.get("/")
def read_root():
    return {"message": "Bem-vindo à API do sistema de gestão de aulas!"}


if __name__ == "__main__":
    import uvicorn

    uvicorn.run(app)
