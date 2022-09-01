import 'package:flutter/material.dart';

import 'dependencies/di.dart' as di;

import 'package:monster_hunter_app/src/screens/screens.dart';
import 'route/app_route.dart';
import 'themes/app_themes.dart';

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monster Hunter ',
      theme: AppTheme.nargacuga.theme.appThemeData,
      home: const HomeScreen(),
      routes: AppRoute.getAppRoutes(),
    );
  }
}
