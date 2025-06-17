# مرحله اول: ساخت پروژه Flutter Web
FROM cirrusci/flutter:stable AS build

# تنظیم دایرکتوری کاری روی پوشه اصلی پروژه
WORKDIR /app/index

# کپی کردن همه فایل‌ها
COPY . .

# فعال‌سازی پشتیبانی از Flutter Web
RUN flutter config --enable-web

# دریافت پکیج‌ها
RUN flutter pub get

# بیلد پروژه برای وب
RUN flutter build web

# مرحله دوم: استفاده از Nginx برای سروینگ فایل‌های بیلد شده
FROM nginx:alpine

# کپی خروجی build به Nginx
COPY --from=build /app/index/build/web /usr/share/nginx/html
