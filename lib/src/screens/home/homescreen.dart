import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.3),
          elevation: 25,
          centerTitle: true,
          title: const Text('MHR Damage Calculator'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'settings');
                },
                icon: const Icon(Icons.settings_suggest))
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.add),
          label: const Text('Añadir nuevo set'),
          onPressed: () {
            Navigator.pushNamed(context, 'form');
          },
        ),
        body: Column(
          children: const [
            SizedBox(
              height: 30,
            ),
          ],
        ));

    //TODO: Probar a añadir un modal para poner el botón de añadir set
  }
}
