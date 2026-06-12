import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:account_book/features/dashboard/presentation/screens/home_screen.dart';
import 'package:account_book/features/accounts/presentation/screens/add_account_screen.dart';

// Route names
class Routes {
  static const String home = '/';
  static const String addAccount = '/accounts/add';
  static const String editAccount = '/accounts/edit';
}

// Create the router
final appRouterProvider = GoRouter(
  initialLocation: Routes.home,
  debugLogDiagnostics: false,
  routes: [
    GoRoute(
      path: Routes.home,
      name: 'home',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'accounts/add',
          name: 'addAccount',
          builder: (context, state) => const AddAccountScreen(),
        ),
        GoRoute(
          path: 'accounts/edit',
          name: 'editAccount',
          builder: (context, state) {
            final accountId = state.uri.queryParameters['id'];
            return AddAccountScreen(accountId: accountId);
          },
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text('Route not found: ${state.fullPath}'),
    ),
  ),
);
