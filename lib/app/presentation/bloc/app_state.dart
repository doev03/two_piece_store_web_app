part of 'app_cubit.dart';

sealed class AppState extends Equatable {}

class AppInitial extends AppState {
  AppInitial({
    required this.themeMode,
    required this.themeParams,
  });

  final ThemeMode themeMode;
  final WebAppThemeParams themeParams;

  @override
  List<Object?> get props => [themeMode, themeParams];
}
