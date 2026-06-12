import 'package:account_book/features/accounts/data/repositories/account_repository.dart';
import 'package:account_book/shared/models/account_model.dart';

class CreateAccountUsecase {
  final IAccountRepository repository;

  CreateAccountUsecase({required this.repository});

  Future<void> call(AccountModel account) async {
    if (account.name.isEmpty) {
      throw ArgumentError('Account name cannot be empty');
    }

    if (account.balance < 0) {
      throw ArgumentError('Account balance cannot be negative');
    }

    await repository.createAccount(account);
  }
}
