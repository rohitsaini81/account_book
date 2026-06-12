import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:account_book/core/database/database.dart';
import 'package:account_book/core/database/database_provider.dart';
import 'package:account_book/features/accounts/data/repositories/account_repository.dart';
import 'package:account_book/shared/models/account_model.dart';

final accountRepositoryProvider = FutureProvider<IAccountRepository>((ref) async {
  final db = await ref.watch(databaseProvider.future);
  return AccountRepository(database: db);
});

final accountsProvider = FutureProvider<List<AccountModel>>((ref) async {
  final repository = await ref.watch(accountRepositoryProvider.future);
  return repository.getAllAccounts();
});

final totalBalanceProvider = FutureProvider<double>((ref) async {
  final repository = await ref.watch(accountRepositoryProvider.future);
  return repository.getTotalBalance();
});

final accountByIdProvider = FutureProvider.family<AccountModel?, int>((ref, id) async {
  final repository = await ref.watch(accountRepositoryProvider.future);
  return repository.getAccountById(id);
});

// Notifier for creating accounts
class CreateAccountNotifier extends StateNotifier<AsyncValue<void>> {
  final IAccountRepository repository;

  CreateAccountNotifier({required this.repository}) : super(const AsyncValue.data(null));

  Future<void> createAccount(AccountModel account) async {
    state = const AsyncValue.loading();
    try {
      await repository.createAccount(account);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final createAccountNotifierProvider =
    StateNotifierProvider.autoDispose<CreateAccountNotifier, AsyncValue<void>>((ref) {
  return ref.watch(accountRepositoryProvider).when(
    data: (repository) => CreateAccountNotifier(repository: repository),
    loading: () => CreateAccountNotifier(
      repository: _DummyRepository(),
    ),
    error: (e, st) => CreateAccountNotifier(
      repository: _DummyRepository(),
    ),
  );
});

// Notifier for updating accounts
class UpdateAccountNotifier extends StateNotifier<AsyncValue<void>> {
  final IAccountRepository repository;

  UpdateAccountNotifier({required this.repository}) : super(const AsyncValue.data(null));

  Future<void> updateAccount(AccountModel account) async {
    state = const AsyncValue.loading();
    try {
      await repository.updateAccount(account);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final updateAccountNotifierProvider =
    StateNotifierProvider.autoDispose<UpdateAccountNotifier, AsyncValue<void>>((ref) {
  return ref.watch(accountRepositoryProvider).when(
    data: (repository) => UpdateAccountNotifier(repository: repository),
    loading: () => UpdateAccountNotifier(
      repository: _DummyRepository(),
    ),
    error: (e, st) => UpdateAccountNotifier(
      repository: _DummyRepository(),
    ),
  );
});

// Notifier for deleting accounts
class DeleteAccountNotifier extends StateNotifier<AsyncValue<void>> {
  final IAccountRepository repository;

  DeleteAccountNotifier({required this.repository}) : super(const AsyncValue.data(null));

  Future<void> deleteAccount(int id) async {
    state = const AsyncValue.loading();
    try {
      await repository.deleteAccount(id);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final deleteAccountNotifierProvider =
    StateNotifierProvider.autoDispose<DeleteAccountNotifier, AsyncValue<void>>((ref) {
  return ref.watch(accountRepositoryProvider).when(
    data: (repository) => DeleteAccountNotifier(repository: repository),
    loading: () => DeleteAccountNotifier(
      repository: _DummyRepository(),
    ),
    error: (e, st) => DeleteAccountNotifier(
      repository: _DummyRepository(),
    ),
  );
});

class _DummyRepository implements IAccountRepository {
  @override
  Future<void> createAccount(AccountModel account) => throw UnimplementedError();

  @override
  Future<void> deleteAccount(int id) => throw UnimplementedError();

  @override
  Future<List<AccountModel>> getAllAccounts() => throw UnimplementedError();

  @override
  Future<AccountModel?> getAccountById(int id) => throw UnimplementedError();

  @override
  Future<double> getTotalBalance() => throw UnimplementedError();

  @override
  Future<void> transferBalance(int fromId, int toId, double amount) => throw UnimplementedError();

  @override
  Future<void> updateAccount(AccountModel account) => throw UnimplementedError();
}
