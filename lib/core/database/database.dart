import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

// Tables
@DataClassName('Account')
class Accounts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get type => text()(); // cash, bank, wallet, credit_card, savings, custom
  RealColumn get balance => real().withDefault(const Constant(0))();
  RealColumn get openingBalance => real().withDefault(const Constant(0))();
  TextColumn get color => text().withDefault(const Constant('#1F88DB'))();
  TextColumn get icon => text().withDefault(const Constant('account_balance_wallet'))();
  TextColumn get currency => text().withDefault(const Constant('USD'))();
  TextColumn get note => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

@DataClassName('Category')
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get type => text()(); // income, expense
  TextColumn get icon => text().withDefault(const Constant('category'))();
  TextColumn get color => text().withDefault(const Constant('#FF6B6B'))();
  IntColumn get parentId => integer().nullable().references(Categories, #id)();
  TextColumn get note => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

@DataClassName('Transaction')
class Transactions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => text()(); // income, expense, transfer
  RealColumn get amount => real()();
  IntColumn get fromAccountId => integer().references(Accounts, #id)();
  IntColumn get toAccountId => integer().nullable().references(Accounts, #id)();
  IntColumn get categoryId => integer().nullable().references(Categories, #id)();
  TextColumn get description => text().nullable()();
  TextColumn get note => text().nullable()();
  DateTimeColumn get date => dateTime()();
  TextColumn get tags => text().nullable()(); // JSON array stored as string
  BoolColumn get isRecurring => boolean().withDefault(const Constant(false))();
  TextColumn get recurrenceRule => text().nullable()(); // RRULE format
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

@DataClassName('Budget')
class Budgets extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get categoryId => integer().nullable().references(Categories, #id)();
  IntColumn get accountId => integer().nullable().references(Accounts, #id)();
  RealColumn get amount => real()();
  TextColumn get period => text().withDefault(const Constant('monthly'))(); // monthly, yearly
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  TextColumn get alert => text().nullable()(); // notification alert level
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

@DataClassName('Attachment')
class Attachments extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get transactionId => integer().references(Transactions, #id, onDelete: KeyAction.cascade)();
  TextColumn get filePath => text()();
  TextColumn get fileName => text()();
  TextColumn get mimeType => text()();
  IntColumn get fileSize => integer()();
  TextColumn get type => text()(); // image, document
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@DataClassName('Currency')
class Currencies extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get code => text().unique()();
  TextColumn get name => text()();
  TextColumn get symbol => text()();
  RealColumn get exchangeRate => real().withDefault(const Constant(1.0))();
  DateTimeColumn get lastUpdated => dateTime().nullable()();
}

@DataClassName('Tag')
class Tags extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique()();
  TextColumn get color => text().withDefault(const Constant('#808080'))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@DataClassName('NotificationLog')
class NotificationLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => text()(); // budget_alert, daily_reminder, backup_reminder
  IntColumn get relatedId => integer().nullable()(); // budget_id, etc
  TextColumn get title => text()();
  TextColumn get body => text()();
  BoolColumn get isRead => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@DataClassName('AppSettingData')
class AppSettings extends Table {
  TextColumn get key => text().unique()();
  TextColumn get value => text()();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

@DriftDatabase(
  tables: [
    Accounts,
    Categories,
    Transactions,
    Budgets,
    Attachments,
    Currencies,
    Tags,
    NotificationLogs,
    AppSettings,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) {
        return m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // Add migrations here as needed
      },
    );
  }

  // Query helpers
  Future<Account?> getAccountById(int id) {
    return (select(accounts)..where((a) => a.id.equals(id))).getSingleOrNull();
  }

  Future<List<Account>> getAllAccounts() {
    return select(accounts).get();
  }

  Future<List<Transaction>> getTransactions({
    DateTime? startDate,
    DateTime? endDate,
    int? accountId,
    int? categoryId,
  }) {
    var query = select(transactions);

    if (startDate != null) {
      query = query..where((t) => t.date.isBiggerOrEqualValue(startDate));
    }
    if (endDate != null) {
      query = query..where((t) => t.date.isSmallerOrEqualValue(endDate));
    }
    if (accountId != null) {
      query = query..where((t) => t.fromAccountId.equals(accountId));
    }
    if (categoryId != null) {
      query = query..where((t) => t.categoryId.equals(categoryId));
    }

    return query.get();
  }

  Future<List<Category>> getCategoriesByType(String type) {
    return (select(categories)..where((c) => c.type.equals(type))).get();
  }

  Future<double> getTotalBalance() async {
    final result = await (select(accounts).map((a) => a.balance)).get();
    return result.fold<double>(0, (sum, balance) => sum + balance);
  }

  Future<double> getTotalExpense(DateTime startDate, DateTime endDate) async {
    final expenses = await (select(transactions)
          ..where((t) => t.type.equals('expense'))
          ..where((t) => t.date.isBiggerOrEqualValue(startDate))
          ..where((t) => t.date.isSmallerOrEqualValue(endDate)))
        .get();

    return expenses.fold<double>(0, (sum, t) => sum + t.amount);
  }

  Future<double> getTotalIncome(DateTime startDate, DateTime endDate) async {
    final incomes = await (select(transactions)
          ..where((t) => t.type.equals('income'))
          ..where((t) => t.date.isBiggerOrEqualValue(startDate))
          ..where((t) => t.date.isSmallerOrEqualValue(endDate)))
        .get();

    return incomes.fold<double>(0, (sum, t) => sum + t.amount);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'account_book.db'));
    return NativeDatabase(file);
  });
}
