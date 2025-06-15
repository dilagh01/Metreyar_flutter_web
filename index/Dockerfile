# 1. استفاده از Flutter رسمی
FROM ghcr.io/cirruslabs/flutter:stable-web

# 2. تنظیم دایرکتوری کاری
WORKDIR /app

# 3. کپی فایل‌های پروژه به داخل ایمیج
COPY . .

# 4. گرفتن پکیج‌ها
RUN flutter pub get

# 5. بیلد وب
RUN flutter build web

# 6. استفاده از NGINX برای سرویس‌دهی
FROM nginx:alpine
COPY --from=0 /app/build/web /usr/share/nginx/html

# پورت پیش‌فرض
EXPOSE 80
