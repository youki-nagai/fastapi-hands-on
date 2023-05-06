from fastapi import FastAPI
from routers.v1 import articles

app = FastAPI()
app.include_router(articles.router)


@app.get("/")
def index():
    return {"Hello": "World"}
