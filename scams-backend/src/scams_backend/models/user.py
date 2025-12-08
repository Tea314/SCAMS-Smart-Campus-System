from scams_backend.db.base import Base
from sqlalchemy import Column, Integer, String, Boolean
from scams_backend.constants import user


class User(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    role = Column(String(50), nullable=False, default=user.ROLE_STUDENT)
    email = Column(String(320), unique=True, index=True, nullable=False)
    hashed_password = Column(String(128), nullable=False)
