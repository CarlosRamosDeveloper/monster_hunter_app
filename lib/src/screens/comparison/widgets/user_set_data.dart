import 'package:flutter/material.dart';

import '../../../models/player_data_model.dart';

class UserSetData extends StatelessWidget {
  const UserSetData({
    Key? key,
    required this.widgetWidth,
    required this.set,
  }) : super(key: key);
  final double widgetWidth;
  final PlayerDataModel set;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: set.id,
      child: Material(
        type: MaterialType.transparency,
        child: Container(
            width: widgetWidth,
            height: 180,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.purple),
            child: Column(
              children: [
                const Text('Estadísticas originales:'),
                const SizedBox(
                  height: 20,
                ),
                Text(set.name),
                Column(
                  children: [
                    Row(
                      children: [
                        const Text('Daño Base: '),
                        const Spacer(),
                        Text(set.weaponRawDamage.toStringAsFixed(0)),
                      ],
                    ),
                    Row(
                      children: [
                        const Text('Afinidad: '),
                        const Spacer(),
                        Text(set.charactersAffinity.toString()),
                      ],
                    ),
                    Row(
                      children: [
                        const Text('Nivel de potenciador crítico: '),
                        const Spacer(),
                        Text(set.criticalBoostLvl.toString()),
                      ],
                    ),
                    Row(
                      children: [
                        const Text('Daño Medio: '),
                        const Spacer(),
                        Text(set.averageDamage.toStringAsFixed(2)),
                      ],
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
