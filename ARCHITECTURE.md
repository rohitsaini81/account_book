# Account Book - Architecture Documentation

## Overview

Account Book is a production-ready Flutter accounting and expense management application built with a clean architecture approach using feature-first organization and Riverpod for state management.

## Architecture Layers

### 1. **Presentation Layer**
- **Location**: `lib/features/[feature]/presentation/`
- **Responsibility**: UI components, screens, widgets, and state management integration
- **Components**:
  - `screens/` - Full screen widgets
  - `widgets/` - Reusable UI components
  - `providers/` - Riverpod providers for state management

### 2. **Domain Layer**
- **Location**: `lib/features/[feature]/domain/`
- **Responsibility**: Business logic, entities, and use cases
- **Components**:
  - `usecases/` - Business logic encapsulation
  - `entities/` - Domain models (different from DTO models)

### 3. **Data Layer**
- **Location**: `lib/features/[feature]/data/`
- **Responsibility**: Data access, repositories, and data sources
- **Components**:
  - `repositories/` - Repository implementations
  - `datasources/` - Local and remote data access

### 4. **Core Layer**
- **Location**: `lib/core/`
- **Responsibility**: Shared utilities, database, DI, and extensions
- **Components**:
  - `database/` - Drift database definitions and providers
  - `di/` - Dependency injection setup
  - `extensions/` - Utility extensions
  - `utils/` - Helper functions

### 5. **Shared Layer**
- **Location**: `lib/shared/`
- **Responsibility**: Shared models, widgets, and providers
- **Components**:
  - `models/` - Shared data models (Freezed)
  - `widgets/` - Global UI components
  - `providers/` - Global Riverpod providers

### 6. **Config Layer**
- **Location**: `lib/config/`
- **Responsibility**: App-wide configuration
- **Components**:
  - `router/` - GoRouter navigation setup
  - `theme/` - Material 3 theming

## Technology Stack

### State Management
- **Riverpod**: Reactive state management
  - `FutureProvider`: For async operations
  - `StateNotifierProvider`: For mutable state
  - `Provider`: For simple computed values

### Database
- **Drift (SQLite)**: Type-safe SQL ORM
  - Auto-generated code
  - Type-safe queries
  - Migration support

### Serialization
- **Freezed**: Immutable data classes
- **JSON Serializable**: JSON serialization

### Routing
- **GoRouter**: Declarative routing with deep linking support

### UI Framework
- **Flutter Material 3**: Modern material design

## Key Patterns

### 1. **Repository Pattern**
All data access is abstracted behind repository interfaces. Concrete implementations handle database/API interactions.

```dart
abstract class IAccountRepository {
  Future<void> createAccount(AccountModel account);
  Future<List<AccountModel>> getAllAccounts();
  // ...
}

class AccountRepository implements IAccountRepository {
  // Implementation
}
```

### 2. **Use Case Pattern**
Business logic is encapsulated in use case classes that can be tested independently.

```dart
class CreateAccountUsecase {
  final IAccountRepository repository;
  
  Future<void> call(AccountModel account) async {
    // Validation and business logic
  }
}
```

### 3. **Immutable Models**
All data models are immutable using Freezed for safety and predictability.

```dart
@freezed
class AccountModel with _$AccountModel {
  const factory AccountModel({
    required int id,
    required String name,
    // ...
  }) = _AccountModel;
}
```

### 4. **Feature-First Organization**
Each feature is self-contained with its own presentation, domain, and data layers.

```
lib/features/
├── accounts/
│   ├── presentation/
│   ├── domain/
│   └── data/
├── transactions/
│   ├── presentation/
│   ├── domain/
│   └── data/
```

## Database Schema

### Tables

#### Accounts
- **id** (PK)
- **name** (TEXT)
- **type** (cash, bank, wallet, credit_card, savings, custom)
- **balance** (REAL)
- **openingBalance** (REAL)
- **color** (HEX code)
- **icon** (icon name)
- **currency** (ISO code)
- **note** (TEXT, nullable)
- **createdAt** (DATETIME)
- **updatedAt** (DATETIME)

#### Transactions
- **id** (PK)
- **type** (income, expense, transfer)
- **amount** (REAL)
- **fromAccountId** (FK -> Accounts)
- **toAccountId** (FK -> Accounts, nullable)
- **categoryId** (FK -> Categories, nullable)
- **description** (TEXT, nullable)
- **note** (TEXT, nullable)
- **date** (DATETIME)
- **tags** (JSON array as TEXT)
- **isRecurring** (BOOL)
- **recurrenceRule** (TEXT, nullable)
- **createdAt** (DATETIME)
- **updatedAt** (DATETIME)

#### Categories
- **id** (PK)
- **name** (TEXT)
- **type** (income, expense)
- **icon** (icon name)
- **color** (HEX code)
- **parentId** (FK -> Categories, nullable)
- **note** (TEXT, nullable)
- **createdAt** (DATETIME)
- **updatedAt** (DATETIME)

#### Budgets
- **id** (PK)
- **categoryId** (FK -> Categories, nullable)
- **accountId** (FK -> Accounts, nullable)
- **amount** (REAL)
- **period** (monthly, yearly)
- **startDate** (DATETIME)
- **endDate** (DATETIME, nullable)
- **isActive** (BOOL)
- **alert** (TEXT, nullable)
- **createdAt** (DATETIME)
- **updatedAt** (DATETIME)

#### Attachments
- **id** (PK)
- **transactionId** (FK -> Transactions)
- **filePath** (TEXT)
- **fileName** (TEXT)
- **mimeType** (TEXT)
- **fileSize** (INT)
- **type** (image, document)
- **createdAt** (DATETIME)

#### Currencies
- **id** (PK)
- **code** (TEXT, UNIQUE)
- **name** (TEXT)
- **symbol** (TEXT)
- **exchangeRate** (REAL)
- **lastUpdated** (DATETIME, nullable)

#### Tags
- **id** (PK)
- **name** (TEXT, UNIQUE)
- **color** (HEX code)
- **createdAt** (DATETIME)

#### NotificationLogs
- **id** (PK)
- **type** (budget_alert, daily_reminder, backup_reminder)
- **relatedId** (INT, nullable)
- **title** (TEXT)
- **body** (TEXT)
- **isRead** (BOOL)
- **createdAt** (DATETIME)

#### AppSettings
- **key** (TEXT, UNIQUE)
- **value** (TEXT)
- **updatedAt** (DATETIME)

## Riverpod Provider Structure

### Database Provider
```dart
final databaseProvider = FutureProvider<AppDatabase>((ref) async {
  return AppDatabase();
});
```

### Repository Providers
```dart
final accountRepositoryProvider = FutureProvider<IAccountRepository>((ref) async {
  final db = await ref.watch(databaseProvider.future);
  return AccountRepository(database: db);
});
```

### Data Providers
```dart
final accountsProvider = FutureProvider<List<AccountModel>>((ref) async {
  final repository = await ref.watch(accountRepositoryProvider.future);
  return repository.getAllAccounts();
});
```

### State Notifiers
```dart
final createAccountNotifierProvider =
    StateNotifierProvider.autoDispose<CreateAccountNotifier, AsyncValue<void>>((ref) {
  return ref.watch(accountRepositoryProvider).when(
    data: (repository) => CreateAccountNotifier(repository: repository),
    loading: () => CreateAccountNotifier(repository: _DummyRepository()),
    error: (e, st) => CreateAccountNotifier(repository: _DummyRepository()),
  );
});
```

## Theme System

Material 3 theme is defined in `lib/config/theme/app_theme.dart` with:
- Light theme
- Dark theme
- Custom color scheme
- Typography styles
- Component styles (AppBar, Card, Button, etc.)

## Routing Structure

GoRouter is configured in `lib/config/router/app_router.dart` with:
- Root route: `/` (HomeScreen)
- Nested routes for each feature
- Deep linking support
- Error handling

## Extension Functions

Located in `lib/core/extensions/`:
- **DateTimeExtensions**: Date manipulation (startOfDay, isToday, etc.)
- **NumberExtensions**: Currency formatting, number manipulation
- **StringExtensions**: String utilities (capitalize, truncate, etc.)

## Error Handling

- Repository methods throw `ArgumentError` for validation failures
- Riverpod's `AsyncValue` handles loading/error states
- UI displays appropriate error messages and empty states

## Future Enhancements

1. **Advanced Reporting**: PDF generation, chart visualization
2. **Backup & Restore**: Cloud and local backup options
3. **Multi-Currency**: Real-time exchange rates
4. **Recurring Transactions**: Automatic transaction generation
5. **Budgeting**: Smart alerts and spending recommendations
6. **Attachments**: Photo/document storage for transactions
7. **Search**: Full-text search across transactions
8. **Analytics**: Spending trends and insights
9. **Security**: Biometric lock, PIN protection
10. **Sync**: Cloud synchronization

## Testing Strategy

### Unit Tests
- Test repositories in isolation
- Test use cases with mocked repositories
- Test utility functions

### Widget Tests
- Test individual screens
- Test form validation
- Test navigation

### Integration Tests
- Test complete user flows
- Test database operations
- Test Riverpod provider chain

## Code Generation

Several packages require code generation:

```bash
# Generate all required code
flutter pub run build_runner build

# Watch mode for development
flutter pub run build_runner watch
```

Generated files:
- `*.freezed.dart` - Freezed immutable classes
- `*.g.dart` - JSON serialization
- `database.g.dart` - Drift database code
