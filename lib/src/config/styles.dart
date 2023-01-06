import 'package:flutter/material.dart';

class Times {
  static const fastest = Duration(milliseconds: 150);
  static const fast = Duration(milliseconds: 250);
  static const medium = Duration(milliseconds: 350);
  static const slow = Duration(milliseconds: 700);
  static const slower = Duration(milliseconds: 1000);
}

class IconSizes {
  static get xs => 12;
  static get sm => 16;
  static get med => 24;
  static get lg => 32;
  static get xl => 40;
}

class Insets {
  static double scale = 1;
  static double offsetScale = 1;
  // Regular paddings
  static double get xs => 4 * scale;
  static double get sm => 8 * scale;
  static double get med => 12 * scale;
  static double get lg => 16 * scale;
  static double get xl => 32 * scale;

  // Offset, used for the edge of the window, or to separate large sections in the app
  static double get offset => 40 * offsetScale;
}

//circular radius and border radius
class Corners {
  static const double sm = 3;
  static const Radius smRadius = Radius.circular(sm);
  static const BorderRadius smBorder = BorderRadius.all(smRadius);

  static const double med = 5;
  static const Radius medRadius = Radius.circular(med);
  static const BorderRadius medBorder = BorderRadius.all(medRadius);

  static const double lg = 8;
  static const Radius lgRadius = Radius.circular(lg);
  static const BorderRadius lgBorder = BorderRadius.all(lgRadius);
}

class Strokes {
  static const double thin = 1;
  static const double thick = 4;
}

class Shadows {
  static List<BoxShadow> get container => [
        BoxShadow(
          blurRadius: 4.0,
          offset: const Offset(0.0, 4.0),
          color: Colors.black.withOpacity(0.05),
        )
      ];
  static List<BoxShadow> get floatingBtn => [
        const BoxShadow(
          color: Colors.red,
          blurRadius: 3.0,
          spreadRadius: 0.0,
          offset: Offset(2.0, 4.0),
        )
      ];
}

class FontSizes {
  static double get scale => 1;
  static double get s10 => 10 * scale;
  static double get s11 => 11 * scale;
  static double get s12 => 12 * scale;
  static double get s14 => 14 * scale;
  static double get s16 => 16 * scale;
  static double get s18 => 18 * scale;
  static double get s20 => 20 * scale;
  static double get s24 => 24 * scale;
  static double get s36 => 36 * scale;
}

class Fonts {
  static const String Aeonik = "Aeonik";
}
