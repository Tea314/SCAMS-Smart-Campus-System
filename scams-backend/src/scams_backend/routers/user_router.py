from fastapi import APIRouter, status
from fastapi.responses import JSONResponse
from fastapi.requests import Request
from scams_backend.schemas.user.user_signin_schema import (
    UserSignInRequest,
    UserSignInResponse,
)
from scams_backend.schemas.user.user_signup_schema import (
    UserSignUpRequest,
    UserSignUpResponse,
)
from scams_backend.services.user.user_signup_service import UserSignUpService
from scams_backend.services.user.user_signin_service import UserSignInService

router = APIRouter(prefix="/user", tags=["User"])


@router.post(
    "/signup",
    status_code=status.HTTP_201_CREATED,
    response_class=JSONResponse,
)
async def signup(
    request: Request, signup_request: UserSignUpRequest
) -> UserSignUpResponse:
    service = UserSignUpService(
        db_session=request.state.db, signup_request=signup_request
    )
    signup_response: UserSignUpResponse = service.invoke()
    return signup_response
