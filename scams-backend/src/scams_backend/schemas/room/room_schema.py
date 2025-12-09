from pydantic import BaseModel, Field, ConfigDict


class RoomDetailResponse(BaseModel):
    id: int = Field(..., description="The unique identifier of the room")
    name: str = Field(..., description="The name of the room")
    floor_number: int = Field(..., description="The floor number of the room")
    building_name: str = Field(..., description="The building name of the room")
    capacity: int = Field(..., description="The capacity of the room")
    devices: list[str] = Field(
        ..., description="The list of devices available in the room"
    )
    model_config = ConfigDict(from_attributes=True)


class RoomListResponse(BaseModel):
    rooms: list[RoomDetailResponse] = Field(..., description="The list of rooms")
    model_config = ConfigDict(from_attributes=True)
