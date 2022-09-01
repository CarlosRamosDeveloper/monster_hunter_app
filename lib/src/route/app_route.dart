import 'package:flutter/material.dart';
import 'package:monster_hunter_app/src/screens/home/homescreen.dart';

import '../models/models.dart';

class AppRoute {
  static const initialRoute = HomeScreen();
  static final routeOption = <RouteOption>[
    RouteOption(
        route: 'home', name: 'Página Principal', page: const HomeScreen())
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
