from db_config import Base
from sqlalchemy import Column, Integer, String


class Property(Base):
    __tablename__ = "properties"
    id = Column(Integer, primary_key=True, index=True)
    name = Column(String, index=True)
    location = Column(String)
    price = Column(Integer)


# Haz visible Base en el módulo
__all__ = ["Property", "Base"]
