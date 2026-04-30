import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/router/app_router.dart';
import 'app/theme/app_theme.dart';

void main() {
  Bloc.observer = _AppBlocObserver();
  runApp(const DevCalcApp());
}

class DevCalcApp extends StatelessWidget {
  const DevCalcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'DevCalc',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.dark,
      routerConfig: appRouter,
    );
  }
}

/// Logs all Cubit/Bloc state changes to the console during development.
class _AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    debugPrint(
      '${bloc.runtimeType} ${change.currentState} → ${change.nextState}',
    );
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    debugPrint('${bloc.runtimeType} $error');
  }
}
