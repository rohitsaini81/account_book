import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:account_book/core/database/database.dart';
import 'package:account_book/core/database/database_provider.dart';
import 'package:account_book/features/transactions/data/repositories/transaction_repository.dart';
import 'package:account_book/shared/models/transaction_model.dart';

final transactionRepositoryProvider = FutureProvider<ITransactionRepository>((ref) async {
  final db = await ref.watch(databaseProvider.future);
  return TransactionRepository(database: db);
});

final transactionsProvider = FutureProvider<List<TransactionModel>>((ref) async {
  final repository = await ref.watch(transactionRepositoryProvider.future);
  return repository.getAllTransactions();
});

final transactionByIdProvider = FutureProvider.family<TransactionModel?, int>((ref, id) async {
  final repository = await ref.watch(transactionRepositoryProvider.future);
  return repository.getTransactionById(id);
});

final transactionsByAccountProvider =
    FutureProvider.family<List<TransactionModel>, int>((ref, accountId) async {
  final repository = await ref.watch(transactionRepositoryProvider.future);
  return repository.getTransactionsByAccount(accountId);
});

final transactionsByDateRangeProvider =
    FutureProvider.family<List<TransactionModel>, (DateTime, DateTime)>((ref, dates) async {
  final repository = await ref.watch(transactionRepositoryProvider.future);
  return repository.getTransactionsByDateRange(dates.$1, dates.$2);
});

final totalExpenseProvider =
    FutureProvider.family<double, (DateTime, DateTime)>((ref, dates) async {
  final repository = await ref.watch(transactionRepositoryProvider.future);
  return repository.getTotalExpense(dates.$1, dates.$2);
});

final totalIncomeProvider =
    FutureProvider.family<double, (DateTime, DateTime)>((ref, dates) async {
  final repository = await ref.watch(transactionRepositoryProvider.future);
  return repository.getTotalIncome(dates.$1, dates.$2);
});

class CreateTransactionNotifier extends StateNotifier<AsyncValue<void>> {
  final ITransactionRepository repository;

  CreateTransactionNotifier({required this.repository}) : super(const AsyncValue.data(null));

  Future<void> createTransaction(TransactionModel transaction) async {
    state = const AsyncValue.loading();
    try {
      await repository.createTransaction(transaction);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final createTransactionNotifierProvider =
    StateNotifierProvider.autoDispose<CreateTransactionNotifier, AsyncValue<void>>((ref) {
  return ref.watch(transactionRepositoryProvider).when(
    data: (repository) => CreateTransactionNotifier(repository: repository),
    loading: () => CreateTransactionNotifier(repository: _DummyRepository()),
    error: (e, st) => CreateTransactionNotifier(repository: _DummyRepository()),
  );
});

class UpdateTransactionNotifier extends StateNotifier<AsyncValue<void>> {
  final ITransactionRepository repository;

  UpdateTransactionNotifier({required this.repository}) : super(const AsyncValue.data(null));

  Future<void> updateTransaction(TransactionModel transaction) async {
    state = const AsyncValue.loading();
    try {
      await repository.updateTransaction(transaction);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final updateTransactionNotifierProvider =
    StateNotifierProvider.autoDispose<UpdateTransactionNotifier, AsyncValue<void>>((ref) {
  return ref.watch(transactionRepositoryProvider).when(
    data: (repository) => UpdateTransactionNotifier(repository: repository),
    loading: () => UpdateTransactionNotifier(repository: _DummyRepository()),
    error: (e, st) => UpdateTransactionNotifier(repository: _DummyRepository()),
  );
});

class DeleteTransactionNotifier extends StateNotifier<AsyncValue<void>> {
  final ITransactionRepository repository;

  DeleteTransactionNotifier({required this.repository}) : super(const AsyncValue.data(null));

  Future<void> deleteTransaction(int id) async {
    state = const AsyncValue.loading();
    try {
      await repository.deleteTransaction(id);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final deleteTransactionNotifierProvider =
    StateNotifierProvider.autoDispose<DeleteTransactionNotifier, AsyncValue<void>>((ref) {
  return ref.watch(transactionRepositoryProvider).when(
    data: (repository) => DeleteTransactionNotifier(repository: repository),
    loading: () => DeleteTransactionNotifier(repository: _DummyRepository()),
    error: (e, st) => DeleteTransactionNotifier(repository: _DummyRepository()),
  );
});

class _DummyRepository implements ITransactionRepository {
  @override
  Future<void> createTransaction(TransactionModel transaction) => throw UnimplementedError();

  @override
  Future<void> deleteTransaction(int id) => throw UnimplementedError();

  @override
  Future<void> updateTransaction(TransactionModel transaction) => throw UnimplementedError();

  @override
  Future<TransactionModel?> getTransactionById(int id) => throw UnimplementedError();

  @override
  Future<List<TransactionModel>> getAllTransactions() => throw UnimplementedError();

  @override
  Future<List<TransactionModel>> getTransactionsByDateRange(DateTime startDate, DateTime endDate) =>
      throw UnimplementedError();

  @override
  Future<List<TransactionModel>> getTransactionsByAccount(int accountId) => throw UnimplementedError();

  @override
  Future<List<TransactionModel>> getTransactionsByCategory(int categoryId) => throw UnimplementedError();

  @override
  Future<double> getTotalExpense(DateTime startDate, DateTime endDate) => throw UnimplementedError();

  @override
  Future<double> getTotalIncome(DateTime startDate, DateTime endDate) => throw UnimplementedError();
}
