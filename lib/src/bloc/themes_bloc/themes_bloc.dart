import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../themes/app_themes.dart';

part 'themes_event.dart';
part 'themes_state.dart';

class ThemesBloc extends Bloc<ThemesEvent, ThemesState> {
  ThemesBloc() : super(const ThemesState(themeData: AppTheme.nargacuga)) {
    on<SwitchThemeEvent>(_onSwitchThemeEvent);
  }

  void _onSwitchThemeEvent(SwitchThemeEvent event, Emitter<ThemesState> emit) {
    emit(ThemesState(themeData: event.theme));
  }
}
