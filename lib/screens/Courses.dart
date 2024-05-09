import 'package:flutter/material.dart';

import 'Dashboard.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            buildDay("Mon"),
            buildDay("Tue"),
            buildDay("Wed"),
            buildDay("Thu"),
            buildDay("Fri"),
            buildDay("Sat"),
            buildDay("Sun"),
          ],
        ),
        TableRow(
          children: [
            buildDate(26),
            buildDate(27),
            buildDate(28),
            buildDate(29),
            buildDate(30),
            buildDate(31),
            buildDate(1),
          ],
        ),
        // Add more rows for different weeks
      ],
    );
  }
}
