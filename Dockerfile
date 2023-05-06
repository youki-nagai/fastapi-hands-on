FROM python:3.11-slim

ENV PIP_NO_CACHE_DIR=false \
  PIP_DISABLE_PIP_VERSION_CHECK=1 \
  PIP_DEFAULT_TIMEOUT=100 \
  POETRY_VERSION=1.4.2

WORKDIR /workdir

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  curl=7.* \
  build-essential=12.* \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir "poetry==$POETRY_VERSION"

COPY . /workdir

RUN poetry self add poetry-dotenv-plugin

RUN poetry config virtualenvs.create false \
  && poetry install --no-interaction --no-ansi

CMD poetry run uvicorn main:app
