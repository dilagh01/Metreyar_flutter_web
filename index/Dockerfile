
FROM cirrusci/flutter:stable AS build
WORKDIR /app
COPY . .
RUN flutter config --enable-web
RUN flutter build web

FROM nginx:alpine
COPY --from=build /app/build/web /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
