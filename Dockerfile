# n8n की आधिकारिक इमेज को बेस के रूप में उपयोग करें
FROM n8nio/n8n:latest

# रूट यूजर के तौर पर स्विच करें
USER root

# जरूरी पैकेजेस और FFmpeg को इंस्टॉल करें
RUN apk add --update \
    ffmpeg \
    curl \
    gnupg

# Ollama को इंस्टॉल करें (curl पहले ही इंस्टॉल हो चुका है)
RUN curl -fsSL https://ollama.com/install.sh | sh

# वापस नोड यूजर के तौर पर स्विच करें
USER node

# Ollama के लिए वॉल्यूम सेट करें ताकि मॉडल स्थायी रहें
VOLUME /root/.ollama

# पोर्ट 11434 (Ollama) और 5678 (n8n) को उजागर करें
EXPOSE 11434 5678

# कंटेनर शुरू होने पर चलने के लिए entrypoint स्क्रिप्ट
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
