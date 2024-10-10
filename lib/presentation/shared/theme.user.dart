import 'package:flutter/material.dart';

class ThemeColors {
  static const primaryColor = Color(0xffe21f1d);
  static const secondaryColor = Color.fromRGBO(239, 238, 238, 1);
  static const accentColor = Color.fromRGBO(182, 190, 15, 1);
}

class Palette {
  static MaterialColor kToDark = const MaterialColor(
    0xffe21f1d,
    <int, Color>{
      50: Color(0xffe21f1d), //10%
      100: Color(0xffe21f1d), //20%
      200: Color(0xffe21f1d), //30%
      300: Color(0xffe21f1d), //40%
      400: Color(0xffe21f1d), //50%
      500: Color(0xffe21f1d), //60%
      600: Color(0xffe21f1d), //70%
      700: Color(0xffe21f1d), //80%
      800: Color(0xffe21f1d), //90%
      900: Color(0xffe21f1d), //100%
    },
  );
}

class ThemeLabels {
  static const double title1 = 18.0;
  static const double label = 16.0;
  static const double body = 18.0;
  static const double display = 24.0;
}

class ThemeUser {
  static ThemeData buildTheme(Brightness brightness) {
    return loadLightTheme(brightness);
  }

  static ThemeData loadLightTheme(Brightness brightness) {
    final baseTheme = ThemeData(brightness: brightness);

    return baseTheme.copyWith(
      primaryTextTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: ThemeLabels.title1,
          fontWeight: FontWeight.bold,
        ),
        labelLarge: TextStyle(fontSize: 16.0),
        bodyLarge: TextStyle(
            fontSize: 18.0), // Tamaño de fuente para el texto del cuerpo
        displayLarge: TextStyle(
            fontSize: 24.0), // Tamaño de fuente para el título principal
      ),
      checkboxTheme: const CheckboxThemeData(
        fillColor: WidgetStatePropertyAll(
          ThemeColors.accentColor,
        ),
      ),
      appBarTheme: const AppBarTheme(
        shadowColor: Colors.black,
        backgroundColor: ThemeColors.primaryColor,
        surfaceTintColor: Colors.white,
        foregroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: ThemeColors.accentColor),
        actionsIconTheme: IconThemeData(
          color: ThemeColors.primaryColor,
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: ThemeColors.primaryColor,
        foregroundColor: ThemeColors.accentColor,
      ),
      dialogTheme: const DialogTheme(
        backgroundColor: Colors.white,
      ),
      datePickerTheme: const DatePickerThemeData(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      tabBarTheme: const TabBarTheme(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white,
        dividerColor: Colors.amber,
        indicatorColor: ThemeColors.primaryColor,
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: ThemeColors.accentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
