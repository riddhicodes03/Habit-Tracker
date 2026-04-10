import 'package:flutter/material.dart';

ThemeData buildDarkTheme() {
  const scheme = ColorScheme(
    brightness: Brightness.dark,

    // Backgrounds
    surface: Color(0xFF0F1117), // scaffold bg (darkest)
    surfaceContainerLowest: Color(0xFF0F1117),
    surfaceContainerLow: Color(0xFF141722), // cards
    surfaceContainer: Color(0xFF1a1d2e), // elevated cards
    surfaceContainerHigh: Color(0xFF2a2d3a), // highest surfaces
    // Primary (your purple-blue accent)
    primary: Color(0xFF9CA9F5),
    onPrimary: Color(0xFF0F1117),
    primaryContainer: Color(0xFF1a1d2e),
    onPrimaryContainer: Color(0xFF9CA9F5),

    // Secondary (muted)
    secondary: Color(0xFF6b7280),
    onSecondary: Color(0xFF0F1117),
    secondaryContainer: Color(0xFF1a1d2e),
    onSecondaryContainer: Color(0xFFe8eaf6),

    // Text
    onSurface: Color(0xFFe8eaf6), // primary text
    onSurfaceVariant: Color(0xFF6b7280), // muted text
    // Borders
    outline: Color(0xFF3a3d4a),
    outlineVariant: Color(0xFF2a2d3a),

    // Status
    error: Color(0xFFE57373),
    onError: Color(0xFF0F1117),
    errorContainer: Color(0xFF2e1a1a),
    onErrorContainer: Color(0xFFE57373),

    // Tertiary (your gold accent for sleep habit)
    tertiary: Color(0xFFFFC266),
    onTertiary: Color(0xFF0F1117),
    tertiaryContainer: Color(0xFF2e1a1a),
    onTertiaryContainer: Color(0xFFFFC266),

    scrim: Color(0xFF000000),
    shadow: Color(0xFF000000),
    inverseSurface: Color(0xFFe8eaf6),
    onInverseSurface: Color(0xFF0F1117),
    inversePrimary: Color(0xFF3D4A9E),
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    scaffoldBackgroundColor: scheme.surface,
    appBarTheme: AppBarTheme(
      backgroundColor: scheme.surface,
      foregroundColor: scheme.onSurface,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
    ),
    cardTheme: CardThemeData(
      color: scheme.surfaceContainerLow,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: scheme.outlineVariant, width: 0.5),
      ),
    ),
    dividerTheme: DividerThemeData(color: scheme.outlineVariant),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: scheme.surfaceContainerLow,
      indicatorColor: scheme.primaryContainer,
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return IconThemeData(color: scheme.primary);
        }
        return IconThemeData(color: scheme.onSurfaceVariant);
      }),
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return TextStyle(color: scheme.primary, fontSize: 11);
        }
        return TextStyle(color: scheme.onSurfaceVariant, fontSize: 11);
      }),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xFFe8eaf6)),
      bodyMedium: TextStyle(color: Color(0xFF6b7280)),
      bodySmall: TextStyle(color: Color(0xFF6b7280)),
      titleMedium: TextStyle(
        color: Color(0xFFe8eaf6),
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        color: Color(0xFFe8eaf6),
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

ThemeData buildLightTheme() {
  const scheme = ColorScheme(
    brightness: Brightness.light,

    surface: Color(0xFFF5F6FA),
    surfaceContainerLowest: Color(0xFFFFFFFF),
    surfaceContainerLow: Color(0xFFFFFFFF),
    surfaceContainer: Color(0xFFEEEFF5),
    surfaceContainerHigh: Color(0xFFE4E5EF),

    primary: Color(0xFF3D4A9E),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFDDE1FF),
    onPrimaryContainer: Color(0xFF3D4A9E),

    secondary: Color(0xFF5C6380),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFE4E5EF),
    onSecondaryContainer: Color(0xFF3D4A9E),

    onSurface: Color(0xFF1a1c2e),
    onSurfaceVariant: Color(0xFF5C6380),

    outline: Color(0xFFAAAFCC),
    outlineVariant: Color(0xFFD6DAF0),

    error: Color(0xFFE57373),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFFEDED),
    onErrorContainer: Color(0xFFB00020),

    tertiary: Color(0xFF8B6200),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFFFDFA0),
    onTertiaryContainer: Color(0xFF8B6200),

    scrim: Color(0xFF000000),
    shadow: Color(0xFF000000),
    inverseSurface: Color(0xFF1a1c2e),
    onInverseSurface: Color(0xFFF5F6FA),
    inversePrimary: Color(0xFF9CA9F5),
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    scaffoldBackgroundColor: scheme.surface,
    appBarTheme: AppBarTheme(
      backgroundColor: scheme.surface,
      foregroundColor: scheme.onSurface,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
    ),
    cardTheme: CardThemeData(
      color: scheme.surfaceContainerLow,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: scheme.outlineVariant, width: 0.5),
      ),
    ),
    dividerTheme: DividerThemeData(color: scheme.outlineVariant),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: scheme.surfaceContainerLow,
      indicatorColor: scheme.primaryContainer,
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return IconThemeData(color: scheme.primary);
        }
        return IconThemeData(color: scheme.onSurfaceVariant);
      }),
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return TextStyle(color: scheme.primary, fontSize: 11);
        }
        return TextStyle(color: scheme.onSurfaceVariant, fontSize: 11);
      }),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xFF1a1c2e)),
      bodyMedium: TextStyle(color: Color(0xFF5C6380)),
      bodySmall: TextStyle(color: Color(0xFF5C6380)),
      titleMedium: TextStyle(
        color: Color(0xFF1a1c2e),
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        color: Color(0xFF1a1c2e),
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
