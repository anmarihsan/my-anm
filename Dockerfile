FROM --platform=linux/amd64 ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update -y && apt install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa -y && \
    apt update -y && apt install -y \
    ffmpeg \
    git \
    python3.11 \
    python3.11-dev \
    python3.11-distutils \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3.11 && \
    python3.11 -m pip install --upgrade pip setuptools wheel

RUN python3.11 -m pip install --no-cache-dir \
    mtranslate \
    google-genai \
    requests \
    g4f \
    mutagen \
    tgcalls==3.0.0.dev6 \
    py-tgcalls~=2.2.11 \
    telethon \
    aiosqlite \
    aiocron \
    emoji \
    pytz \
    gtts \
    qrcode \
    aiohttp \
    fake_useragent \
    user_agent \
    hijri_converter \
    gpytranslate \
    watchdog

WORKDIR /app
COPY . /app

CMD ["python3.11", "main.py"]
