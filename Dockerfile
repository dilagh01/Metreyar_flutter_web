# مرحله اول: استفاده از ایمیج رسمی Flutter برای بیلد
FROM cirrusci/flutter:latest AS builder

# مسیر کاری داخل کانتینر
WORKDIR /app

# کپی کل پروژه به داخل کانتینر
COPY . .

# نصب پکیج‌های مورد نیاز پروژه
RUN flutter pub get

# بیلد نسخه وب از پروژه فلاتر
RUN flutter build web

# مرحله دوم: استفاده از Nginx برای سرو کردن پروژه
FROM nginx:alpine

# پاک کردن محتوای پیش‌فرض Nginx
RUN rm -rf /usr/share/nginx/html/*

# کپی خروجی build شده Flutter Web به پوشه public سرور
COPY --from=builder /app/build/web /usr/share/nginx/html

# اکسپوز کردن پورت 80 (پورت پیش‌فرض HTTP)
EXPOSE 80

# اجرای Nginx (دستور پیش‌فرض ایمیج nginx فعال است)
