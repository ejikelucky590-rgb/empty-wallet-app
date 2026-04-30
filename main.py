from fastapi import FastAPI
import uvicorn

app = FastAPI(title="Empty Wallet Project API")

@app.get("/")
async def root():
    return {"message": "Welcome to the Zero Dollar Project - Africa Hub"}

@app.get("/feed")
async def get_feed():
    # Placeholder for TikTok-style video links (hosted on Telegram or Cloudinary)
    return [
        {"id": 1, "user": "LagosDev", "video_url": "https://t.me/your_cdn/1", "description": "Afrobeat Vibes"},
        {"id": 2, "user": "NairobiCoder", "video_url": "https://t.me/your_cdn/2", "description": "Tech in the City"}
    ]

@app.get("/music")
async def get_music():
    # Placeholder for Spotify-style audio links
    return [
        {"id": 101, "title": "Empty Wallet Anthem", "artist": "The Coder", "stream_url": "https://t.me/your_cdn/music1"}
    ]

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
