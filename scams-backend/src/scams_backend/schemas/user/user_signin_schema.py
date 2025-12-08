from pydantic import BaseModel, EmailStr, Field


class UserSignInRequest(BaseModel):
    email: EmailStr = Field(..., description="The user's email address")
    password: str = Field(..., min_length=8, description="The user's password")


class UserSignInResponse(BaseModel):
    email: EmailStr = Field(..., description="The user's email address")
    role: str = Field(..., description="The role of the user")
