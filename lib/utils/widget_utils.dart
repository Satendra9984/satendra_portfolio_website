import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class WidgetUtils {
  static BoxDecoration getBoxDecoration({
    required double offset,
    required double blurRadius,
    required double spreadRadius,
    Color? backgroundColor,
    double borderRadius = 8.0,
    bool inset = false,
    bool isDark = false,
  }) {
    backgroundColor ?? Colors.grey.shade300;
    return BoxDecoration(
      color: isDark ? Colors.grey.shade900 : backgroundColor,
      borderRadius: BorderRadius.circular(borderRadius),
      boxShadow: [
        BoxShadow(
          color: isDark ? Colors.black : Colors.grey.shade500,
          offset: Offset(offset, offset),
          blurRadius: blurRadius,
          spreadRadius: 1,
          inset: inset,
        ),
        BoxShadow(
          color: isDark ? Colors.grey.shade100 : Colors.white,
          offset: Offset(-offset, -offset),
          blurRadius: blurRadius,
          spreadRadius: 1,
          inset: inset,
        ),
      ],
    );
  }
}
