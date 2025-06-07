FROM cirrusci/flutter:3.19.6

WORKDIR /app
COPY . .

RUN flutter pub get
RUN flutter build web

CMD ["flutter", "serve", "--web-port", "8080"]
