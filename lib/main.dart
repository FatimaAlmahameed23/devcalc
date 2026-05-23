import 'package:devcalc/app/di/service_locator.dart';
import 'package:devcalc/features/base64/presentation/cubit/base64_cubit.dart';
import 'package:devcalc/features/color_converter/presentation/cubit/color_converter_cubit.dart';
import 'package:devcalc/features/programmer_calculator/presentation/cubit/programmer_calculator_cubit.dart';
import 'package:devcalc/features/standard_calculator/presentation/cubit/calculator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app/router/app_router.dart';
import 'app/theme/app_theme.dart';
import 'app/theme/theme_notifier.dart';

void main() {
  setupServiceLocator();
  runApp(const DevCalcApp());
}

class DevCalcApp extends StatelessWidget {
  const DevCalcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CalculatorCubit(getIt(), getIt())),
          BlocProvider(create: (_) => ProgrammerCalculatorCubit()),
          BlocProvider(create: (_) => ColorConverterCubit()),
          BlocProvider(create: (_) => Base64Cubit()),
        ],
        child: ValueListenableBuilder<ThemeMode>(
          valueListenable: themeNotifier,
          builder: (_, mode, __) => MaterialApp.router(
            title: 'DevCalc',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: mode,
            routerConfig: appRouter,
          ),
        ),
      ),
    );
  }
}