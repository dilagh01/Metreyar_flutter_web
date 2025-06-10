FROM cirrusci/flutter:latest

WORKDIR /app
COPY . .

RUN flutter pub get
RUN flutter build web

CMD ["python3", "-m", "http.server", "--directory", "build/web", "8080"]
