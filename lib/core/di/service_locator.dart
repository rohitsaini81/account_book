import 'package:get_it/get_it.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Database is managed by Riverpod providers
  // Repositories and use cases are also managed by Riverpod

  // If needed for non-Riverpod components, add manual registrations here
}

// Riverpod providers for core services
final databaseProvider = FutureProvider((ref) async {
  // Database initialization handled in main.dart
  throw UnimplementedError('Override in main.dart');
});
