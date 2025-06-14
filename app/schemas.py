from pydantic import BaseModel


class PropertyBase(BaseModel):
    name: str
    location: str
    price: int


class PropertyCreate(PropertyBase):
    pass


class Property(PropertyBase):
    id: int

    class Config:
        orm_mode = True
