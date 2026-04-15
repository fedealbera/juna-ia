import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  static const int _defaultColorHex = 0xFF673AB7; // Deep purple

  ThemeBloc() : super(ThemeState(
          primaryColorHex: _defaultColorHex,
          themeData: ThemeState.buildThemeData(_defaultColorHex),
        )) {
    on<LoadMockThemeEvent>(_onLoadMockTheme);
  }

  void _onLoadMockTheme(LoadMockThemeEvent event, Emitter<ThemeState> emit) {
    // Mocking JSON response for dynamic white-label theme (e.g. from Initial Configuration JSON)
    const primaryColorHex = 0xFFFF5733; // Orange Color

    emit(ThemeState(
      primaryColorHex: primaryColorHex,
      themeData: ThemeState.buildThemeData(primaryColorHex),
    ));
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return state.toJson();
  }
}
