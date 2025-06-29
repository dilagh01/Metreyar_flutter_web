# Use the official Flutter image
FROM cirrusci/flutter:latest

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Get dependencies and build
RUN flutter pub get
RUN flutter build web

# Use nginx to serve the built app
FROM nginx:alpine
COPY --from=0 /app/build/web /usr/share/nginx/html