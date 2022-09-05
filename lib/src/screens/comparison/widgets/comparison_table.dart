import 'package:flutter/material.dart';

import '../../../models/player_data_model.dart';

class ComparisonTable extends StatelessWidget {
  const ComparisonTable({
    Key? key,
    required this.widgetWidth,
    required this.set,
  }) : super(key: key);
  final double widgetWidth;
  final PlayerDataModel set;
  @override
  Widget build(BuildContext context) {
    double getAverageDamage(int cbLvl, int ewLvl) {
      int baseAffinity = set.charactersAffinity;
      int exploitWeaknessMultiplier = 0;

      if (ewLvl == 0) {
        exploitWeaknessMultiplier = 0;
      }
      if (ewLvl == 1) {
        exploitWeaknessMultiplier = 15;
      }
      if (ewLvl == 2) {
        exploitWeaknessMultiplier = 30;
      }
      if (ewLvl == 3) {
        exploitWeaknessMultiplier = 50;
      }

      int totalAffinity = baseAffinity + exploitWeaknessMultiplier;

      if (totalAffinity > 100) {
        totalAffinity = 100;
      }

      return PlayerDataModel(
              id: set.id,
              name: set.name,
              weaponRawDamage: set.weaponRawDamage,
              charactersAffinity: totalAffinity,
              criticalBoostLvl: cbLvl)
          .averageDamage;
    }

    final double cb0we0 = getAverageDamage(0, 0);
    final double cb0we1 = getAverageDamage(0, 1);
    final double cb0we2 = getAverageDamage(0, 2);
    final double cb0we3 = getAverageDamage(0, 3);

    final double cb1we0 = getAverageDamage(1, 0);
    final double cb1we1 = getAverageDamage(1, 1);
    final double cb1we2 = getAverageDamage(1, 2);
    final double cb1we3 = getAverageDamage(1, 3);

    final double cb2we0 = getAverageDamage(2, 0);
    final double cb2we1 = getAverageDamage(2, 1);
    final double cb2we2 = getAverageDamage(2, 2);
    final double cb2we3 = getAverageDamage(2, 3);

    final double cb3we0 = getAverageDamage(3, 0);
    final double cb3we1 = getAverageDamage(3, 1);
    final double cb3we2 = getAverageDamage(3, 2);
    final double cb3we3 = getAverageDamage(3, 3);

    //TODO arreglar el fallo de diseño con el nivel de explotar debiliad

    return Container(
      width: widgetWidth,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const Text('                            Nivel de explotar debilidad'),
          const SizedBox(
            height: 10,
          ),
          DataTable(
            columnSpacing: 10,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.purple),
            columns: [
              DataColumn(
                  label: Column(
                children: const [
                  Text('Potenciador'),
                ],
              )),
              DataColumn(
                  label: Column(
                children: const [
                  Text('0'),
                ],
              )),
              DataColumn(
                  label: Column(
                children: const [
                  Text('1'),
                ],
              )),
              DataColumn(
                  label: Column(
                children: const [
                  Text('2'),
                ],
              )),
              DataColumn(
                  label: Column(
                children: const [
                  Text('3'),
                ],
              )),
            ],
            rows: [
              DataRow(cells: [
                const DataCell(Text(
                  '0',
                  textAlign: TextAlign.center,
                )),
                DataCell(Text(
                  cb0we0.toStringAsFixed(2),
                )),
                DataCell(
                  Text(
                    cb0we1.toStringAsFixed(2),
                  ),
                ),
                DataCell(Text(cb0we2.toStringAsFixed(2))),
                DataCell(Text(cb0we3.toStringAsFixed(2))),
              ]),
              DataRow(cells: [
                const DataCell(Text('1')),
                DataCell(Text(cb1we0.toStringAsFixed(2))),
                DataCell(Text(cb1we1.toStringAsFixed(2))),
                DataCell(Text(cb1we2.toStringAsFixed(2))),
                DataCell(Text(cb1we3.toStringAsFixed(2))),
              ]),
              DataRow(cells: [
                const DataCell(Text('2')),
                DataCell(Text(cb2we0.toStringAsFixed(2))),
                DataCell(Text(cb2we1.toStringAsFixed(2))),
                DataCell(Text(cb2we2.toStringAsFixed(2))),
                DataCell(Text(cb2we3.toStringAsFixed(2))),
              ]),
              DataRow(cells: [
                const DataCell(Text('3')),
                DataCell(Text(cb3we0.toStringAsFixed(2))),
                DataCell(Text(cb3we1.toStringAsFixed(2))),
                DataCell(Text(cb3we2.toStringAsFixed(2))),
                DataCell(Text(cb3we3.toStringAsFixed(2))),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}
