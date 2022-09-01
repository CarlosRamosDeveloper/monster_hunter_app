import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/themes_bloc/themes_bloc.dart';
import 'dependencies/di.dart' as di;

import 'package:monster_hunter_app/src/screens/screens.dart';
import 'route/app_route.dart';
import 'themes/app_themes.dart';

void main() async {
  await di.init();
  BlocOverrides.runZoned(() => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
          create: (context) => ThemesBloc()
            ..add(const SwitchThemeEvent(theme: AppTheme.nargacuga)))
    ], child: const App());
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesBloc, ThemesState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Monster Hunter ',
          theme: AppTheme.nargacuga.theme.appThemeData,
          home: const SettingsScreen(),
          routes: AppRoute.getAppRoutes(),
        );
      },
    );
  }
}
