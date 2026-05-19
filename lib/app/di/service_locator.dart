import 'package:get_it/get_it.dart';

import '../../core/services/clipboard_service.dart';
import '../../core/services/flutter_clipboard_service.dart';
import '../../features/standard_calculator/domain/services/expression_evaluator.dart';

/// Global service locator.
///
/// Register all app-wide services here. Access them anywhere with `getIt<T>()`.
final getIt = GetIt.instance;

/// Registers all services. Call once in `main()` before `runApp`.
void setupServiceLocator() {
  // Core services
  getIt.registerLazySingleton<ClipboardService>(() => FlutterClipboardService());

  // Standard calculator
  getIt.registerLazySingleton<ExpressionEvaluator>(() => ExpressionEvaluator());
}