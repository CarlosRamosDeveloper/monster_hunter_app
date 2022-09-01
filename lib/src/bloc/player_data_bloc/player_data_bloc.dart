import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../models/models.dart';

part 'player_data_event.dart';
part 'player_data_state.dart';

class PlayerDataBloc extends Bloc<PlayerDataEvent, PlayerDataState> {
  PlayerDataBloc() : super(const PlayerDataState()) {
    on<AddNewSet>(_onAddNewSet);
    on<RemoveSet>(_onRemoveSet);
    on<DeleteData>(_onDeleteData);
  }

  void _onAddNewSet(AddNewSet event, Emitter<PlayerDataState> emit) {
    final state = this.state;
    emit(PlayerLoadedState(allSets: List.from(state.allSets)..add(event.set)));
  }

  void _onRemoveSet(RemoveSet event, Emitter<PlayerDataState> emit) {
    final state = this.state;
    emit(PlayerLoadedState(
        allSets: List.from(state.allSets)..remove(event.set)));
  }

  void _onDeleteData(DeleteData event, Emitter<PlayerDataState> emit) {
    emit(const PlayerInitialState());
  }
}
