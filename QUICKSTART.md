# Quick Start - 5 Minutes to Running App

## TL;DR - Just Run These Commands

```bash
cd /home/rohit/work/account_book
flutter clean
flutter pub get
flutter pub run build_runner build
flutter run
```

## What Happens

1. **flutter clean** - Clears old build files
2. **flutter pub get** - Downloads dependencies
3. **flutter pub run build_runner build** - Generates required code (CRITICAL!)
4. **flutter run** - Launches app on your device/emulator

## Expected Result

✅ App launches on your device/emulator
✅ Shows Account Book with empty dashboard
✅ Bottom navigation with 5 tabs works
✅ Can add accounts and transactions

## Troubleshooting

**"dart_tool not found"** → Run `flutter pub get` again

**"database.g.dart missing"** → Code generation didn't work, try:
```bash
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs
```

**"Build failed"** → Run:
```bash
flutter clean
flutter pub get
flutter pub run build_runner build
```

**Device not found** → Make sure emulator/device is running

## Next Steps

Once app is running:

1. **Add a test account** - Click + on home screen
2. **Add a transaction** - Go to Transactions tab and click +
3. **Explore the app** - Navigate between tabs
4. **Check dark mode** - System settings or device theme

## What's Working

✅ Database (SQLite with Drift)
✅ Account management
✅ Transaction list and add
✅ Navigation
✅ Theming (Light/Dark)
✅ Data persistence

## What's Not Yet

🟡 Reports & Charts
🟡 Budget tracking
🟡 Search
🟡 Export (PDF/CSV)
🟡 Advanced settings
🟡 Attachments

See IMPLEMENTATION_STATUS.md for details.

## Full Documentation

- **FIRST_RUN_CHECKLIST.md** - Detailed checklist
- **SETUP_GUIDE.md** - Development setup
- **ARCHITECTURE.md** - How code is organized
- **PROJECT_SUMMARY.md** - What's been built
- **README.md** - Features overview

## Files to Check First

After app runs:
1. `lib/main.dart` - App entry point
2. `lib/features/dashboard/presentation/screens/home_screen.dart` - Main screen
3. `lib/config/theme/app_theme.dart` - Theming
4. `lib/core/database/database.dart` - Database schema

---

**That's it! You're ready to go.** 🚀

If anything doesn't work, check TROUBLESHOOTING section above or SETUP_GUIDE.md for detailed help.
