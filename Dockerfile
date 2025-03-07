FROM python:3.10.8-slim-buster
WORKDIR /app

COPY requirements.txt requirements.txt
RUN apt update && apt install -y ffmpeg && rm -rf /var/lib/apt/lists/*
RUN pip3 install -r requirements.txt

COPY . .

CMD gunicorn app:app & python3 main.py
