# مرحله Build با نسخه مشخص Flutter
FROM cirrusci/flutter:3.22.1 AS builder

WORKDIR /app
COPY . .

# گرفتن بسته‌ها و بیلد وب
RUN flutter pub get
RUN flutter build web --release

# مرحله Serve با Nginx
FROM nginx:alpine

# پاک کردن محتوای پیش‌فرض
RUN rm -rf /usr/share/nginx/html/*

# کپی خروجی پروژه ساخته‌شده
COPY --from=builder /app/build/web /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
