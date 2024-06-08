import 'package:flutter/material.dart';

class ResponsiveScreenWrapperWidget extends StatelessWidget {
  final Widget mobileScreen;
  final Widget desktopScreen;

  const ResponsiveScreenWrapperWidget({
    required this.mobileScreen,
    required this.desktopScreen,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 950) {
          return mobileScreen;
        } else {
          return desktopScreen;
        }
      },
    );
  }
}
