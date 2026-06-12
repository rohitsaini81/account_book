# First Run Checklist

Follow this checklist to get Account Book running on your machine.

## Prerequisites Check

- [ ] Flutter SDK installed (3.12.0+)
  ```bash
  flutter --version
  ```

- [ ] Dart SDK installed (3.12.0+)
  ```bash
  dart --version
  ```

- [ ] Android SDK/Emulator or iOS SDK/Simulator available
  ```bash
  flutter doctor
  ```

## Project Setup

- [ ] Navigate to project directory
  ```bash
  cd /path/to/account_book
  ```

- [ ] Clean previous builds
  ```bash
  flutter clean
  ```

- [ ] Get all dependencies
  ```bash
  flutter pub get
  ```

## Code Generation (CRITICAL)

⚠️ **This step must be completed before running the app**

- [ ] Run build_runner to generate code
  ```bash
  flutter pub run build_runner build
  ```

  This will generate:
  - Freezed models (*.freezed.dart)
  - JSON serialization (*.g.dart)
  - Drift database code (database.g.dart)

- [ ] Verify generated files exist
  ```bash
  # Check for generated files
  ls -la lib/shared/models/ | grep .freezed.dart
  ls -la lib/core/database/ | grep .g.dart
  ```

## Verification

- [ ] Run code analysis
  ```bash
  flutter analyze
  ```

- [ ] Check for any errors
  - Fix any errors reported by analysis

- [ ] Format code (optional)
  ```bash
  dart format .
  ```

## Run the App

### Option 1: Run on default device
```bash
flutter run
```

### Option 2: Run on specific platform

**Android**:
```bash
flutter run -d emulator-5554
```

**iOS**:
```bash
flutter run -d iPhone
```

**Web**:
```bash
flutter run -d chrome
```

## Troubleshooting

### If `flutter pub get` fails:
```bash
flutter pub cache repair
flutter pub get
```

### If code generation fails:
```bash
flutter pub run build_runner clean
flutter pub run build_runner build
```

### If you see "database.g.dart" not found:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### If Gradle fails (Android):
```bash
cd android
./gradlew clean
cd ..
flutter run
```

### If you see import errors:
1. Ensure code generation completed successfully
2. Run `flutter clean` and `flutter pub get` again
3. Check that all files in `lib/shared/models/*.dart` are present

## Post-Run Verification

After the app successfully runs, verify:

- [ ] App launches without crashes
- [ ] Home screen displays with bottom navigation
- [ ] Dashboard shows account list (will be empty initially)
- [ ] Can navigate between Dashboard, Transactions, Categories, Budgets, Reports
- [ ] Theme switches between light and dark modes

## Next Steps

1. **Add Test Account**:
   - Tap the "+" button on the home screen
   - Create a test account (e.g., "Cash")

2. **Add Test Transaction**:
   - Go to Transactions screen
   - Tap "+" to add a transaction

3. **Explore the App**:
   - Navigate through different sections
   - Test navigation

4. **Start Development**:
   - See [IMPLEMENTATION_STATUS.md](IMPLEMENTATION_STATUS.md) for next features to implement
   - See [SETUP_GUIDE.md](SETUP_GUIDE.md) for development tips

## Important Notes

- **Code Generation**: The app will not run without first running code generation
- **Database**: Creates SQLite database automatically on first run
- **Data Persistence**: All data is stored locally on the device
- **No Internet Required**: The app is fully offline-capable

## Common Issues & Solutions

| Issue | Solution |
|-------|----------|
| "Command 'pub' not found" | Reinstall Flutter |
| "Device not found" | Run `flutter devices` to list devices |
| "Build failed" | Run `flutter clean` then `flutter run` |
| "Generated files missing" | Run `flutter pub run build_runner build` |
| "Gradle failed" | Run `cd android && ./gradlew clean && cd ..` |
| "Module 'database' not found" | Verify code generation completed |

## Useful Commands

```bash
# Development with auto-reload
flutter run

# Development mode with specific device
flutter run -d [device-id]

# Release mode
flutter run --release

# Verbose output (for debugging)
flutter run -v

# Watch for changes and rebuild
flutter pub run build_runner watch

# Clean everything
flutter clean && flutter pub get && flutter pub run build_runner build

# Analyze code
flutter analyze

# Format code
dart format .

# Run tests
flutter test
```

## What to Expect

### First Launch
- App starts with splash/loading screen
- Initializes database automatically
- Displays home screen with empty dashboard

### Database
- Created at: `[documents_directory]/account_book.db`
- SQLite database
- Persists across app restarts
- Cleared only when app data is cleared

### Features Available
- ✅ Create accounts
- ✅ Add transactions
- ✅ View transaction list
- ✅ Switch between accounts, transactions, categories, budgets, reports tabs
- ✅ Dark/Light theme toggle
- 🟡 Other features (in development)

## Getting Help

1. Check [SETUP_GUIDE.md](SETUP_GUIDE.md) for detailed setup
2. Check [ARCHITECTURE.md](ARCHITECTURE.md) for architecture details
3. Check [IMPLEMENTATION_STATUS.md](IMPLEMENTATION_STATUS.md) for current status
4. Review error messages carefully
5. Check Flutter documentation: https://flutter.dev

## Success Indicators

You'll know everything is set up correctly when:

1. ✅ `flutter run` completes without errors
2. ✅ App appears on device/emulator
3. ✅ Dashboard screen displays
4. ✅ Bottom navigation works
5. ✅ No console errors or warnings
6. ✅ Can create accounts and transactions

---

**You're ready to start development!** 🚀

Check [IMPLEMENTATION_STATUS.md](IMPLEMENTATION_STATUS.md) for next steps and features to implement.
