# Use an official lightweight Python image
FROM python:3.12-slim

# Set the working directory inside the container
WORKDIR /app

# Install system dependencies (e.g., for health checks)
RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy the dependencies file and install Python packages
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# (Optional) Create a non-root user for security
RUN useradd -m -u 1000 appuser && chown -R appuser /app
USER appuser

# Expose the port Streamlit runs on
EXPOSE 8502

# Health check to verify the container is running
HEALTHCHECK CMD curl --fail http://localhost:8502/_stcore/health || exit 1

# Command to run the app
ENTRYPOINT ["streamlit", "run", "app.py", "--server.port=8502", "--server.address=0.0.0.0"]