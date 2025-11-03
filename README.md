# n8n-ffmpeg-render
n8n Docker image with ffmpeg support for Render deployment

## Overview
This repository contains a Dockerfile that extends the official n8n image with ffmpeg support, making it ready for deployment on Render or other container platforms.

## Features
- Based on the official `n8n` Docker image
- Includes `ffmpeg` for media processing workflows
- Optimized for deployment on Render
- Minimal configuration required
- **Automated keep-alive**: GitHub Actions workflow pings the Render instance every 10 minutes to prevent it from sleeping due to inactivity

## Deployment on Render
1. Create a new **Web Service** on Render
2. Connect this GitHub repository
3. Set the following:
   - **Environment**: Docker
   - **Port**: 5678
4. Add any required environment variables (e.g., `N8N_BASIC_AUTH_USER`, `N8N_BASIC_AUTH_PASSWORD`)
5. Deploy!

## Keep-Alive Mechanism
This repository includes a GitHub Actions workflow (`.github/workflows/ping-n8n.yml`) that automatically pings the n8n Render instance every 10 minutes. This prevents Render's free tier from spinning down the service due to inactivity, keeping your n8n instance awake and responsive.

The workflow:
- Runs on a schedule every 10 minutes
- Sends a GET request to https://n8n-ffmpeg-render-5iew.onrender.com/
- Can also be triggered manually from the Actions tab
- Logs each ping with a timestamp

## Environment Variables
Common n8n environment variables you may want to configure:
- `N8N_BASIC_AUTH_USER` - Basic auth username
- `N8N_BASIC_AUTH_PASSWORD` - Basic auth password
- `N8N_HOST` - Your Render app URL
- `WEBHOOK_URL` - Your Render app URL for webhooks
- `N8N_PROTOCOL` - Set to `https` for production

## Local Testing
```bash
docker build -t n8n-ffmpeg .
docker run -p 5678:5678 n8n-ffmpeg
```

Access n8n at `http://localhost:5678`

## License
MIT
