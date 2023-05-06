from fastapi import APIRouter

router = APIRouter(prefix="/v1/articles", tags=["v1/articles"])


@router.get("/all")
def index():
    return {"article": "all"}
