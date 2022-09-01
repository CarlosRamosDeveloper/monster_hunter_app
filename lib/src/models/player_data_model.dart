import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class PlayerDataModel extends Equatable {
  final String id;
  final String name;
  final double weaponRawDamage;
  int charactersAffinity;
  final int criticalBoostLvl;

  PlayerDataModel({
    required this.id,
    required this.name,
    required this.weaponRawDamage,
    required this.charactersAffinity,
    required this.criticalBoostLvl,
  });

  factory PlayerDataModel.fromMap(Map<String, dynamic> obj) {
    return PlayerDataModel(
        id: obj["id"],
        name: obj["name"],
        weaponRawDamage: obj["weaponRawDamage"],
        charactersAffinity: obj["CharactersAffinity"],
        criticalBoostLvl: obj["criticalBoostLvl"]);
  }

  double get criticalDamageMultiplier {
    late double criticalDamageMultiplier;

    if (criticalBoostLvl == 0) {
      criticalDamageMultiplier = 1.25;
    }
    if (criticalBoostLvl == 1) {
      criticalDamageMultiplier = 1.30;
    }
    if (criticalBoostLvl == 2) {
      criticalDamageMultiplier = 1.35;
    }
    if (criticalBoostLvl == 3) {
      criticalDamageMultiplier = 1.40;
    }
    if (charactersAffinity < 0) {
      criticalDamageMultiplier = 0.75;
    }

    return criticalDamageMultiplier;
  }

  double get averageDamage {
    double totalDamage = 0;
    double averageDamage = 0;
    int iterations = 100;

    if (charactersAffinity == 0) return weaponRawDamage;

    if (charactersAffinity > 0) {
      if (charactersAffinity > 100) {
        charactersAffinity = 100;
      }
      totalDamage +=
          (weaponRawDamage * criticalDamageMultiplier) * charactersAffinity;
      totalDamage += weaponRawDamage * (iterations - charactersAffinity);
    }

    if (charactersAffinity < 0) {
      totalDamage +=
          (weaponRawDamage * criticalDamageMultiplier) * -charactersAffinity;
      totalDamage += weaponRawDamage * (iterations + charactersAffinity);
    }

    averageDamage = totalDamage / iterations;

    return averageDamage;
  }

  String showAverageDamage() {
    return 'El daño medio de $name es de $averageDamage';
  }

  PlayerDataModel copyWith({
    String? id,
    String? name,
    double? weaponRawDamage,
    int? charactersAfinity,
    int? criticalBoostLvl,
  }) {
    return PlayerDataModel(
      id: id ?? this.id,
      name: name ?? this.name,
      weaponRawDamage: weaponRawDamage ?? this.weaponRawDamage,
      charactersAffinity: charactersAfinity ?? charactersAffinity,
      criticalBoostLvl: criticalBoostLvl ?? this.criticalBoostLvl,
    );
  }

  @override
  List<Object?> get props =>
      [id, name, weaponRawDamage, charactersAffinity, criticalBoostLvl];

  static List<PlayerDataModel> sets = [];
}