from sqlalchemy import select
from sqlalchemy.orm import Session
from scams_backend.models.room import Room
from scams_backend.models.building import Building
from scams_backend.models.device import Device
from scams_backend.models.room_device import RoomDevice
from scams_backend.schemas.room.room_schema import RoomDetailResponse
from scams_backend.schemas.room.room_schema import RoomListResponse
from scams_backend.services.room.room_list_service import RoomListService
from typing import Optional
from datetime import datetime


class RoomListService:
    def __init__(
        self,
        building_id: Optional[int],
        device_ids: Optional[list[int]],
        min_capacity: Optional[int],
        start_time: Optional[datetime],
        end_time: Optional[datetime],
        db_session: Session,
    ):
        self.building_id: Optional[int] = building_id
        self.device_ids: Optional[list[int]] = device_ids
        self.min_capacity: Optional[int] = min_capacity
        self.start_time: Optional[datetime] = start_time
        self.end_time: Optional[datetime] = end_time
        self.db_session: Session = db_session
        self.room_ids: list[int] = []
        self.rooms: list[RoomDetailResponse] = []

    def get_filtered_rooms(self) -> None:
        pass

    def get_room_details(self) -> None:
        pass

    def invoke(self) -> RoomListResponse:
        self.get_filtered_rooms()
        return RoomListResponse.model_validate(self.rooms)
