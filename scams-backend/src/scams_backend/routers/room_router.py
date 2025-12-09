from fastapi import APIRouter, status, Depends, Query
from fastapi.responses import JSONResponse
from fastapi.requests import Request
from scams_backend.dependencies.auth import get_current_user
from typing import Optional
from scams_backend.schemas.room.room_schema import RoomDetailResponse, RoomListResponse

router = APIRouter(tags=["Rooms"])


from typing import Optional, List
from datetime import datetime


@router.get("/rooms", status_code=status.HTTP_200_OK, response_class=JSONResponse)
async def list_rooms(
    request: Request,
    current_user=Depends(get_current_user),
    building_id: Optional[int] = Query(None, description="Filter by building ID"),
    device_ids: Optional[List[int]] = Query(None, description="List of device IDs"),
    min_capacity: Optional[int] = Query(None, description="Minimum room capacity"),
    start_time: Optional[datetime] = Query(
        None, description="Start of time window (ISO format)"
    ),
    end_time: Optional[datetime] = Query(
        None, description="End of time window (ISO format)"
    ),
) -> RoomListResponse:
    pass


@router.get(
    "/rooms/{room_id}", status_code=status.HTTP_200_OK, response_class=JSONResponse
)
async def get_room_detail(
    request: Request,
    room_id: int,
    current_user=Depends(get_current_user),
) -> RoomDetailResponse:
    pass
