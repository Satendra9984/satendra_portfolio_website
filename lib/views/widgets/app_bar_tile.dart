import 'package:flutter/material.dart';

class AppBarTile extends StatelessWidget {
  const AppBarTile({
    super.key,
    required this.index,
    required this.iconData,
    required this.title,
    this.offset = 1.0,
    this.blurradius = 1.0,
    required this.isCurrent,
  });

  final double offset;
  final double blurradius;
  final IconData iconData;
  final String title;
  final int index;
  final bool isCurrent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCurrent ? Colors.grey.shade900 : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: isCurrent ? Colors.black : Colors.grey.shade500,
            offset: Offset(offset, offset),
            blurRadius: blurradius,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: isCurrent ? Colors.grey.shade100 : Colors.white,
            offset: Offset(-offset, -offset),
            blurRadius: blurradius,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            iconData,
            color: isCurrent ? Colors.white : Colors.black,
            size: 16.0,
          ),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: isCurrent ? Colors.white : Colors.black,
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
