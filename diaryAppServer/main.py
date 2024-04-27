from auth_decorator import is_authenticated
from typing import Annotated
from fastapi import FastAPI, Header
import firebase_admin
from firebase_admin import credentials
from firebase_admin import auth

app = FastAPI()

@app.get("/")
async def get_model(authorization: Annotated[str | None, Header()] = None,
                    name: Annotated[str | None, Header()] = None,
                    email: Annotated[str | None, Header()] = None,
                    ):
    sub = await is_authenticated(authorization)
    cred = credentials.Certificate("./diaryapp.json")
    app = firebase_admin.initialize_app(cred)
    try:
        auth.get_user(uid = sub)
    except Exception:
        auth.create_user(uid = sub, display_name = name, email = email)
    token = auth.create_custom_token(sub)
    firebase_admin.delete_app(app)
    return {"token": token, "name": name, "sub": sub}
