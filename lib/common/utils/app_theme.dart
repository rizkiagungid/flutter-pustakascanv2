import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

Brightness brightness =
    SchedulerBinding.instance.platformDispatcher.platformBrightness;
bool isDarkMode = brightness == Brightness.dark;

class AppThemes {
  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      fontFamily: 'Plus Jakarta Sans',
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: isDarkMode ? const Color(0xDDFFFFFF) : const Color(0x89000000),
        ),
        actionsIconTheme: IconThemeData(
          color: isDarkMode ? const Color(0xDDFFFFFF) : const Color(0x89000000),
        ),
        titleTextStyle: TextStyle(
          color: isDarkMode ? const Color(0xDD000000) : const Color(0xDD000000),
        ),
        centerTitle: true,
        toolbarTextStyle: TextStyle(
          color: isDarkMode ? const Color(0xDDFFFFFF) : const Color(0xDD000000),
        ),
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        color: colorScheme.surface,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(color: Color(0xFF6BB9F0)),
          unselectedIconTheme: IconThemeData(color: Color(0xFFB6B6B6))),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          color: isDarkMode ? const Color(0xDDFFFFFF) : const Color(0xDD000000),
        ),
      ),
      colorScheme: colorScheme,
      cardColor: colorScheme.surface,
      canvasColor: colorScheme.surface,
      scaffoldBackgroundColor: colorScheme.surface,
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
        iconColor: WidgetStatePropertyAll<Color>(colorScheme.primary),
      )),
      highlightColor: Colors.transparent,
      focusColor: focusColor,
    );
  }

  static ColorScheme lightColorScheme = const ColorScheme(
    primary: Color(0xFF4A6572),
    secondary: Color(0xFFF8F8F8),
    surface: Color(0xFFFAFBFB),
    error: Colors.red,
    onPrimary: Colors.grey,
    onSecondary: Color(0xFF322942),
    brightness: Brightness.light,
    onSurface: Color(0xFF241E30),
    onError: Colors.white,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Color.fromARGB(255, 20, 7, 99),
    secondary: Color.fromARGB(255, 28, 53, 189),
    surface: Color(0xff1E2746),
    // White with 0.05 opacity
    onError: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    brightness: Brightness.dark,
    onSurface: Colors.white,
    error: Colors.white,
  );
}
