import 'package:drift/drift.dart';
import 'package:account_book/core/database/database.dart';
import 'package:account_book/shared/models/account_model.dart';

abstract class IAccountRepository {
  Future<void> createAccount(AccountModel account);
  Future<void> updateAccount(AccountModel account);
  Future<void> deleteAccount(int id);
  Future<AccountModel?> getAccountById(int id);
  Future<List<AccountModel>> getAllAccounts();
  Future<double> getTotalBalance();
  Future<void> transferBalance(int fromId, int toId, double amount);
}

class AccountRepository implements IAccountRepository {
  final AppDatabase database;

  AccountRepository({required this.database});

  @override
  Future<void> createAccount(AccountModel account) async {
    await database.into(database.accounts).insert(
          AccountsCompanion(
            name: Value(account.name),
            type: Value(account.type),
            balance: Value(account.balance),
            openingBalance: Value(account.openingBalance),
            color: Value(account.color),
            icon: Value(account.icon),
            currency: Value(account.currency),
            note: Value(account.note),
          ),
        );
  }

  @override
  Future<void> updateAccount(AccountModel account) async {
    await (database.update(database.accounts)
          ..where((a) => a.id.equals(account.id)))
        .write(
      AccountsCompanion(
        name: Value(account.name),
        type: Value(account.type),
        balance: Value(account.balance),
        color: Value(account.color),
        icon: Value(account.icon),
        note: Value(account.note),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<void> deleteAccount(int id) async {
    await (database.delete(database.accounts)
          ..where((a) => a.id.equals(id)))
        .go();
  }

  @override
  Future<AccountModel?> getAccountById(int id) async {
    final account = await database.getAccountById(id);
    return account == null
        ? null
        : AccountModel(
            id: account.id,
            name: account.name,
            type: account.type,
            balance: account.balance,
            openingBalance: account.openingBalance,
            color: account.color,
            icon: account.icon,
            currency: account.currency,
            note: account.note,
            createdAt: account.createdAt,
            updatedAt: account.updatedAt,
          );
  }

  @override
  Future<List<AccountModel>> getAllAccounts() async {
    final accounts = await database.getAllAccounts();
    return accounts
        .map((a) => AccountModel(
              id: a.id,
              name: a.name,
              type: a.type,
              balance: a.balance,
              openingBalance: a.openingBalance,
              color: a.color,
              icon: a.icon,
              currency: a.currency,
              note: a.note,
              createdAt: a.createdAt,
              updatedAt: a.updatedAt,
            ))
        .toList();
  }

  @override
  Future<double> getTotalBalance() async {
    return await database.getTotalBalance();
  }

  @override
  Future<void> transferBalance(int fromId, int toId, double amount) async {
    final fromAccount = await database.getAccountById(fromId);
    final toAccount = await database.getAccountById(toId);

    if (fromAccount != null && toAccount != null) {
      await (database.update(database.accounts)
            ..where((a) => a.id.equals(fromId)))
          .write(
        AccountsCompanion(
          balance: Value(fromAccount.balance - amount),
          updatedAt: Value(DateTime.now()),
        ),
      );

      await (database.update(database.accounts)
            ..where((a) => a.id.equals(toId)))
          .write(
        AccountsCompanion(
          balance: Value(toAccount.balance + amount),
          updatedAt: Value(DateTime.now()),
        ),
      );
    }
  }
}
