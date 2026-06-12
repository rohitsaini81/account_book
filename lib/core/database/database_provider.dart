import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:account_book/core/database/database.dart';

final databaseProvider = FutureProvider<AppDatabase>((ref) async {
  return AppDatabase();
});
