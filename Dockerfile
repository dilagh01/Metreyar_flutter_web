FROM cirrusci/flutter:latest

WORKDIR /app
COPY . .

RUN flutter channel stable
RUN flutter upgrade
RUN flutter config --enable-web
RUN flutter build web

# Serve app with a static server
FROM nginx:alpine
COPY --from=0 /app/build/web /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
