import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class PlayerDataModel extends Equatable {
  /// Stores the id of the gearset
  final String id;

  /// Stores the name of the gearset
  final String name;

  /// Stores the Weapon Raw Damage of the gearset
  final double weaponRawDamage;

  /// Stores the character's affinity of the gearset
  int charactersAffinity;

  /// Stores the character's critical boost level of the gearset
  final int criticalBoostLvl;

  /// Stores all the data for a gearset
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

  /// Gets the critical damage multiplier
  /// of a set, calculated with
  /// Critical Boost Level
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

  /// Gets the average damage with a weapon
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

  /// Prints the average damage of the set
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
