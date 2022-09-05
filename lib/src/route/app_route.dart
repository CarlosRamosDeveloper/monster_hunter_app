import 'package:flutter/material.dart';
import 'package:monster_hunter_app/src/screens/comparison/comparison_screen.dart';
import 'package:monster_hunter_app/src/screens/form/form_screen.dart';
import 'package:monster_hunter_app/src/screens/transition/transition_screen.dart';

import '../models/models.dart';
import '../screens/screens.dart';

class AppRoute {
  static const initialRoute = HomeScreen();
  static final routeOption = <RouteOption>[
    RouteOption(
        route: 'home', name: 'Página Principal', page: const HomeScreen()),
    RouteOption(
        route: 'settings', name: 'Opciones', page: const SettingsScreen()),
    RouteOption(
        route: 'comparison',
        name: 'Comparación',
        page: const ComparisonScreen()),
    RouteOption(route: 'form', name: 'Agregar set', page: const FormScreen()),
    RouteOption(route: 'transition', name: 'Transición', page: const TransitionScreen())
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});

    for (final route in routeOption) {
      appRoutes.addAll({route.route: (BuildContext context) => route.page});
    }

    return appRoutes;
  }
}
