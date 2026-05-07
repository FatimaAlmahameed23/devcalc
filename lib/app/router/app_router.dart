import 'package:devcalc/app/utils/placeholder_screen.dart';
import 'package:devcalc/features/standard_calculator/presentation/screens/standard_calculator_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

/// Route path constants — never hardcode path strings outside this file.
abstract final class AppRoutes {
  static const calculator = '/';
  static const programmer = '/programmer';
  static const colorConverter = '/color-converter';
  static const base64 = '/base64';
  static const timestamp = '/timestamp';
}

final appRouter = GoRouter(
  initialLocation: AppRoutes.calculator,
  routes: [
    ShellRoute(
      builder: (context, state, child) => AppShell(child: child),
      routes: [
        GoRoute(
          path: AppRoutes.calculator,
          builder: (context, state) => const StandardCalculatorPage(),
        ),
        GoRoute(
          path: AppRoutes.programmer,
          builder: (context, state) =>
              const PlaceholderScreen(title: 'Programmer'),
        ),
        GoRoute(
          path: AppRoutes.colorConverter,
          builder: (context, state) =>
              const PlaceholderScreen(title: 'Color Converter'),
        ),
        GoRoute(
          path: AppRoutes.base64,
          builder: (context, state) => const PlaceholderScreen(title: 'Base64'),
        ),
        GoRoute(
          path: AppRoutes.timestamp,
          builder: (context, state) =>
              const PlaceholderScreen(title: 'Timestamp'),
        ),
      ],
    ),
  ],
);

/// The persistent shell that wraps all screens with bottom navigation.
class AppShell extends StatelessWidget {
  final Widget child;

  const AppShell({super.key, required this.child});

  static const _tabs = [
    (
      icon: Icons.calculate_outlined,
      label: 'Calc',
      route: AppRoutes.calculator,
    ),
    (icon: Icons.memory_outlined, label: 'Dev', route: AppRoutes.programmer),
    (
      icon: Icons.palette_outlined,
      label: 'Color',
      route: AppRoutes.colorConverter,
    ),
    (icon: Icons.code_outlined, label: 'Base64', route: AppRoutes.base64),
    (
      icon: Icons.access_time_outlined,
      label: 'Time',
      route: AppRoutes.timestamp,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final currentIndex = _tabs
        .indexWhere((t) => t.route == location)
        .clamp(0, 4);

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) => context.go(_tabs[index].route),
        destinations: _tabs
            .map(
              (t) => NavigationDestination(icon: Icon(t.icon), label: t.label),
            )
            .toList(),
      ),
    );
  }
}
