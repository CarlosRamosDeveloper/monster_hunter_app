part of 'themes_bloc.dart';

abstract class ThemesEvent extends Equatable {
  const ThemesEvent();

  @override
  List<Object> get props => [];
}

class SwitchThemeEvent extends ThemesEvent {
  final AppTheme theme;

  const SwitchThemeEvent({
    required this.theme,
  });
}
