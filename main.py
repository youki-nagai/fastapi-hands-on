from fastapi import FastAPI
from routers.v1 import articles, users

app = FastAPI()
app.include_router(articles.router)
app.include_router(users.router)


@app.get("/")
def index():
    return {"Hello": "World"}
