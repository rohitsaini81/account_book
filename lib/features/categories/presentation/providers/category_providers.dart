import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:account_book/core/database/database.dart';
import 'package:account_book/core/database/database_provider.dart';
import 'package:account_book/features/categories/data/repositories/category_repository.dart';
import 'package:account_book/shared/models/category_model.dart';

final categoryRepositoryProvider = FutureProvider<ICategoryRepository>((ref) async {
  final db = await ref.watch(databaseProvider.future);
  return CategoryRepository(database: db);
});

final categoriesProvider = FutureProvider<List<CategoryModel>>((ref) async {
  final repository = await ref.watch(categoryRepositoryProvider.future);
  return repository.getAllCategories();
});

final incomeCategoriesProvider = FutureProvider<List<CategoryModel>>((ref) async {
  final repository = await ref.watch(categoryRepositoryProvider.future);
  return repository.getCategoriesByType('income');
});

final expenseCategoriesProvider = FutureProvider<List<CategoryModel>>((ref) async {
  final repository = await ref.watch(categoryRepositoryProvider.future);
  return repository.getCategoriesByType('expense');
});

final categoryByIdProvider = FutureProvider.family<CategoryModel?, int>((ref, id) async {
  final repository = await ref.watch(categoryRepositoryProvider.future);
  return repository.getCategoryById(id);
});

class CreateCategoryNotifier extends StateNotifier<AsyncValue<void>> {
  final ICategoryRepository repository;

  CreateCategoryNotifier({required this.repository}) : super(const AsyncValue.data(null));

  Future<void> createCategory(CategoryModel category) async {
    state = const AsyncValue.loading();
    try {
      await repository.createCategory(category);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final createCategoryNotifierProvider =
    StateNotifierProvider.autoDispose<CreateCategoryNotifier, AsyncValue<void>>((ref) {
  return ref.watch(categoryRepositoryProvider).when(
    data: (repository) => CreateCategoryNotifier(repository: repository),
    loading: () => CreateCategoryNotifier(repository: _DummyRepository()),
    error: (e, st) => CreateCategoryNotifier(repository: _DummyRepository()),
  );
});

class UpdateCategoryNotifier extends StateNotifier<AsyncValue<void>> {
  final ICategoryRepository repository;

  UpdateCategoryNotifier({required this.repository}) : super(const AsyncValue.data(null));

  Future<void> updateCategory(CategoryModel category) async {
    state = const AsyncValue.loading();
    try {
      await repository.updateCategory(category);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final updateCategoryNotifierProvider =
    StateNotifierProvider.autoDispose<UpdateCategoryNotifier, AsyncValue<void>>((ref) {
  return ref.watch(categoryRepositoryProvider).when(
    data: (repository) => UpdateCategoryNotifier(repository: repository),
    loading: () => UpdateCategoryNotifier(repository: _DummyRepository()),
    error: (e, st) => UpdateCategoryNotifier(repository: _DummyRepository()),
  );
});

class DeleteCategoryNotifier extends StateNotifier<AsyncValue<void>> {
  final ICategoryRepository repository;

  DeleteCategoryNotifier({required this.repository}) : super(const AsyncValue.data(null));

  Future<void> deleteCategory(int id) async {
    state = const AsyncValue.loading();
    try {
      await repository.deleteCategory(id);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final deleteCategoryNotifierProvider =
    StateNotifierProvider.autoDispose<DeleteCategoryNotifier, AsyncValue<void>>((ref) {
  return ref.watch(categoryRepositoryProvider).when(
    data: (repository) => DeleteCategoryNotifier(repository: repository),
    loading: () => DeleteCategoryNotifier(repository: _DummyRepository()),
    error: (e, st) => DeleteCategoryNotifier(repository: _DummyRepository()),
  );
});

class _DummyRepository implements ICategoryRepository {
  @override
  Future<void> createCategory(CategoryModel category) => throw UnimplementedError();

  @override
  Future<void> deleteCategory(int id) => throw UnimplementedError();

  @override
  Future<void> updateCategory(CategoryModel category) => throw UnimplementedError();

  @override
  Future<CategoryModel?> getCategoryById(int id) => throw UnimplementedError();

  @override
  Future<List<CategoryModel>> getAllCategories() => throw UnimplementedError();

  @override
  Future<List<CategoryModel>> getCategoriesByType(String type) => throw UnimplementedError();
}
