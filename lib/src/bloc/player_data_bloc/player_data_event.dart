part of 'player_data_bloc.dart';

abstract class PlayerDataEvent extends Equatable {
  const PlayerDataEvent();

  @override
  List<Object> get props => [];
}

class LoadData extends PlayerDataEvent {}

class AddNewSet extends PlayerDataEvent {
  final PlayerDataModel set;

  const AddNewSet({
    required this.set,
  });

  @override
  List<Object> get props => [set];
}

class RemoveSet extends PlayerDataEvent {
  final PlayerDataModel set;

  const RemoveSet({
    required this.set,
  });

  @override
  List<Object> get props => [set];
}

class DeleteData extends PlayerDataEvent {}
