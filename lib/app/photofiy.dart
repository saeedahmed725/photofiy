import 'package:flutter/material.dart';

import '../config/routes/app_routes.dart';
import '../config/theme/app_theme.dart';

class Photofiy extends StatelessWidget {
  const Photofiy({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      title: 'Photofiy',
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      routerConfig: AppRoutes.router,
    );
  }
}
