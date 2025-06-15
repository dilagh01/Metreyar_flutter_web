# مرحله اول: استفاده از ایمیج رسمی Flutter برای build پروژه
FROM cirrusci/flutter:stable AS build

# به‌روزرسانی Flutter و فعال‌سازی پشتیبانی از Web
RUN flutter channel stable
RUN flutter upgrade
RUN flutter config --enable-web

# تنظیم دایرکتوری کاری داخل کانتینر
WORKDIR /app

# کپی کردن فایل‌های پروژه به داخل کانتینر
COPY . .

# گرفتن پکیج‌های مورد نیاز پروژه
RUN flutter pub get

# ساخت (بیلد) نسخه‌ی web پروژه
RUN flutter build web

# مرحله دوم: استفاده از nginx برای سرویس‌دهی فایل‌های ساخته‌شده
FROM nginx:alpine

# پاک کردن فایل‌های پیش‌فرض nginx
RUN rm -rf /usr/share/nginx/html/*

# کپی فایل‌های بیلد شده به پوشه‌ی nginx
COPY --from=build /app/build/web /usr/share/nginx/html

# باز کردن پورت 80 برای دسترسی
EXPOSE 80

# اجرای nginx
CMD ["nginx", "-g", "daemon off;"]
