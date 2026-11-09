FROM python:3.11-slim

WORKDIR /app

# Copy the ingestion daemon into the container
COPY engine/zeek_transmute.py /app/zeek_transmute.py

# Ensure output log directories exist
RUN mkdir -p /var/log/transmuted /var/log/zeek

CMD ["python", "-u", "/app/zeek_transmute.py"]
