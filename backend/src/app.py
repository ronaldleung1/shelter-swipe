import json

from db import db
from flask import Flask, request
import os
from db import User, Pet, Shelter

app = Flask(__name__)
db_filename = "shelter_swipe.db"

app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///%s" % db_filename
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
app.config["SQLALCHEMY_ECHO"] = True

db.init_app(app)
with app.app_context():
    db.create_all()

def success_response(data, code=200):
    return json.dumps(data), code

def failure_response(message, code=404):
    return json.dumps({"error": message}), code

# USER ROUTES -----------------------------------------
@app.route("/api/users/", methods = ["GET"])
def get_users():
    """
    Endpoint for getting all users
    """
    users = [user.serialize() for user in User.query.all()]
    # TODO determine if serialize or simple_serialize is better

    return success_response({"users": users}, 201)

@app.route("/api/users/", methods = ["POST"])
def create_user():
    """
    Endpoint for creating a user
    """
    body = json.loads(request.data)
    if body.get("name") is None:
        return failure_response("Missing information to create a new user", 400)
    new_user = User(
        name = body.get("name"),
        location = body.get("location")
    )
    db.session.add(new_user)
    db.session.commit()
    return success_response(new_user.serialize(), 201)

# PET ROUTES -----------------------------------------
@app.route("/api/pets/", methods = ["GET"])
def get_pets():
    """
    Endpoint for getting all pets
    """
    pets = [pet.serialize() for pet in Pet.query.all()]

    return success_response({"pets": pets}, 201)



@app.route("/api/pets/", methods = ["POST"])
def create_pet():
    """
    Endpoint for creating a pet
    """
    body = json.loads(request.data)
    if body.get("name") is None or body.get("species") is None or body.get("breed") is None or body.get("age") is None:
        return failure_response("Missing information to create a new pet", 400)
    new_pet = Pet(
        name = body.get("name"),
        species = body.get("species"),
        breed = body.get("breed"),
        age = body.get("age"),
        description = body.get("description"),
        shelter_id = body.get("shelter_id")
    )
    db.session.add(new_pet)
    db.session.commit()
    return success_response(new_pet.serialize(), 201)

# SHELTER ROUTES -----------------------------------------
@app.route("/api/shelters/", methods = ["GET"])
def get_shelters():
    """
    Endpoint for getting all shelters
    """
    shelters = [shelter.serialize() for shelter in Shelter.query.all()]

    return success_response({"shelters": shelters}, 201)

@app.route("/api/shelters/", methods = ["POST"])
def create_shelter():
    """
    Endpoint for creating a shelter
    """
    body = json.loads(request.data)
    if body.get("name") is None or body.get("location") is None:
        return failure_response("Missing information to create a new shelter", 400)
    new_shelter = Shelter(
        name = body.get("name"),
        location = body.get("location")
    )
    db.session.add(new_shelter)
    db.session.commit()
    return success_response(new_shelter.serialize(), 201)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000, debug=True)