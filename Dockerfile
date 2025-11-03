# Use official n8n image as base
FROM n8nio/n8n:latest

# Switch to root to install packages
USER root

# Install ffmpeg
RUN apk add --no-cache ffmpeg

# Switch back to node user
USER node

# Expose the n8n port
EXPOSE 5678
