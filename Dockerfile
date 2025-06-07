FROM cirrusci/flutter:3.22.2

WORKDIR /app
COPY . .

RUN flutter pub get
RUN flutter build web

CMD ["bash"]
