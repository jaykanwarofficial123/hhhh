FROM n8nio/n8n:latest

USER root

RUN apk update && \
    apk add ffmpeg --no-cache

USER node
