ARG IMG

FROM ${IMG}

ENV PIP_CACHE_DIR=/var/cache/buildkit/pip
RUN mkdir -p $PIP_CACHE_DIR
RUN rm -f /etc/apt/apt.conf.d/docker-clean
RUN --mount=type=cache,target=/var/cache/apt \
    apt-get update; \
    apt-get install -yqq --no-install-recommends \
    libgl1; \
    rm -rf /var/lib/apt/lists/*

RUN --mount=type=cache,target=/root/.cache \
    python3 -m pip install matplotlib opencv-python
