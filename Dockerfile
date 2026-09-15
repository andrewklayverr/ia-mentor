FROM node:24-bookworm-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates git ripgrep \
    && npm install --global @openai/codex \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /home/node/.codex /workspace \
    && chown -R node:node /home/node/.codex /workspace

USER node
WORKDIR /workspace

ENTRYPOINT ["codex"]
