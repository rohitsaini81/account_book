import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:account_book/shared/models/account_model.dart';
import 'package:account_book/features/accounts/presentation/providers/account_providers.dart';

class AddAccountScreen extends ConsumerStatefulWidget {
  final String? accountId;

  const AddAccountScreen({Key? key, this.accountId}) : super(key: key);

  @override
  ConsumerState<AddAccountScreen> createState() => _AddAccountScreenState();
}

class _AddAccountScreenState extends ConsumerState<AddAccountScreen> {
  late final TextEditingController nameController;
  late final TextEditingController balanceController;
  late final TextEditingController noteController;

  String selectedType = 'cash';
  String selectedColor = '#1F88DB';
  String selectedIcon = 'account_balance_wallet';
  String selectedCurrency = 'USD';

  final List<String> accountTypes = ['cash', 'bank', 'wallet', 'credit_card', 'savings', 'custom'];
  final List<String> colors = [
    '#1F88DB',
    '#FF6B6B',
    '#4ECDC4',
    '#FFE66D',
    '#95E1D3',
    '#F38181',
  ];

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    balanceController = TextEditingController();
    noteController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    balanceController.dispose();
    noteController.dispose();
    super.dispose();
  }

  void _saveAccount() {
    if (nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Account name cannot be empty')),
      );
      return;
    }

    final balance = double.tryParse(balanceController.text) ?? 0;

    final account = AccountModel(
      id: widget.accountId != null ? int.parse(widget.accountId!) : 0,
      name: nameController.text,
      type: selectedType,
      balance: balance,
      openingBalance: balance,
      color: selectedColor,
      icon: selectedIcon,
      currency: selectedCurrency,
      note: noteController.text.isEmpty ? null : noteController.text,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    if (widget.accountId == null) {
      ref.read(createAccountNotifierProvider.notifier).createAccount(account);
    } else {
      ref.read(updateAccountNotifierProvider.notifier).updateAccount(account);
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.accountId == null ? 'Add Account' : 'Edit Account'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Account Name
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Account Name',
                labelText: 'Account Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Account Type
            DropdownButtonFormField<String>(
              value: selectedType,
              decoration: InputDecoration(
                labelText: 'Account Type',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              items: accountTypes.map((type) {
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

            // Opening Balance
            TextField(
              controller: balanceController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                hintText: 'Opening Balance',
                labelText: 'Opening Balance',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Currency
            DropdownButtonFormField<String>(
              value: selectedCurrency,
              decoration: InputDecoration(
                labelText: 'Currency',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              items: ['USD', 'EUR', 'GBP', 'INR', 'AUD'].map((currency) {
                return DropdownMenuItem(
                  value: currency,
                  child: Text(currency),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() => selectedCurrency = value);
                }
              },
            ),
            const SizedBox(height: 16),

            // Color Selection
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Color',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: colors.map((color) {
                    final isSelected = selectedColor == color;
                    return GestureDetector(
                      onTap: () => setState(() => selectedColor = color),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(int.parse('0xFF${color.replaceFirst('#', '')}')),
                          borderRadius: BorderRadius.circular(8),
                          border: isSelected
                              ? Border.all(color: Colors.black, width: 3)
                              : null,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Notes
            TextField(
              controller: noteController,
              decoration: InputDecoration(
                hintText: 'Notes (Optional)',
                labelText: 'Notes',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 24),

            // Save Button
            ElevatedButton(
              onPressed: _saveAccount,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: Text(widget.accountId == null ? 'Create Account' : 'Update Account'),
            ),
          ],
        ),
      ),
    );
  }
}
