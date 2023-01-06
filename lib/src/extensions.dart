import 'package:flutter/material.dart';
import 'package:testapp/src/config/styles.dart';


//this extends the buildcontext so that you can
//access the textTheme by calling context.
extension TypographyUtils on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme.apply(
        fontFamily: 'Aeonik',
        bodyColor: colors.onSurface,
        displayColor: colors.onSurface,
      );
  ColorScheme get colors => theme.colorScheme;

  TextStyle? get bodyLarge => textTheme.bodyLarge?.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: FontSizes.s16,
      );
  TextStyle? get bodyMedium => textTheme.bodyMedium
      ?.copyWith(fontSize: FontSizes.s14, color: colors.onSurface);
  TextStyle? get bodySmall => textTheme.bodySmall?.copyWith(
        fontSize: FontSizes.s12,
      );
  TextStyle? get headlineLarge => textTheme.headlineLarge?.copyWith(
        fontSize: FontSizes.s24,
        fontWeight: FontWeight.w600,
      );
  TextStyle? get headlineMedium => textTheme.headlineMedium?.copyWith(
        fontSize: FontSizes.s20,
        fontWeight: FontWeight.w600,
      );
  TextStyle? get headlineSmall => textTheme.headlineSmall?.copyWith(
        fontSize: FontSizes.s18,
        fontWeight: FontWeight.w600,
      );
  TextStyle? get titleLarge => textTheme.titleLarge
      ?.copyWith(fontSize: FontSizes.s36, color: colors.onSurface);
}
