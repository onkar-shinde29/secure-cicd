# Use Python 3.11 slim image
FROM python:3.11-slim

WORKDIR /app

# Update system
RUN apt-get update && apt-get upgrade -y

# ✅ Introduce a vulnerable OS package to trigger Trivy
RUN apt-get install -y curl=7.68.0-1ubuntu2

# Copy Python requirements and install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Expose Flask default port
EXPOSE 5000

# Start Flask app
CMD ["python", "app.py"]
