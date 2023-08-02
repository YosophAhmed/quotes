import 'package:flutter/material.dart';
import 'package:quotes/config/routes/app_routes.dart';
import 'package:quotes/config/themes/app_themes.dart';
import 'package:quotes/core/utils/app_strings.dart';

class Quotes extends StatelessWidget {
  const Quotes({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
