#!/bin/bash

# बैकग्राउंड में Ollama सर्वर शुरू करें
ollama serve &

# सुनिश्चित करें कि n8n शुरू हो
exec /usr/local/bin/n8n
