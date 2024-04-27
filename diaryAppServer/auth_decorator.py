from fastapi import HTTPException
from functools import wraps
import json
import aiohttp
from jose import jwt

AUTH0_DOMAIN = 'dev-eayo2wlpb6l2zzk4.us.auth0.com'
ALGORITHMS = ["RS256"]
#API_AUDIENCE = "https://diaryappbackend"
API_AUDIENCE = "RbVVflQxregPjQvQnbYLpS9bzMTH4C5b"

async def getJwks():
    async with aiohttp.ClientSession() as session:
        async with session.get("https://"+AUTH0_DOMAIN+"/.well-known/jwks.json") as response:
            return json.loads(await response.text())

async def is_authenticated(authorization):
    token = authorization.split()[1]
    jwks = await getJwks()
    unverified_header = jwt.get_unverified_header(token)
    rsa_key = {}
    for key in jwks["keys"]:
        if key["kid"] == unverified_header["kid"]:
            rsa_key = {
                "kty": key["kty"],
                "kid": key["kid"],
                "use": key["use"],
                "n": key["n"],
                "e": key["e"]
            }
    if rsa_key:
        try:
            payload = jwt.decode(
                    token,
                    rsa_key,
                    algorithms=ALGORITHMS,
                    audience=API_AUDIENCE,
                    issuer="https://"+AUTH0_DOMAIN+"/"
            )
            return payload["sub"]
        except Exception as e:
            print(e)
            raise HTTPException(status_code=403)

