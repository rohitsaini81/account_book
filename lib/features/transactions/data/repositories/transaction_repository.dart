import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:account_book/core/database/database.dart';
import 'package:account_book/shared/models/transaction_model.dart';

abstract class ITransactionRepository {
  Future<void> createTransaction(TransactionModel transaction);
  Future<void> updateTransaction(TransactionModel transaction);
  Future<void> deleteTransaction(int id);
  Future<TransactionModel?> getTransactionById(int id);
  Future<List<TransactionModel>> getAllTransactions();
  Future<List<TransactionModel>> getTransactionsByDateRange(
    DateTime startDate,
    DateTime endDate,
  );
  Future<List<TransactionModel>> getTransactionsByAccount(int accountId);
  Future<List<TransactionModel>> getTransactionsByCategory(int categoryId);
  Future<double> getTotalExpense(DateTime startDate, DateTime endDate);
  Future<double> getTotalIncome(DateTime startDate, DateTime endDate);
}

class TransactionRepository implements ITransactionRepository {
  final AppDatabase database;

  TransactionRepository({required this.database});

  @override
  Future<void> createTransaction(TransactionModel transaction) async {
    await database.into(database.transactions).insert(
          TransactionsCompanion(
            type: Value(transaction.type),
            amount: Value(transaction.amount),
            fromAccountId: Value(transaction.fromAccountId),
            toAccountId: Value(transaction.toAccountId),
            categoryId: Value(transaction.categoryId),
            description: Value(transaction.description),
            note: Value(transaction.note),
            date: Value(transaction.date),
            tags: Value(transaction.tags != null ? jsonEncode(transaction.tags) : null),
            isRecurring: Value(transaction.isRecurring),
            recurrenceRule: Value(transaction.recurrenceRule),
          ),
        );
  }

  @override
  Future<void> updateTransaction(TransactionModel transaction) async {
    await (database.update(database.transactions)
          ..where((t) => t.id.equals(transaction.id)))
        .write(
      TransactionsCompanion(
        type: Value(transaction.type),
        amount: Value(transaction.amount),
        fromAccountId: Value(transaction.fromAccountId),
        toAccountId: Value(transaction.toAccountId),
        categoryId: Value(transaction.categoryId),
        description: Value(transaction.description),
        note: Value(transaction.note),
        date: Value(transaction.date),
        tags: Value(transaction.tags != null ? jsonEncode(transaction.tags) : null),
        isRecurring: Value(transaction.isRecurring),
        recurrenceRule: Value(transaction.recurrenceRule),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<void> deleteTransaction(int id) async {
    await (database.delete(database.transactions)
          ..where((t) => t.id.equals(id)))
        .go();
  }

  @override
  Future<TransactionModel?> getTransactionById(int id) async {
    final transaction = await (database.select(database.transactions)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();

    return transaction == null ? null : _mapToModel(transaction);
  }

  @override
  Future<List<TransactionModel>> getAllTransactions() async {
    final transactions = await database.select(database.transactions).get();
    return transactions.map(_mapToModel).toList();
  }

  @override
  Future<List<TransactionModel>> getTransactionsByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final transactions = await database.getTransactions(
      startDate: startDate,
      endDate: endDate,
    );
    return transactions.map(_mapToModel).toList();
  }

  @override
  Future<List<TransactionModel>> getTransactionsByAccount(int accountId) async {
    final transactions = await database.getTransactions(accountId: accountId);
    return transactions.map(_mapToModel).toList();
  }

  @override
  Future<List<TransactionModel>> getTransactionsByCategory(int categoryId) async {
    final transactions = await database.getTransactions(categoryId: categoryId);
    return transactions.map(_mapToModel).toList();
  }

  @override
  Future<double> getTotalExpense(DateTime startDate, DateTime endDate) async {
    return await database.getTotalExpense(startDate, endDate);
  }

  @override
  Future<double> getTotalIncome(DateTime startDate, DateTime endDate) async {
    return await database.getTotalIncome(startDate, endDate);
  }

  TransactionModel _mapToModel(Transaction transaction) {
    return TransactionModel(
      id: transaction.id,
      type: transaction.type,
      amount: transaction.amount,
      fromAccountId: transaction.fromAccountId,
      toAccountId: transaction.toAccountId,
      categoryId: transaction.categoryId,
      description: transaction.description,
      note: transaction.note,
      date: transaction.date,
      tags: transaction.tags != null ? List<String>.from(jsonDecode(transaction.tags!)) : null,
      isRecurring: transaction.isRecurring,
      recurrenceRule: transaction.recurrenceRule,
      createdAt: transaction.createdAt,
      updatedAt: transaction.updatedAt,
    );
  }
}
