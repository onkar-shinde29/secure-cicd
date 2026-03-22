FROM python:3.11-slim

WORKDIR /app

# Update system


# Optional: Vulnerable OS package (uncomment to test OS vulnerabilities)
# RUN apt-get install -y openssl=1.1.1f-1ubuntu2

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["python", "app.py"]
