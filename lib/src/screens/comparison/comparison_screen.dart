import 'package:flutter/material.dart';

import '../../models/player_data_model.dart';
import 'widgets/widgets.dart';

class ComparisonScreen extends StatelessWidget {
  const ComparisonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double widgetWidth = 350;
    final set = ModalRoute.of(context)!.settings.arguments as PlayerDataModel;

    //TODO: Arreglar el diseño cuando todo funcione

    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Comparación',
              textAlign: TextAlign.center,
            )),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [UserSetData(widgetWidth: widgetWidth, set: set)],
          ),
        ));
  }
}
