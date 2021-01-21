# NextSPA

A Flutter SPA map application.
[DOWNLOAD APK](https://github.com/SebastianWaloszek/next_spa/releases/) 

![alt text](https://mir-s3-cdn-cf.behance.net/project_modules/fs/afd17d111834661.600941edd328b.png)

## Features
- See your location on map. Refresh on demand.
- See nearbly SPA facilities.
- Open navigation to selected SPA.
- Dark Mode support!

## UI & UX
- [Figma design project](https://www.figma.com/file/24Knx6TLsMpEET5hphgbfR/next_spa_app_design?node-id=0%3A1)

## Flutter version

This app was developed and tested on the following flutter channel and version:
```javascript
Flutter 1.25.0-8.3.pre • channel beta • https://github.com/flutter/flutter.git
Framework • revision 5d36f2e7f5 (6 days ago) • 2021-01-14 15:57:49 -0800
Engine • revision 7a8f8ca02c
Tools • Dart 2.12.0 (build 2.12.0-133.7.beta)
```

## Tested devices

The apps functionality and UI were tested on the following devices:
- **Android**
    - Pixel 2 XL (Android 10)
- **iOS Simulator**
    - iPhone SE
    - iPhone 8
    - iPhone 11 Pro

## Localizations

The apps supports the following localizations with appropriate translations:
- English
- German
- Polish

## Set up the project
Start by adding your mapbox urls and access token in 
```
lib/common/environment/environment_dev.dart
```
and
```
lib/common/environment/environment_prod.dart
```

## Running the app
If you want to run the app using the terminal:
- Debug & Development
```
flutter run --flavor dev lib/main_dev.dart
```
- Release & Production
```
flutter run --release --flavor prod lib/main_prod.dart
```
    
## Running tests
Try to run the tests via your IDE. 

You can run flutter driver tests using the command:
```
flutter drive --flavor dev --target=test_driver/app.dart
```

## Potential areas of improvement
- Add logic for handling of when user rejects the location permission completely 
- Proper handling of when the user goes offline while in the app
- Make the bottom place description modal animated and dismissible
