from scams_backend.core import config

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from scams_backend.web_app import initialize_app

app = FastAPI(title="Smart Campus System API", root_path="/api/v1")

origins = [
    "http://localhost:5173",
    "http://localhost:5173/",
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app = initialize_app(app)
