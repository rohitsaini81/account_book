import 'package:drift/drift.dart';
import 'package:account_book/core/database/database.dart';
import 'package:account_book/shared/models/category_model.dart';

abstract class ICategoryRepository {
  Future<void> createCategory(CategoryModel category);
  Future<void> updateCategory(CategoryModel category);
  Future<void> deleteCategory(int id);
  Future<CategoryModel?> getCategoryById(int id);
  Future<List<CategoryModel>> getAllCategories();
  Future<List<CategoryModel>> getCategoriesByType(String type);
}

class CategoryRepository implements ICategoryRepository {
  final AppDatabase database;

  CategoryRepository({required this.database});

  @override
  Future<void> createCategory(CategoryModel category) async {
    await database.into(database.categories).insert(
          CategoriesCompanion(
            name: Value(category.name),
            type: Value(category.type),
            icon: Value(category.icon),
            color: Value(category.color),
            parentId: Value(category.parentId),
            note: Value(category.note),
          ),
        );
  }

  @override
  Future<void> updateCategory(CategoryModel category) async {
    await (database.update(database.categories)
          ..where((c) => c.id.equals(category.id)))
        .write(
      CategoriesCompanion(
        name: Value(category.name),
        type: Value(category.type),
        icon: Value(category.icon),
        color: Value(category.color),
        parentId: Value(category.parentId),
        note: Value(category.note),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<void> deleteCategory(int id) async {
    await (database.delete(database.categories)
          ..where((c) => c.id.equals(id)))
        .go();
  }

  @override
  Future<CategoryModel?> getCategoryById(int id) async {
    final category = await (database.select(database.categories)
          ..where((c) => c.id.equals(id)))
        .getSingleOrNull();

    return category == null ? null : _mapToModel(category);
  }

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    final categories = await database.select(database.categories).get();
    return categories.map(_mapToModel).toList();
  }

  @override
  Future<List<CategoryModel>> getCategoriesByType(String type) async {
    final categories = await database.getCategoriesByType(type);
    return categories.map(_mapToModel).toList();
  }

  CategoryModel _mapToModel(Category category) {
    return CategoryModel(
      id: category.id,
      name: category.name,
      type: category.type,
      icon: category.icon,
      color: category.color,
      parentId: category.parentId,
      note: category.note,
      createdAt: category.createdAt,
      updatedAt: category.updatedAt,
    );
  }
}
