# n8n की आधिकारिक इमेज को बेस के रूप में उपयोग करें
FROM n8nio/n8n:latest

# रूट यूजर के तौर पर स्विच करें
USER root

# जरूरी पैकेजेस और FFmpeg को इंस्टॉल करें
RUN apt-get update && apt-get install -y \
    ffmpeg \
    curl \
    gnupg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Ollama को इंस्टॉल करें
RUN curl -fsSL https://ollama.com/install.sh | sh

# वापस नोड यूजर के तौर पर स्विच करें
USER node

# पोर्ट 11434 (Ollama) और 5678 (n8n) को उजागर करें
EXPOSE 11434 5678

# कंटेनर शुरू होने पर चलने के लिए entrypoint स्क्रिप्ट
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
