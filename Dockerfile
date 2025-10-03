# 1. Base Image: Hum official n8n image se shuru karte hain.
FROM n8nio/n8n:latest

# 2. Privileges: Root user par switch karein
USER root

# 3. Installation: FFmpeg ko apk (Alpine's package manager) se install karein.
#    Note: 'ffmpeg' ko install karne ke liye zaroori repositories add karna pad sakta hai.
#    Lekin seedha 'ffmpeg' ya 'ffmpeg-dev' install karne ki koshish karein.

RUN apk update && \
    apk add ffmpeg --no-cache

# 4. Security: Vaapas default user par switch karein.
USER node

# 5. Command: Default n8n start command ko aise hi rehne dein.
CMD ["n8n", "start"]
