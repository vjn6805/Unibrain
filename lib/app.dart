import 'package:flutter/material.dart';
import 'package:unibrain/approute.dart';
import 'package:unibrain/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
      darkTheme: TAppTheme.darkTheme,
      theme: TAppTheme.lightTheme,
      routerConfig: appRouter,
    );
  }
}
