import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/player_data_bloc/player_data_bloc.dart';
import '../../models/models.dart';
import '../../utils/utils.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController setNameController = TextEditingController();
    TextEditingController weaponRawDamageController = TextEditingController();
    TextEditingController affinityController = TextEditingController();
    int criticalBoostController = 0;
    RegExp onlyNumbers = RegExp(r'^[0-9]+$');
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Añadir nuevo set'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Agregar'),
        icon: const Icon(Icons.add),
        onPressed: () {
          if (!formKey.currentState!.validate()) {
            showErrorMessage(context);
          } else {
            var set = PlayerDataModel(
                id: IdGenerator.generate(),
                name: setNameController.text,
                weaponRawDamage: double.parse(weaponRawDamageController.text),
                charactersAffinity: int.parse(affinityController.text),
                criticalBoostLvl: criticalBoostController);
            context.read<PlayerDataBloc>().add(AddNewSet(set: set));
            Navigator.pop(context);
            Navigator.popAndPushNamed(context, 'transition');
          }
        },
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            width: 350,
            height: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    autofocus: true,
                    controller: setNameController,
                    keyboardType: TextInputType.name,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == '' || value == null) {
                        return 'Campo obligatorio';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: 'Nombre del set',
                        labelText: 'Nombre del set'),
                  ),
                  TextFormField(
                    controller: weaponRawDamageController,
                    keyboardType: TextInputType.number,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null) return 'Campo obligatorio';
                      if (!onlyNumbers.hasMatch(value)) {
                        return 'Este campo solo valores numéricos';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: 'Daño del arma', labelText: 'Daño del arma'),
                  ),
                  TextFormField(
                    controller: affinityController,
                    keyboardType: TextInputType.number,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null) return 'Campo obligatorio';
                      if (!onlyNumbers.hasMatch(value)) {
                        return 'Este campo solo valores numéricos';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: 'Afinidad del personaje',
                        labelText: 'Afinidad del personaje'),
                  ),
                  const Divider(),
                  DropdownButtonFormField<String>(
                      // value: selectedValue,
                      dropdownColor: Colors.red,
                      decoration: const InputDecoration(
                          label: Text('Nivel de Potenciador Crítico'),
                          hintText: 'Nivel de Potenciador Crítico'),
                      isExpanded: true,
                      hint: const Text('Nivel de Potenciador Crítico'),
                      items: const [
                        DropdownMenuItem(
                            value: '0',
                            child: Text(
                              '0',
                              style: TextStyle(color: Colors.white),
                            )),
                        DropdownMenuItem(value: '1', child: Text('1')),
                        DropdownMenuItem(value: '2', child: Text('2')),
                        DropdownMenuItem(value: '3', child: Text('3')),
                      ],
                      onChanged: (value) {
                        criticalBoostController = int.parse(value!);
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void showErrorMessage(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('El formulario no es válido')));
}
