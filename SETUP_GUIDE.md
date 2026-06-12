# Account Book - Setup Guide

## Prerequisites

- Flutter SDK (Latest stable version - 3.12.0 or higher)
- Dart SDK (3.12.0 or higher)
- Android SDK (for Android development)
- Xcode (for iOS development)
- Visual Studio Code or Android Studio (or any IDE with Flutter support)

## Installation

### 1. Clone/Setup the Project

```bash
cd /path/to/account_book
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Generate Code

The project uses several code generation packages. Run the following to generate all required code:

```bash
flutter pub run build_runner build
```

For continuous development with auto-regeneration:

```bash
flutter pub run build_runner watch
```

### 4. Run the App

#### Development Mode
```bash
flutter run
```

#### Release Mode
```bash
flutter run --release
```

#### Specific Platform
```bash
# iOS
flutter run -d iPhone
flutter run -t lib/main.dart

# Android
flutter run -d emulator-5554
flutter run -t lib/main.dart

# Web
flutter run -d chrome
```

## Project Structure

```
account_book/
├── lib/
│   ├── config/              # App configuration
│   │   ├── router/         # Navigation/routing
│   │   └── theme/          # Theme configuration
│   ├── core/               # Core functionality
│   │   ├── database/       # Drift database setup
│   │   ├── di/             # Dependency injection
│   │   ├── extensions/     # Dart extensions
│   │   └── utils/          # Utilities
│   ├── features/           # Feature modules
│   │   ├── accounts/       # Account management
│   │   ├── transactions/   # Transaction management
│   │   ├── categories/     # Category management
│   │   ├── budgets/        # Budget management
│   │   ├── dashboard/      # Main dashboard
│   │   ├── reports/        # Reports
│   │   ├── settings/       # Settings
│   │   └── search/         # Search functionality
│   ├── shared/             # Shared code
│   │   ├── models/         # Data models
│   │   ├── providers/      # Global providers
│   │   └── widgets/        # Shared widgets
│   └── main.dart           # App entry point
├── assets/                 # Images and fonts
├── test/                   # Tests
├── pubspec.yaml           # Dependencies
├── analysis_options.yaml  # Lint rules
├── ARCHITECTURE.md        # Architecture documentation
└── SETUP_GUIDE.md        # This file
```

## Key Commands

### Clean Build
```bash
flutter clean
flutter pub get
flutter pub run build_runner build
flutter run
```

### Format Code
```bash
dart format .
```

### Analyze Code
```bash
flutter analyze
```

### Run Tests
```bash
flutter test
```

### Build APK (Android)
```bash
flutter build apk --release
```

### Build iOS
```bash
flutter build ios --release
```

### Build Web
```bash
flutter build web --release
```

## Development Workflow

### 1. Feature Development
- Create feature in `lib/features/[feature]/`
- Implement presentation layer (screens, widgets, providers)
- Implement domain layer (use cases, entities)
- Implement data layer (repositories, models)

### 2. Database Changes
- Modify `lib/core/database/database.dart`
- Run `flutter pub run build_runner build`
- Update migrations if needed

### 3. Adding New Providers
- Add Riverpod providers in `lib/features/[feature]/presentation/providers/`
- Use `FutureProvider` for async data
- Use `StateNotifierProvider` for mutable state

### 4. Testing
- Write unit tests in `test/` directory
- Use Riverpod's testing utilities
- Mock repositories where needed

## Troubleshooting

### Build Issues

#### Gradle Issues
```bash
cd android
./gradlew clean
cd ..
flutter pub get
flutter run
```

#### Pub Get Issues
```bash
flutter pub cache repair
flutter pub get
```

### Code Generation Issues

#### Drift not generating
```bash
flutter clean
flutter pub get
flutter pub run build_runner clean
flutter pub run build_runner build
```

#### Freezed issues
Ensure models are properly annotated with `@freezed`

### Runtime Issues

#### Database locks
- Clear app data
- Uninstall and reinstall the app

#### State issues
- Clear app cache
- Restart Riverpod providers using `ref.refresh()`

## IDE Setup

### VS Code
Install extensions:
- Flutter
- Dart
- Drift (optional, for SQL highlighting)

### Android Studio
- Install Flutter plugin
- Install Dart plugin
- Enable code analysis

## Debugging

### Enable Debug Logging
```dart
// In main.dart
debugPrintBeginFrameBanner = true;
debugPrintEndFrameBanner = true;
```

### Use Riverpod DevTools
```bash
flutter pub global activate riverpod_cli
```

### Flutter DevTools
```bash
flutter pub global activate devtools
devtools
```

## Performance Optimization

### Widget Building
- Use `const` constructors
- Implement `==` and `hashCode` for models
- Use `RepaintBoundary` for expensive widgets

### State Management
- Use `select()` for partial rebuilds
- Dispose providers to free resources
- Use `autoDispose` for temporary providers

### Database
- Create indexes for frequent queries
- Use `StreamQuery` for realtime updates
- Batch operations when possible

## Building for Production

### Android
1. Create keystore
2. Update `android/app/build.gradle`
3. Build APK/AAB
```bash
flutter build appbundle --release
```

### iOS
1. Configure signing in Xcode
2. Build
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

## Deployment

### Google Play Store
- Build AAB
- Upload to Play Console
- Configure store listing
- Publish

### Apple App Store
- Build IPA
- Upload to App Store Connect
- Configure store listing
- Submit for review

### Microsoft Store (Windows)
- Follow Windows app requirements
- Build and package
- Submit to Store

## Additional Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Riverpod Documentation](https://riverpod.dev)
- [Drift Documentation](https://drift.simonbinder.eu)
- [Material Design 3](https://m3.material.io)
- [GoRouter Documentation](https://pub.dev/packages/go_router)

## Support

For issues or questions:
1. Check the [Flutter Documentation](https://flutter.dev)
2. Search [Stack Overflow](https://stackoverflow.com/questions/tagged/flutter)
3. Check package documentation on [pub.dev](https://pub.dev)
4. Open an issue on GitHub (if applicable)

## License

This project is provided as-is for educational and commercial use.
