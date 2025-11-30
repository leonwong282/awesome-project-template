# 🐳 Dockerfile Template
# Multi-stage build template - uncomment the section for your language
# Learn more: https://docs.docker.com/build/building/multi-stage/

# ═══════════════════════════════════════════════════════════════════════════════
# PLACEHOLDER - This Dockerfile is a template. Uncomment ONE section below.
# The following line prevents "no source image" errors from linters.
# ═══════════════════════════════════════════════════════════════════════════════
FROM scratch AS placeholder
# Remove the above line and uncomment one of the sections below for your project.

# ═══════════════════════════════════════════════════════════════════════════════
# CHOOSE YOUR LANGUAGE: Uncomment ONE of the sections below
# ═══════════════════════════════════════════════════════════════════════════════


# ───────────────────────────────────────────────────────────────────────────────
# OPTION 1: Node.js Application
# ───────────────────────────────────────────────────────────────────────────────

# # Build stage
# FROM node:20-alpine AS builder
# WORKDIR /app
#
# # Install dependencies
# COPY package*.json ./
# RUN npm ci --only=production
#
# # Copy source and build
# COPY . .
# RUN npm run build
#
# # Production stage
# FROM node:20-alpine AS runner
# WORKDIR /app
#
# # Create non-root user for security
# RUN addgroup --system --gid 1001 nodejs && \
#     adduser --system --uid 1001 appuser
#
# # Copy built assets
# COPY --from=builder --chown=appuser:nodejs /app/dist ./dist
# COPY --from=builder --chown=appuser:nodejs /app/node_modules ./node_modules
# COPY --from=builder --chown=appuser:nodejs /app/package.json ./
#
# USER appuser
# EXPOSE 3000
# CMD ["node", "dist/index.js"]


# ───────────────────────────────────────────────────────────────────────────────
# OPTION 2: Python Application
# ───────────────────────────────────────────────────────────────────────────────

# # Build stage
# FROM python:3.12-slim AS builder
# WORKDIR /app
#
# # Create virtual environment
# RUN python -m venv /opt/venv
# ENV PATH="/opt/venv/bin:$PATH"
#
# # Install dependencies
# COPY requirements.txt .
# RUN pip install --no-cache-dir -r requirements.txt
#
# # Production stage
# FROM python:3.12-slim AS runner
# WORKDIR /app
#
# # Create non-root user for security
# RUN useradd --create-home --shell /bin/bash appuser
#
# # Copy virtual environment from builder
# COPY --from=builder /opt/venv /opt/venv
# ENV PATH="/opt/venv/bin:$PATH"
#
# # Copy application code
# COPY --chown=appuser:appuser . .
#
# USER appuser
# EXPOSE 8000
# CMD ["python", "-m", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]


# ───────────────────────────────────────────────────────────────────────────────
# OPTION 3: Go Application
# ───────────────────────────────────────────────────────────────────────────────

# # Build stage
# FROM golang:1.22-alpine AS builder
# WORKDIR /app
#
# # Download dependencies
# COPY go.mod go.sum ./
# RUN go mod download
#
# # Build the application
# COPY . .
# RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-w -s" -o /app/main .
#
# # Production stage - use scratch for smallest image
# FROM scratch AS runner
#
# # Copy SSL certificates for HTTPS
# COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
#
# # Copy the binary
# COPY --from=builder /app/main /main
#
# EXPOSE 8080
# ENTRYPOINT ["/main"]


# ───────────────────────────────────────────────────────────────────────────────
# OPTION 4: Static Website (e.g., React, Vue, Docusaurus)
# ───────────────────────────────────────────────────────────────────────────────

# # Build stage
# FROM node:20-alpine AS builder
# WORKDIR /app
#
# COPY package*.json ./
# RUN npm ci
#
# COPY . .
# RUN npm run build
#
# # Production stage - use nginx to serve static files
# FROM nginx:alpine AS runner
#
# # Copy custom nginx config (optional)
# # COPY nginx.conf /etc/nginx/nginx.conf
#
# # Copy built static files
# COPY --from=builder /app/build /usr/share/nginx/html
#
# EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]


# ═══════════════════════════════════════════════════════════════════════════════
# BEST PRACTICES APPLIED IN THIS TEMPLATE
# ═══════════════════════════════════════════════════════════════════════════════
#
# 1. MULTI-STAGE BUILDS: Separate build and runtime for smaller images
# 2. NON-ROOT USER: Run as unprivileged user for security
# 3. MINIMAL BASE IMAGES: Use Alpine or slim variants
# 4. LAYER CACHING: Copy dependency files before source code
# 5. .dockerignore: Exclude unnecessary files (see .dockerignore)
#
# ═══════════════════════════════════════════════════════════════════════════════
# USAGE
# ═══════════════════════════════════════════════════════════════════════════════
#
# Build:
#   docker build -t myapp:latest .
#
# Run:
#   docker run -p 3000:3000 myapp:latest
#
# Build with build args:
#   docker build --build-arg NODE_ENV=production -t myapp:latest .
#
# ═══════════════════════════════════════════════════════════════════════════════
