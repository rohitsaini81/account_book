import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:account_book/features/transactions/presentation/providers/transaction_providers.dart';
import 'package:account_book/shared/widgets/empty_state.dart';

class TransactionsScreen extends ConsumerWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionsAsync = ref.watch(transactionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
        elevation: 0,
      ),
      body: transactionsAsync.when(
        data: (transactions) {
          if (transactions.isEmpty) {
            return EmptyState(
              icon: Icons.receipt_outlined,
              title: 'No transactions yet',
              subtitle: 'Create your first transaction to get started',
              action: ElevatedButton.icon(
                onPressed: () {
                  // Navigate to add transaction
                },
                icon: const Icon(Icons.add),
                label: const Text('Add Transaction'),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final transaction = transactions[index];
              final isIncome = transaction.type == 'income';
              final color = isIncome ? Colors.green : Colors.red;

              return ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                leading: CircleAvatar(
                  backgroundColor: color.withOpacity(0.2),
                  child: Icon(
                    isIncome ? Icons.add : Icons.remove,
                    color: color,
                  ),
                ),
                title: Text(transaction.description ?? 'Transaction'),
                subtitle: Text(
                  transaction.date.toString().split(' ')[0],
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                trailing: Text(
                  '${isIncome ? '+' : '-'}\$${transaction.amount.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  // Navigate to transaction details
                },
              );
            },
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, st) => Center(
          child: Text('Error: $error'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to add transaction
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
