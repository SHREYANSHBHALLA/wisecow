# Use a lightweight Debian base image
FROM debian:bullseye-slim

# Install dependencies: fortune-mod, cowsay, and netcat
RUN apt-get update && \
    apt-get install -y fortune-mod cowsay netcat-openbsd && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy application files into container
COPY wisecow.sh .

# Make port 4499 available outside the container
EXPOSE 4499

# Run the wisecow server
CMD ["./wisecow.sh"]
