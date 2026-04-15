import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThemeState extends Equatable {
  final ThemeData themeData;
  final int primaryColorHex;

  const ThemeState({
    required this.themeData,
    required this.primaryColorHex,
  });

  @override
  List<Object> get props => [themeData, primaryColorHex];

  Map<String, dynamic> toJson() {
    return {
      'primaryColorHex': primaryColorHex,
    };
  }

  factory ThemeState.fromJson(Map<String, dynamic> json) {
    final hex = json['primaryColorHex'] as int? ?? 0xFF673AB7; // Default deep purple
    return ThemeState(
      primaryColorHex: hex,
      themeData: buildThemeData(hex),
    );
  }

  static ThemeData buildThemeData(int hex) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Color(hex)),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(hex),
        foregroundColor: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(hex),
          foregroundColor: Colors.white,
        )
      ),
      useMaterial3: true,
    );
  }
}
