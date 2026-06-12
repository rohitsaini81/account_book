import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:account_book/features/accounts/presentation/providers/account_providers.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountsAsync = ref.watch(accountsProvider);
    final totalBalanceAsync = ref.watch(totalBalanceProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Book'),
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Total Balance Card
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Balance',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 8),
                          totalBalanceAsync.when(
                            data: (balance) => Text(
                              '\$${balance.toStringAsFixed(2)}',
                              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                    color: balance >= 0 ? Colors.green : Colors.red,
                                  ),
                            ),
                            loading: () => const CircularProgressIndicator(),
                            error: (error, st) => Text('Error: $error'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Accounts',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
          // Accounts List
          accountsAsync.when(
            data: (accounts) {
              if (accounts.isEmpty) {
                return SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.account_balance_wallet_outlined,
                            size: 48,
                            color: Colors.grey[300],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No accounts yet',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }

              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final account = accounts[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Color(int.parse('0xFF${account.color.replaceFirst('#', '')}')),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(
                                  Icons.account_balance_wallet,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      account.name,
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                    Text(
                                      account.type,
                                      style: Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '\$${account.balance.toStringAsFixed(2)}',
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                          color: account.balance >= 0 ? Colors.green : Colors.red,
                                        ),
                                  ),
                                  Text(
                                    account.currency,
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: accounts.length,
                ),
              );
            },
            loading: () => const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            error: (error, st) => SliverToBoxAdapter(
              child: Center(
                child: Text('Error: $error'),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to add account
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
