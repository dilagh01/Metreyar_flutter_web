name: Flutter Web CI

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3

      - name: Setup Flutter
        uses: subosito/flutter-action@v2
        with:
          flutter-version: "3.22.2"

      - run: flutter pub get

      - run: flutter pub add --dev flutter_lints@^4.0.0

      - name: Build web release
        run: flutter build web --release

      - name: Upload artifact
        uses: actions/upload-artifact@v4
        with:
          name: web-build
          path: build/web
