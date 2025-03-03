FROM python:3.11-slim

WORKDIR /app

# Copy requirements first to leverage Docker cache
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Set environment variables
ENV FLASK_APP=server.py
ENV FLASK_ENV=production

# Expose port
EXPOSE 5000

# Run the application
CMD ["python", "server.py"]
