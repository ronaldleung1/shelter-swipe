import requests
import os
from dotenv import load_dotenv

load_dotenv()

def get_data_from_api():
    api_key = os.getenv("PETFINDER_ACCESS_TOKEN")
    headers = {"Authorization": f"Bearer {api_key}"}
    res = requests.get("https://api.petfinder.com/v2/animals", headers=headers)
    data = res.json()
    print(data)
    return data

# def clean_data(data):
#     # Clean and transform the data as necessary
#     # return only animals with photos
#     pass

# def populate_db(data):
#     # Use SQLAlchemy to add new animals to the database
#     pass

def main():
    data = get_data_from_api()
    # clean_data = clean_data(data)
    # populate_db(clean_data)

if __name__ == "__main__":
    main()