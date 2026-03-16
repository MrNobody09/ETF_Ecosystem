FROM mcr.microsoft.com/devcontainers/universal:2

RUN apt-get update \
    && apt-get install -y --no-install-recommends postgresql-client docker.io \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspaces
