import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class TransitionScreen extends StatelessWidget {
  const TransitionScreen({Key? key}) : super(key: key);

  //TODO: Preparar el Circular Graph

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Calculando...'),
            SizedBox(
              height: 20,
            ),
            CircularGraph(),
            SizedBox(
              height: 20,
            ),
            Text('Por favor, espere...')
          ],
        ),
      ),
    );
  }
}
