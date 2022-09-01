part of 'player_data_bloc.dart';

@immutable
class PlayerDataState extends Equatable {
  const PlayerDataState({
    this.allSets = const <PlayerDataModel>[],
  });

  final List<PlayerDataModel> allSets;
  @override
  List<Object> get props => [];
}

class PlayerInitialState extends PlayerDataState {
  @override
  // ignore: overridden_fields
  final List<PlayerDataModel> allSets;

  const PlayerInitialState({
    this.allSets = const <PlayerDataModel>[],
  });

  @override
  List<Object> get props => [allSets];
}

class PlayerLoadedState extends PlayerDataState {
  @override
  // ignore: overridden_fields
  final List<PlayerDataModel> allSets;

  const PlayerLoadedState({
    this.allSets = const <PlayerDataModel>[],
  });

  @override
  List<Object> get props => [allSets];
}
