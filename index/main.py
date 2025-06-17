from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

# تنظیم CORS برای اجازه به درخواست از فرانت‌اند
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # بهتره اینجا آدرس فرانت‌اند دقیق باشه
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/api/metreyar")
async def metreyar_api():
    return {"message": "سلام از متره یار API"}
