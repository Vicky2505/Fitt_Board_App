import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'screens/get_started_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const FittBoardApp());
}

class FittBoardApp extends StatelessWidget {
  const FittBoardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'FittBoard',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          home: const GetStartedScreen(),
        );
      },
    );
  }
}
