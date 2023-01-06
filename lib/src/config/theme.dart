import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:material_color_utilities/blend/blend.dart';
import 'package:testapp/src/config/styles.dart';

class ThemeSettings {
  ThemeSettings({
    required this.sourceColor,
    required this.themeMode,
  });

  final Color sourceColor;
  final ThemeMode themeMode;
}

class ThemeSettingChange extends Notification {
  ThemeSettingChange({required this.settings});
  final ThemeSettings settings;
}

class ThemeProvider extends InheritedWidget {
  const ThemeProvider(
      {super.key,
      required this.settings,
      required this.lightDynamic,
      required this.darkDynamic,
      required super.child});

  final ValueNotifier<ThemeSettings> settings;
  final ColorScheme? lightDynamic;
  final ColorScheme? darkDynamic;

  Color blend(Color targetColor) {
    return Color(
        Blend.harmonize(targetColor.value, settings.value.sourceColor.value));
  }

  Color source(Color? target) {
    Color source = settings.value.sourceColor;
    if (target != null) {
      source = blend(target);
    }
    return source;
  }

  ColorScheme colors(Brightness brightness, Color? targetColor) {
    final isLight = brightness == Brightness.light;
    final dynamicPrimary =
        isLight ? lightDynamic?.primary : darkDynamic?.primary;
    return ColorScheme.fromSeed(
      seedColor: dynamicPrimary ?? source(targetColor),
      brightness: brightness,
      primary: isLight ? Colors.red : null,
      secondary: isLight ? Colors.white : null,
      onSurface: Colors.grey,
      background: isLight ? Colors.white : Colors.black,
      onBackground: isLight ? Colors.black : Colors.white,
      onPrimary: isLight ? Colors.white : Colors.black,
    );
  }

  AppBarTheme appBarTheme(ColorScheme colors) {
    return const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  ButtonThemeData buttonTheme(ColorScheme colors) {
    return const ButtonThemeData(
      buttonColor: Colors.blue,
      disabledColor: Colors.grey,
    );
  }

  IconThemeData iconTheme(ColorScheme colors) {
    return IconThemeData(
      color: colors.onSurface,
      size: IconSizes.sm,
    );
  }

  DialogTheme dialogTheme(ColorScheme colors) {
    return DialogTheme(
      backgroundColor: colors.background,
      shape: const RoundedRectangleBorder(
        borderRadius: Corners.medBorder,
      ),
      iconColor: colors.onSurface,
      titleTextStyle: TextStyle(
        color: colors.onSurface,
        fontWeight: FontWeight.w500,
        fontSize: FontSizes.s20,
      ),
      contentTextStyle: TextStyle(
        color: colors.onSurface,
        fontSize: FontSizes.s16,
      ),
    );
  }

  ThemeData light([Color? targetColor]) {
    final colorScheme = colors(Brightness.light, targetColor);
    return ThemeData.light().copyWith(
      colorScheme: colorScheme,
      appBarTheme: appBarTheme(colorScheme),
      buttonTheme: buttonTheme(colorScheme),
      //cardTheme: cardTheme(),
      iconTheme: iconTheme(colorScheme),
      dialogTheme: dialogTheme(colorScheme),
      //listTileTheme: listTileTheme(colorScheme),
      //navigationRailTheme: navigationRailTheme(colorScheme),
      //drawerTheme: drawerTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.background,
      useMaterial3: true,
    );
  }

  ThemeData dark([Color? targetColor]) {
    final colorScheme = colors(Brightness.dark, targetColor);
    return ThemeData.dark().copyWith(
      colorScheme: colorScheme,
      dialogTheme: dialogTheme(colorScheme),
      //appBarTheme: appBarTheme(colorScheme),
      //buttonTheme: buttonTheme(colorScheme),
      //cardTheme: cardTheme(),
      //iconTheme: iconTheme(colorScheme),
      //listTileTheme: listTileTheme(colorScheme),
      //navigationRailTheme: navigationRailTheme(colorScheme),
      //drawerTheme: drawerTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.background,
      useMaterial3: true,
    );
  }

  ThemeData theme(BuildContext context, [Color? targetColor]) {
    final brightness = MediaQuery.of(context).platformBrightness;
    return brightness == Brightness.light
        ? light(targetColor)
        : dark(targetColor);
  }

  ThemeMode toThemeMode() {
    return settings.value.themeMode;
  }

  static ThemeProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeProvider>()!;
  }

  @override
  bool updateShouldNotify(covariant ThemeProvider oldWidget) {
    return oldWidget.settings != settings;
  }
}
