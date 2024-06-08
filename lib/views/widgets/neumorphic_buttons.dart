import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class AnimatedNeumorphicButtons extends StatefulWidget {
  // final String title;
  final Function onPress;
  final bool isDark;
  final Widget child;
  final EdgeInsets padding, margin;

  const AnimatedNeumorphicButtons({
    required this.onPress,
    required this.child,
    bool? isDark,
    EdgeInsets? margin,
    EdgeInsets? padding,
    super.key,
  })  : isDark = isDark ?? false,
        margin = margin ?? EdgeInsets.zero,
        padding = padding ?? EdgeInsets.zero;

  @override
  State<AnimatedNeumorphicButtons> createState() =>
      _AnimatedNeumorphicButtonsState();
}

class _AnimatedNeumorphicButtonsState extends State<AnimatedNeumorphicButtons> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    double offset = widget.isDark ? 2.0 : 2.0;
    double blurRadius = widget.isDark ? 2.0 : 2.0;
    double spreadRadius = widget.isDark ? 1.0 : 1.0;
    return Listener(
      onPointerUp: (_) {
        setState(() {
          isPressed = false;
        });
        widget.onPress();
      },
      onPointerDown: (_) {
        setState(() {
          isPressed = true;
        });
        // widget.onPress();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        padding: widget.padding,
        margin: widget.margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: widget.isDark ? Colors.grey.shade900 : Colors.grey.shade300,
          boxShadow: [
            BoxShadow(
              offset: Offset(offset, offset),
              blurRadius: blurRadius,
              spreadRadius: spreadRadius,
              color: widget.isDark ? Colors.black : Colors.grey.shade500,
              inset: isPressed,
            ),
            BoxShadow(
              offset: Offset(-offset, -offset),
              blurRadius: blurRadius,
              spreadRadius: spreadRadius,
              color: widget.isDark
                  ? isPressed
                      ? Colors.grey.shade700
                      : Colors.grey.shade300
                  : Colors.white,
              inset: isPressed,
            ),
          ],
        ),
        child: widget.child,
      ),
    );
  }
}
