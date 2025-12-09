from fastapi import APIRouter, status, Depends, Query
from fastapi.responses import JSONResponse
from fastapi.requests import Request
from scams_backend.dependencies.auth import get_current_user
from typing import Optional
from scams_backend.schemas.room.room_schema import RoomDetailResponse, RoomListResponse
from scams_backend.services.room.room_list_service import RoomListService
from scams_backend.services.room.room_detail_service import RoomDetailService

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
    limit: Optional[int] = Query(100, description="Limit number of results"),
    offset: Optional[int] = Query(0, description="Offset for results"),
) -> RoomListResponse:
    room_list_service = RoomListService(
        building_id=building_id,
        device_ids=device_ids,
        min_capacity=min_capacity,
        start_time=start_time,
        end_time=end_time,
        limit=limit,
        offset=offset,
        db_session=request.state.db_session,
    )
    room_list = room_list_service.invoke()
    return room_list


@router.get(
    "/rooms/{room_id}", status_code=status.HTTP_200_OK, response_class=JSONResponse
)
async def get_room_detail(
    request: Request,
    room_id: int,
    current_user=Depends(get_current_user),
) -> RoomDetailResponse:
    room_detail_service = RoomDetailService(
        room_id=room_id, db_session=request.state.db_session
    )
    room_detail = room_detail_service.invoke()
    return room_detail
