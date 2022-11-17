import logging
import os
import signal
import sys

import uvicorn
from fastapi import FastAPI

logging.getLogger("uvicorn")
HOST = os.getenv("HOST", "127.0.0.1")
PORT = os.getenv("PORT", "8080")
app = FastAPI()


def handle_shutdown(signal_int: int) -> None:
    """Handle the shutdown of our server, which gives us time to notify and clean up."""
    logging.info(f"Got interruption Signal {signal.strsignal(signal_int)}")  # TODO: Use logger and make it a util

    # TODO: Do stuff before exit(0)
    sys.exit(0)


@app.get("/")
async def root():
    return {"message": "Hello World!"}


if __name__ == "__main__":
    signal.signal(signal.SIGINT, handle_shutdown)  # handles Ctrl-C termination
    uvicorn.run("main:app", host=HOST, port=int(PORT), log_level="info")
else:
    signal.signal(signal.SIGTERM, handle_shutdown)
