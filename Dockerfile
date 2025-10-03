# 1. Base Image: Hum official n8n image se shuru karte hain.
FROM n8nio/n8n:latest

# 2. Privileges: FFmpeg install karne ke liye root user par switch karte hain.
USER root

# 3. Installation: apt-get package manager se FFmpeg install karte hain.
#    - apt-get update: Package lists ko update karta hai.
#    - apt-get install -y ffmpeg: FFmpeg ko install karta hai.
#    - rm -rf...: Temporary files ko hataakar image size chhota karta hai.
RUN apt-get update && \
    apt-get install -y ffmpeg && \
    rm -rf /var/lib/apt/lists/*

# 4. Security: Vaapas n8n ke default 'node' user par switch karte hain.
USER node

# 5. Command: Default n8n start command ko aise hi rehne dein.
#    (Aapko aage Render settings mein ise override karne ki zaroorat nahi.)
CMD ["n8n", "start"]
