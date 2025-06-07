FROM ghcr.io/cirruslabs/flutter:3.22.0

WORKDIR /app
COPY . .

RUN flutter pub get
RUN flutter build web

CMD ["flutter", "serve", "--web-port", "8080"]
