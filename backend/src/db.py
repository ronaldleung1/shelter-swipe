from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

# Join tables -----------------------------

user_pet = db.Table(
    "user_table", db.Model.metadata,
    db.Column("user_id", db.Integer, db.ForeignKey("users.id")),
    db.Column("pet_id", db.Integer, db.ForeignKey("pets.id"))
)

# Classes ---------------------------------
class User(db.Model):
    """
    User model
    """
    __tablename__ = "users"
    id = db.Column(db.Integer, primary_key = True, autoincrement = True)
    name = db.Column(db.String, nullable = False)
    location = db.Column(db.String, nullable = False)

    liked_pets = db.relationship("Pet", secondary = user_pet, back_populates="users")

    def __init__(self, **kwargs):
        """
        Initialize a User object
        """
        self.name = kwargs.get("name", "")
        self.location = kwargs.get("location", "")

    def serialize(self):
        """
        Serializes a User object
        """
        return {
            "id": self.id,
            "name": self.name,
            "location": self.location,
            "liked_pets": [p.simple_serialize() for p in self.liked_pets]
        }
    
    def simple_serialize(self):
        """
        Serializes a User object with only basic information
        """
        return {
            "id": self.id,
            "name": self.name,
            "location": self.location
        }

class Pet(db.Model):
    """
    Pet model
    """
    __tablename__ = "pets"
    id = db.Column(db.Integer, primary_key = True, autoincrement = True)
    name = db.Column(db.String, nullable = False)
    species = db.Column(db.String, nullable = False)
    breed = db.Column(db.String, nullable = False)
    age = db.Column(db.Integer, nullable = False)
    description = db.Column(db.String, nullable = True)
    shelter_id = db.Column(db.Integer, db.ForeignKey("shelters.id"), nullable = False)
    users = db.relationship("User", secondary = user_pet, back_populates="liked_pets")

    def __init__(self, **kwargs):
        """
        Initialize a Pet object
        """
        self.name = kwargs.get("name", "")
        self.species = kwargs.get("species", "")
        self.breed = kwargs.get("breed", "")
        self.age = kwargs.get("age", "")
        self.description = kwargs.get("description", "")
        self.shelter_id = kwargs.get("shelter_id")

    def serialize(self):
        """
        Serializes a Pet object
        """
        return {
            "id": self.id,
            "name": self.name,
            "species": self.species,
            "breed": self.breed,
            "age": self.age,
            "description": self.description,
            "shelter": self.shelter_id,
            "users": [u.simple_serialize() for u in self.users]
        }
    
    def simple_serialize(self):
        """
        Serializes a Pet object with only basic information
        """
        return {
            "id": self.id,
            "name": self.name,
            "species": self.species,
            "breed": self.breed,
            "age": self.age,
            "likes": self.likes,
            "shelter": self.shelter_id
        }

class Shelter(db.Model):
    """
    Shelter model
    """
    __tablename__ = "shelters"
    id = db.Column(db.Integer, primary_key = True, autoincrement = True)
    name = db.Column(db.String, nullable = False)
    location = db.Column(db.String, nullable = False)
    pets = db.relationship("Pet", cascade = "delete")

    def __init__(self, **kwargs):
        """
        Initialize a Shelter object
        """
        self.name = kwargs.get("name", "")
        self.location = kwargs.get("location", "")

    def serialize(self):
        """
        Serializes a Shelter object
        """
        return {
            "id": self.id,
            "name": self.name,
            "location": self.location,
            "pets": [p.simple_serialize() for p in self.pets]
        }
    
    def simple_serialize(self):
        """
        Serializes a Shelter object with only basic information
        """
        return {
            "id": self.id,
            "name": self.name,
            "location": self.location,
        }
