name: metreyar_flutter_web
description: A new Flutter web project.
publish_to: 'none'

version: 1.0.0+1

environment:
  sdk: ">=3.3.0 <4.0.0"

dependencies:
  flutter:
    sdk: flutter
  http: ^0.13.6

  # برای Flutter Web نیازی به cupertino_icons نیست، ولی اگه خواستی می‌تونی بذاری
  cupertino_icons: ^1.0.2

dev_dependencies:
  flutter_test:
    sdk: flutter

  flutter_lints: ^3.0.0

flutter:
  uses-material-design: true
