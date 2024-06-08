




import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:personal_portfolio_website/models/experience_data_model.dart';

class ExperienceTile extends StatefulWidget {
  final ExperienceDataModel model;
  const ExperienceTile({required this.model, super.key});

  @override
  State<ExperienceTile> createState() => _ExperienceTileState();
}

class _ExperienceTileState extends State<ExperienceTile> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 0.0),
        color: Colors.transparent,
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 20,
              sigmaY: 20,
            ),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white.withOpacity(0.1)),
                borderRadius: BorderRadius.circular(8.0),
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.2),
                    Colors.white.withOpacity(0.1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.model.role,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade100,
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        '${widget.model.startDate}-${widget.model.endDate}',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade100,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    '@ ${widget.model.company}',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade100,
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(height: 12.0),

                  if (_isSelected)
                    Text(
                      widget.model.experience,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade100,
                        fontSize: 14.0,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
