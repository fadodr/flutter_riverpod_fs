import 'package:flutter_screenutil/flutter_screenutil.dart';

double calculateFontSize(double size, double min, double max) {
  if (size.sp > max) return max;
  if (size.sp < min) return min;
  return size.sp;
}

double calculateButtonHeight(double size, double min, double max) {
  if (size.h > max) return max;
  if (size.h < min) return min;
  return size.h;
}

double calculateWidth(double size, double min, double max) {
  if (size.w > max) return max;
  if (size.w < min) return min;
  return size.w;
}
