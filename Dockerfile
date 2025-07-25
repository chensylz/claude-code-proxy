FROM registry.cn-chengdu.aliyuncs.com/chensyf/astral-sh-uv:bookworm-slim

# Copy the project into the image
ADD . /app

# Sync the project into a new environment, asserting the lockfile is up to date
WORKDIR /app

ENV UV_DEFAULT_INDEX="https://mirrors.aliyun.com/pypi/simple"

RUN uv sync --locked

CMD ["uv", "run", "start_proxy.py"]
