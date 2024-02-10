import 'package:flutter/material.dart';
import 'package:personal_portfolio_website/utils/widget_utils.dart';

class StatusBarWidget extends StatelessWidget {
  final StatusBarData statusBarData;
  final Color barColor;

  final double maxYears;
  final double maxWidth;
  final double maxHeight;

  const StatusBarWidget({
    required this.statusBarData,
    required this.barColor,
    double? maxYears,
    double? width,
    height,
    super.key,
  })  : maxWidth = width ?? 240,
        maxHeight = height ?? 22.0,
        maxYears = maxYears ?? 3;

  @override
  Widget build(BuildContext context) {
    double offset = 1.5;
    double blurRadius = 1;
    double spreadRadius = 1;

    double barWidth = (maxWidth / maxYears) * statusBarData.years - 8.8;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            '${statusBarData.title}, ${statusBarData.years} years',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.grey.shade700,
              fontSize: 12.0,
            ),
          ),
        ),
        const SizedBox(height: 2.0),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4.4, vertical: 4),
          width: maxWidth,
          height: maxHeight,
          decoration: WidgetUtils.getBoxDecoration(
            offset: offset + 0.5,
            blurRadius: blurRadius + 1,
            spreadRadius: spreadRadius + 1,
            borderRadius: 50.0,
            backgroundColor: Colors.grey.shade300,
            inset: true,
          ),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 0.5),
                height: maxHeight - 4.0,
                width: barWidth,
                decoration: WidgetUtils.getBoxDecoration(
                  offset: offset - 0.5,
                  blurRadius: blurRadius,
                  spreadRadius: spreadRadius,
                  backgroundColor: barColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class StatusBarData {
  final String title;
  final double years;

  StatusBarData({
    required this.title,
    required this.years,
  });
}
