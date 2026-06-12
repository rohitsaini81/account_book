import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:account_book/shared/models/transaction_model.dart';
import 'package:account_book/features/transactions/presentation/providers/transaction_providers.dart';
import 'package:account_book/features/accounts/presentation/providers/account_providers.dart';
import 'package:account_book/features/categories/presentation/providers/category_providers.dart';

class AddTransactionScreen extends ConsumerStatefulWidget {
  const AddTransactionScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends ConsumerState<AddTransactionScreen> {
  late final TextEditingController amountController;
  late final TextEditingController descriptionController;
  late final TextEditingController noteController;

  String selectedType = 'expense';
  int? selectedAccountId;
  int? selectedCategoryId;
  DateTime selectedDate = DateTime.now();

  final List<String> transactionTypes = ['income', 'expense', 'transfer'];

  @override
  void initState() {
    super.initState();
    amountController = TextEditingController();
    descriptionController = TextEditingController();
    noteController = TextEditingController();
  }

  @override
  void dispose() {
    amountController.dispose();
    descriptionController.dispose();
    noteController.dispose();
    super.dispose();
  }

  void _saveTransaction() {
    if (amountController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Amount cannot be empty')),
      );
      return;
    }

    if (selectedAccountId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select an account')),
      );
      return;
    }

    final amount = double.tryParse(amountController.text) ?? 0;

    final transaction = TransactionModel(
      id: 0,
      type: selectedType,
      amount: amount,
      fromAccountId: selectedAccountId!,
      toAccountId: null,
      categoryId: selectedCategoryId,
      description: descriptionController.text.isEmpty ? null : descriptionController.text,
      note: noteController.text.isEmpty ? null : noteController.text,
      date: selectedDate,
      tags: null,
      isRecurring: false,
      recurrenceRule: null,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    ref.read(createTransactionNotifierProvider.notifier).createTransaction(transaction);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final accountsAsync = ref.watch(accountsProvider);
    final categoriesAsync = ref.watch(expenseCategoriesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Transaction'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Amount
            TextField(
              controller: amountController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                hintText: 'Amount',
                labelText: 'Amount',
                prefixText: '\$ ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Transaction Type
            DropdownButtonFormField<String>(
              value: selectedType,
              decoration: InputDecoration(
                labelText: 'Type',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              items: transactionTypes.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(type.toUpperCase()),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() => selectedType = value);
                }
              },
            ),
            const SizedBox(height: 16),

            // Account
            accountsAsync.when(
              data: (accounts) => DropdownButtonFormField<int>(
                value: selectedAccountId,
                decoration: InputDecoration(
                  labelText: 'Account',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                items: accounts.map((account) {
                  return DropdownMenuItem(
                    value: account.id,
                    child: Text(account.name),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() => selectedAccountId = value);
                  }
                },
              ),
              loading: () => const CircularProgressIndicator(),
              error: (error, st) => Text('Error: $error'),
            ),
            const SizedBox(height: 16),

            // Category
            categoriesAsync.when(
              data: (categories) => DropdownButtonFormField<int>(
                value: selectedCategoryId,
                decoration: InputDecoration(
                  labelText: 'Category (Optional)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                items: [
                  const DropdownMenuItem(
                    value: null,
                    child: Text('No Category'),
                  ),
                  ...categories.map((category) {
                    return DropdownMenuItem(
                      value: category.id,
                      child: Text(category.name),
                    );
                  }).toList(),
                ],
                onChanged: (value) {
                  setState(() => selectedCategoryId = value);
                },
              ),
              loading: () => const CircularProgressIndicator(),
              error: (error, st) => Text('Error: $error'),
            ),
            const SizedBox(height: 16),

            // Date
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Date',
                hintText: selectedDate.toString().split(' ')[0],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                suffixIcon: const Icon(Icons.calendar_today),
              ),
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                );
                if (date != null) {
                  setState(() => selectedDate = date);
                }
              },
            ),
            const SizedBox(height: 16),

            // Description
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                hintText: 'Description',
                labelText: 'Description (Optional)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Notes
            TextField(
              controller: noteController,
              decoration: InputDecoration(
                hintText: 'Notes',
                labelText: 'Notes (Optional)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 24),

            // Save Button
            ElevatedButton(
              onPressed: _saveTransaction,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text('Create Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
