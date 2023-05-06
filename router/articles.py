from fastapi import APIRouter

router = APIRouter(prefix="/articles", tags=["articles"])


@router.get("/all")
def index():
    return {"article": "all"}
