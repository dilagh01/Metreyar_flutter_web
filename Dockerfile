# Build stage
FROM cirrusci/flutter:latest AS builder
WORKDIR /app
COPY . .
RUN flutter pub get
RUN flutter build web

# Serve stage
FROM nginx:alpine
COPY --from=builder /app/build/web /usr/share/nginx/html
