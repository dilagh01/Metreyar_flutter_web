FROM cirrusci/flutter:3.22.1 AS builder

WORKDIR /app
COPY . .

RUN flutter pub get
RUN flutter build web

# مرحله دوم برای اجرای ساده با سرور
FROM nginx:alpine
COPY --from=builder /app/build/web /usr/share/nginx/html
