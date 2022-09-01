import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/player_data_bloc/player_data_bloc.dart';
import '../../bloc/themes_bloc/themes_bloc.dart';
import '../../themes/app_themes.dart';
import '../../widgets/separator.dart';

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
              children: const [
                SizedBox(
                  height: 30,
                ),
                _ThemesList(),
                _DeleteDataButton()
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

class _DeleteDataButton extends StatelessWidget {
  const _DeleteDataButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO: Elimina todos los sets almancenados.
        showDeleteDialog(context);
      },
      child: Column(
        children: [
          const Separator(),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 50,
              width: 230,
              child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Text(
                    'Eliminar datos almacenados',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.bold),
                  )))),
        ],
      ),
    );
  }

  void showDeleteDialog(BuildContext context) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return BlocConsumer<PlayerDataBloc, PlayerDataState>(
            listener: (context, state) {},
            builder: (context, state) {
              return AlertDialog(
                actions: [
                  _DialogButton(
                    buttonColor: Colors.green,
                    buttonText: 'No Eliminar',
                    function: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  _DialogButton(
                      buttonColor: Colors.red,
                      buttonText: 'Eliminar',
                      function: () {
                        deleteAllDataMessage(context);
                        BlocProvider.of<PlayerDataBloc>(context)
                            .add(DeleteData());
                        Navigator.pop(context);
                      })
                ],
                actionsAlignment: MainAxisAlignment.center,
                title: const Text('¿Eliminar los datos almacenados?'),
              );
            },
          );
        });
  }

  void deleteAllDataMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
            'Se ha eliminado toda la información del usuario en la aplicación.')));
  }
}

class _DialogButton extends StatelessWidget {
  const _DialogButton({
    Key? key,
    required this.buttonColor,
    required this.buttonText,
    required this.function,
  }) : super(key: key);
  final Color buttonColor;
  final String buttonText;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
          backgroundColor: MaterialStateProperty.all(buttonColor),
        ),
        onPressed: function,
        child: Text(buttonText));
  }
}
