FROM ghcr.io/cirruslabs/flutter:3.22.0 AS builder

WORKDIR /app
COPY . .

RUN flutter pub get
RUN flutter build web

CMD ["python3", "-m", "http.server", "--directory", "build/web", "8080"]
