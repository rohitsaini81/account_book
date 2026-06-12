import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:account_book/core/database/database.dart';
import 'package:account_book/core/database/database_provider.dart';
import 'package:account_book/features/budgets/data/repositories/budget_repository.dart';
import 'package:account_book/shared/models/budget_model.dart';

final budgetRepositoryProvider = FutureProvider<IBudgetRepository>((ref) async {
  final db = await ref.watch(databaseProvider.future);
  return BudgetRepository(database: db);
});

final budgetsProvider = FutureProvider<List<BudgetModel>>((ref) async {
  final repository = await ref.watch(budgetRepositoryProvider.future);
  return repository.getAllBudgets();
});

final activeBudgetsProvider = FutureProvider<List<BudgetModel>>((ref) async {
  final repository = await ref.watch(budgetRepositoryProvider.future);
  return repository.getActiveBudgets();
});

final budgetByIdProvider = FutureProvider.family<BudgetModel?, int>((ref, id) async {
  final repository = await ref.watch(budgetRepositoryProvider.future);
  return repository.getBudgetById(id);
});

final budgetsByCategoryProvider =
    FutureProvider.family<List<BudgetModel>, int>((ref, categoryId) async {
  final repository = await ref.watch(budgetRepositoryProvider.future);
  return repository.getBudgetsByCategory(categoryId);
});

class CreateBudgetNotifier extends StateNotifier<AsyncValue<void>> {
  final IBudgetRepository repository;

  CreateBudgetNotifier({required this.repository}) : super(const AsyncValue.data(null));

  Future<void> createBudget(BudgetModel budget) async {
    state = const AsyncValue.loading();
    try {
      await repository.createBudget(budget);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final createBudgetNotifierProvider =
    StateNotifierProvider.autoDispose<CreateBudgetNotifier, AsyncValue<void>>((ref) {
  return ref.watch(budgetRepositoryProvider).when(
    data: (repository) => CreateBudgetNotifier(repository: repository),
    loading: () => CreateBudgetNotifier(repository: _DummyRepository()),
    error: (e, st) => CreateBudgetNotifier(repository: _DummyRepository()),
  );
});

class UpdateBudgetNotifier extends StateNotifier<AsyncValue<void>> {
  final IBudgetRepository repository;

  UpdateBudgetNotifier({required this.repository}) : super(const AsyncValue.data(null));

  Future<void> updateBudget(BudgetModel budget) async {
    state = const AsyncValue.loading();
    try {
      await repository.updateBudget(budget);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final updateBudgetNotifierProvider =
    StateNotifierProvider.autoDispose<UpdateBudgetNotifier, AsyncValue<void>>((ref) {
  return ref.watch(budgetRepositoryProvider).when(
    data: (repository) => UpdateBudgetNotifier(repository: repository),
    loading: () => UpdateBudgetNotifier(repository: _DummyRepository()),
    error: (e, st) => UpdateBudgetNotifier(repository: _DummyRepository()),
  );
});

class DeleteBudgetNotifier extends StateNotifier<AsyncValue<void>> {
  final IBudgetRepository repository;

  DeleteBudgetNotifier({required this.repository}) : super(const AsyncValue.data(null));

  Future<void> deleteBudget(int id) async {
    state = const AsyncValue.loading();
    try {
      await repository.deleteBudget(id);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final deleteBudgetNotifierProvider =
    StateNotifierProvider.autoDispose<DeleteBudgetNotifier, AsyncValue<void>>((ref) {
  return ref.watch(budgetRepositoryProvider).when(
    data: (repository) => DeleteBudgetNotifier(repository: repository),
    loading: () => DeleteBudgetNotifier(repository: _DummyRepository()),
    error: (e, st) => DeleteBudgetNotifier(repository: _DummyRepository()),
  );
});

class _DummyRepository implements IBudgetRepository {
  @override
  Future<void> createBudget(BudgetModel budget) => throw UnimplementedError();

  @override
  Future<void> deleteBudget(int id) => throw UnimplementedError();

  @override
  Future<void> updateBudget(BudgetModel budget) => throw UnimplementedError();

  @override
  Future<BudgetModel?> getBudgetById(int id) => throw UnimplementedError();

  @override
  Future<List<BudgetModel>> getAllBudgets() => throw UnimplementedError();

  @override
  Future<List<BudgetModel>> getActiveBudgets() => throw UnimplementedError();

  @override
  Future<List<BudgetModel>> getBudgetsByCategory(int categoryId) => throw UnimplementedError();
}
