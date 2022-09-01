import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/themes_bloc/themes_bloc.dart';
import '../../themes/app_themes.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesBloc, ThemesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Opciones'),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                
                const _ThemesList(),
                Container()
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ThemesList extends StatelessWidget {
  const _ThemesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: AppTheme.values.length,
      itemBuilder: (context, index) {
        final item = AppTheme.values[index];
        return _ThemeCard(
          themeName: item.themeName,
          mainColor: item.theme.primaryColor,
          secondaryColor: item.theme.secondaryColor,
          tertiaryColor: item.theme.tertiaryColor,
          theme: item,
        );
      },
    ));
  }
}

class _ThemeCard extends StatelessWidget {
  const _ThemeCard({
    Key? key,
    required this.themeName,
    required this.mainColor,
    required this.secondaryColor,
    required this.tertiaryColor,
    required this.theme,
  }) : super(key: key);

  final String themeName;

  final Color mainColor;
  final Color secondaryColor;
  final Color tertiaryColor;
  final AppTheme theme;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesBloc, ThemesState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            BlocProvider.of<ThemesBloc>(context)
                .add(SwitchThemeEvent(theme: theme));
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            width: 350,
            height: 80,
            decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 5, color: tertiaryColor)),
            child: Center(
              child: Text(
                themeName,
                style: TextStyle(
                    color: secondaryColor,
                    fontSize: 23,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      },
    );
  }
}
