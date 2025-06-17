# مرحله build
FROM ghcr.io/cirruslabs/flutter:3.19.6 AS build

WORKDIR /app
COPY . .

RUN flutter pub get
RUN flutter build web

# مرحله سرو کردن وب‌اپ
FROM nginx:alpine
COPY --from=build /app/build/web /usr/share/nginx/html
