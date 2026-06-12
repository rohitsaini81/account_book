# Account Book - Personal Finance Management

A production-ready Flutter application for comprehensive account and expense management. Account Book provides a modern, intuitive interface for tracking income, expenses, budgets, and financial goals with powerful reporting and analysis features.

## Features

### 💼 Account Management
- Multiple account types (Cash, Bank, Wallet, Credit Card, Savings, Custom)
- Real-time balance tracking
- Account transfers
- Account icons and colors
- Multi-currency support

### 💳 Transaction Management
- Income, expense, and transfer transactions
- Categorized spending
- Tagging and notes
- Transaction search and filtering
- Bulk operations
- Recurring transactions
- Attachments (photos, documents)

### 📊 Categories
- Income and expense categories
- Hierarchical category structure
- Custom icons and colors
- Category-based filtering

### 💰 Budget Management
- Monthly and yearly budgets
- Category-specific budgets
- Budget alerts and notifications
- Overspending indicators
- Budget tracking dashboard

### 📈 Reports & Analytics
- Income/Expense reports
- Cash flow analysis
- Category-wise spending breakdown
- Account analysis
- Custom date ranges
- Charts and visualizations
- Export to PDF/CSV

### 🔒 Security
- PIN lock
- Biometric authentication (Fingerprint/Face)
- Auto-lock functionality
- Secure local storage

### ⚙️ Settings
- Theme customization (Light/Dark)
- Currency selection
- Number and date formatting
- Language preferences
- Backup & restore
- Local data export/import

## Tech Stack

- **Framework**: Flutter (Latest Stable)
- **Language**: Dart 3.12+
- **State Management**: Riverpod
- **Database**: Drift (SQLite)
- **Serialization**: Freezed, JSON Serializable
- **Routing**: GoRouter
- **Design**: Material 3
- **Architecture**: Clean Architecture with Feature-First approach

## Quick Start

### Prerequisites
- Flutter 3.12.0+
- Dart 3.12.0+

### Installation

```bash
# Clone the repository
git clone <repository-url>
cd account_book

# Get dependencies
flutter pub get

# Generate code
flutter pub run build_runner build

# Run the app
flutter run
```

## Project Structure

```
lib/
├── config/              # Configuration
│   ├── router/         # Navigation
│   └── theme/          # Theming
├── core/               # Core utilities
│   ├── database/       # Database setup
│   ├── di/             # Dependency injection
│   ├── extensions/     # Extension functions
│   └── utils/          # Utilities
├── features/           # Feature modules
│   ├── accounts/       # Account management
│   ├── transactions/   # Transaction management
│   ├── categories/     # Categories
│   ├── budgets/        # Budgets
│   ├── dashboard/      # Dashboard
│   ├── reports/        # Reports
│   ├── settings/       # Settings
│   └── search/         # Search
├── shared/             # Shared code
│   ├── models/         # Data models
│   ├── providers/      # Global providers
│   └── widgets/        # Shared widgets
└── main.dart          # App entry point
```

## Architecture

Account Book follows Clean Architecture principles with a feature-first organization:

- **Presentation Layer**: UI, screens, and state management
- **Domain Layer**: Business logic and use cases
- **Data Layer**: Repositories and data sources
- **Core Layer**: Shared utilities and database
- **Config Layer**: App configuration and theming

See [ARCHITECTURE.md](ARCHITECTURE.md) for detailed documentation.

## Database Schema

The app uses Drift with SQLite for local storage with the following main entities:

- **Accounts**: Store account information with balance tracking
- **Transactions**: Record income, expenses, and transfers
- **Categories**: Organize transactions into logical groups
- **Budgets**: Set spending limits and track against actuals
- **Attachments**: Store transaction-related files
- **Currencies**: Multi-currency support
- **Settings**: App configuration storage

## Development

### Code Generation

Several packages require code generation:

```bash
# One-time build
flutter pub run build_runner build

# Watch mode
flutter pub run build_runner watch
```

### Running Tests

```bash
# Unit and widget tests
flutter test

# Specific test file
flutter test test/features/accounts/...
```

### Code Quality

```bash
# Format code
dart format .

# Analyze code
flutter analyze

# Fix common issues
dart fix --apply
```

## Building for Release

### Android
```bash
flutter build apk --release
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

## Key Patterns

### Repository Pattern
All data access is abstracted behind repository interfaces with concrete implementations.

### Use Case Pattern
Business logic is encapsulated in use case classes for better testability.

### Immutable Models
All data models are immutable using Freezed for predictability and safety.

### Dependency Injection
Riverpod handles all dependency injection and state management.

## Contributing

Contributions are welcome! Please follow the project's code style and architecture patterns.

## Future Enhancements

- [ ] Cloud synchronization
- [ ] Advanced data analytics and predictions
- [ ] Smart expense categorization with ML
- [ ] Bill reminders and notifications
- [ ] Family/shared account management
- [ ] Investment tracking
- [ ] Tax reporting
- [ ] Advanced budgeting with savings goals

## License

This project is provided as-is. Feel free to use, modify, and distribute.

## Support

For setup instructions, see [SETUP_GUIDE.md](SETUP_GUIDE.md)

For architecture details, see [ARCHITECTURE.md](ARCHITECTURE.md)

---

**Made with ❤️ using Flutter**
