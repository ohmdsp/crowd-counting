ARG IMG

FROM ${IMG}

RUN --mount=type=cache,target=/root/.cache \
    python3 -m pip install matplotlib
