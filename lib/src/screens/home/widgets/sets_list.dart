import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/player_data_bloc/player_data_bloc.dart';
import '../../../models/player_data_model.dart';

class SetsList extends StatelessWidget {
  const SetsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerDataBloc, PlayerDataState>(
      builder: (context, state) {
        return Expanded(
          child: Scrollbar(
            child: ListView.builder(
              itemCount: state.allSets.length,
              itemBuilder: (context, index) {
                final item = state.allSets[index];
                return _dismisableWeaponCard(context, item);
              },
            ),
          ),
        );
      },
    );
  }
}

//TODO: Visual: arreglar el problema del dismissable card en tablets

Widget _dismisableWeaponCard(BuildContext context, PlayerDataModel set) {
  return BlocConsumer<PlayerDataBloc, PlayerDataState>(
    listener: (context, state) {},
    builder: (context, state) {
      return Column(
        children: [
          Dismissible(
            key: Key(set.name),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {
              context.read<PlayerDataBloc>().add(RemoveSet(set: set));
              deleteSetMessage(context, set);
            },
            background: Container(
              color: Theme.of(context).colorScheme.secondary,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: const Text('Eliminar set'),
            ),
            child: _WeaponCard(
              set: set,
            ),
          ),
          const SizedBox(
            height: 15,
          )
        ],
      );
    },
  );
}

class _WeaponCard extends StatelessWidget {
  const _WeaponCard({
    Key? key,
    required this.set,
  }) : super(key: key);

  final PlayerDataModel set;
  final TextStyle mainText =
      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'comparison', arguments: set);
      },
      child: Hero(
        tag: set.id,
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            width: 400,
            height: 180,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: Theme.of(context).colorScheme.onSecondary,
                    width: 5)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Spacer(),
                    Text(
                      set.name,
                      style: mainText,
                    ),
                    const Spacer()
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                _ShowData(
                  text: 'Daño del arma:',
                  data: set.weaponRawDamage.toStringAsFixed(0),
                ),
                _ShowData(
                  text: 'Afinidad del set:',
                  data: set.charactersAffinity.toString(),
                ),
                _ShowData(
                  text: 'Nivel de Potenciador Crítico:',
                  data: set.criticalBoostLvl.toString(),
                ),
                _ShowData(
                  text: 'Daño medio por golpe',
                  data: set.averageDamage.toStringAsFixed(2),
                  style: mainText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ShowData extends StatelessWidget {
  const _ShowData(
      {Key? key,
      required this.text,
      required this.data,
      this.style = const TextStyle(fontWeight: FontWeight.normal)})
      : super(key: key);

  final String text;
  final String data;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text),
        const Spacer(),
        Text(
          data,
          style: style,
        )
      ],
    );
  }
}

void deleteSetMessage(BuildContext context, PlayerDataModel set) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Se ha eliminado el grupo ${set.name} de la lista.')));
}
