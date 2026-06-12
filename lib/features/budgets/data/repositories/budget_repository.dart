import 'package:drift/drift.dart';
import 'package:account_book/core/database/database.dart';
import 'package:account_book/shared/models/budget_model.dart';

abstract class IBudgetRepository {
  Future<void> createBudget(BudgetModel budget);
  Future<void> updateBudget(BudgetModel budget);
  Future<void> deleteBudget(int id);
  Future<BudgetModel?> getBudgetById(int id);
  Future<List<BudgetModel>> getAllBudgets();
  Future<List<BudgetModel>> getActiveBudgets();
  Future<List<BudgetModel>> getBudgetsByCategory(int categoryId);
}

class BudgetRepository implements IBudgetRepository {
  final AppDatabase database;

  BudgetRepository({required this.database});

  @override
  Future<void> createBudget(BudgetModel budget) async {
    await database.into(database.budgets).insert(
          BudgetsCompanion(
            categoryId: Value(budget.categoryId),
            accountId: Value(budget.accountId),
            amount: Value(budget.amount),
            period: Value(budget.period),
            startDate: Value(budget.startDate),
            endDate: Value(budget.endDate),
            isActive: Value(budget.isActive),
            alert: Value(budget.alert),
          ),
        );
  }

  @override
  Future<void> updateBudget(BudgetModel budget) async {
    await (database.update(database.budgets)
          ..where((b) => b.id.equals(budget.id)))
        .write(
      BudgetsCompanion(
        categoryId: Value(budget.categoryId),
        accountId: Value(budget.accountId),
        amount: Value(budget.amount),
        period: Value(budget.period),
        startDate: Value(budget.startDate),
        endDate: Value(budget.endDate),
        isActive: Value(budget.isActive),
        alert: Value(budget.alert),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<void> deleteBudget(int id) async {
    await (database.delete(database.budgets)
          ..where((b) => b.id.equals(id)))
        .go();
  }

  @override
  Future<BudgetModel?> getBudgetById(int id) async {
    final budget = await (database.select(database.budgets)
          ..where((b) => b.id.equals(id)))
        .getSingleOrNull();

    return budget == null ? null : _mapToModel(budget);
  }

  @override
  Future<List<BudgetModel>> getAllBudgets() async {
    final budgets = await database.select(database.budgets).get();
    return budgets.map(_mapToModel).toList();
  }

  @override
  Future<List<BudgetModel>> getActiveBudgets() async {
    final budgets = await (database.select(database.budgets)
          ..where((b) => b.isActive.equals(true)))
        .get();
    return budgets.map(_mapToModel).toList();
  }

  @override
  Future<List<BudgetModel>> getBudgetsByCategory(int categoryId) async {
    final budgets = await (database.select(database.budgets)
          ..where((b) => b.categoryId.equals(categoryId)))
        .get();
    return budgets.map(_mapToModel).toList();
  }

  BudgetModel _mapToModel(Budget budget) {
    return BudgetModel(
      id: budget.id,
      categoryId: budget.categoryId,
      accountId: budget.accountId,
      amount: budget.amount,
      period: budget.period,
      startDate: budget.startDate,
      endDate: budget.endDate,
      isActive: budget.isActive,
      alert: budget.alert,
      createdAt: budget.createdAt,
      updatedAt: budget.updatedAt,
    );
  }
}
