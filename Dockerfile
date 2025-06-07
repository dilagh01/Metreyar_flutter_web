FROM dart:stable

# نصب Flutter
RUN git clone https://github.com/flutter/flutter.git /flutter \
  && /flutter/bin/flutter doctor

ENV PATH="/flutter/bin:/flutter/bin/cache/dart-sdk/bin:${PATH}"

WORKDIR /app
COPY . .

RUN flutter pub get
RUN flutter build web

CMD ["flutter", "serve", "--web-port", "8080"]
