import '../models/player_data_model.dart';

class DataConstants {
  static final List<PlayerDataModel> testSets = [
    PlayerDataModel(
        id: "0",
        name: 'Prueba 1',
        charactersAffinity: 30,
        weaponRawDamage: 300,
        criticalBoostLvl: 3),
    PlayerDataModel(
        id: "1",
        name: 'Prueba 2',
        charactersAffinity: 90,
        weaponRawDamage: 250,
        criticalBoostLvl: 3),
    PlayerDataModel(
        id: "2",
        name: 'Prueba 3',
        charactersAffinity: -50,
        weaponRawDamage: 500,
        criticalBoostLvl: 0),
    PlayerDataModel(
        id: "3",
        name: 'Prueba 4',
        charactersAffinity: 70,
        weaponRawDamage: 370,
        criticalBoostLvl: 3),
    PlayerDataModel(
        id: "4",
        name: 'Prueba 5',
        charactersAffinity: 90,
        weaponRawDamage: 400,
        criticalBoostLvl: 1),
    PlayerDataModel(
        id: "5",
        name: 'Prueba 6',
        charactersAffinity: -90,
        weaponRawDamage: 600,
        criticalBoostLvl: 0),
    PlayerDataModel(
        id: "6",
        name: 'Prueba 7',
        charactersAffinity: 30,
        weaponRawDamage: 350,
        criticalBoostLvl: 0),
    PlayerDataModel(
        id: "7",
        name: 'Prueba 8',
        charactersAffinity: 50,
        weaponRawDamage: 200,
        criticalBoostLvl: 2),
  ];
}
