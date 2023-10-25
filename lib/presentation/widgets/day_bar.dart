import 'package:flutter/material.dart';
import 'package:todo_app/utils/consts.dart';

class DayBar extends StatefulWidget {
  final int index;
  final String day;
  const DayBar({super.key, required this.index, required this.day});

  @override
  State<DayBar> createState() => _DayBarState();
}

class _DayBarState extends State<DayBar> {
  @override
  Widget build(BuildContext context) {
     int colorIndex = widget.index % 5;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        decoration: BoxDecoration(
            color: AppConstants.tileColors[colorIndex],
            border: Border.all(width: 1, color: AppConstants.tileColors[colorIndex]),
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            widget.day,
            style: TextStyle(color: AppConstants.tileTextColors[colorIndex], fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
