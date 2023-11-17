import json

from db import db
from flask import Flask, request
import os
from db import User

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

# ROUTES -----------------------------------------
@app.route("/api/users/", methods = ["GET"])
def get_users():
    """
    Endpoint for getting all users
    """
    users = [user.serialize() for user in User.query.all()]

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
        species_pref = body.get("species_pref"),
        age_pref = body.get("age_pref")
    )
    db.session.add(new_user)
    db.session.commit()
    return success_response(new_user.serialize(), 201)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000, debug=True)