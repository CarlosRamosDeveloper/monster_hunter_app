import 'package:flutter/material.dart';

import '../models/models.dart';

class AppRoute {
  static final routeOption = <RouteOption>[];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    for (final route in routeOption) {
      appRoutes.addAll({route.route: (BuildContext context) => route.page});
    }

    return appRoutes;
  }
}
