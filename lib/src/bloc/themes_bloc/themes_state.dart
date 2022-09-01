part of 'themes_bloc.dart';

class ThemesState extends Equatable {
  const ThemesState({
    required this.themeData,
  });
  final AppTheme themeData;
  @override
  List<Object> get props => [themeData];
}
