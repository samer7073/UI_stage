
/////////////////////////// Activity Card Design ///////////////////////////////////////////////////

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_application_stage_project/screens/Activity_Projects/Create_Activity_cards/members.dart';

Widget buildProjectRow(
  String title,
  String description,
  List<String> filenames,
  Color color,
  double percentage,
  String textPercentage,
  String textDate,
  String progress,
  String priority,
  String time,
  BuildContext context,
) {
  bool showAllImages = filenames.length <= 3;
  double availableScreenWidth = MediaQuery.of(context).size.width;
  double widthPercentage = 0.8;

  return GestureDetector(
    child: Card(
      color: Color.fromARGB(255, 211, 234, 254),
      margin: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 3,
            ),
            Container(
              width: availableScreenWidth * widthPercentage,
              height: 1.5,
              color: color,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                CircularPercentIndicator(
                  radius: 12.0,
                  lineWidth: 2.0,
                  animation: true,
                  percent: percentage,
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: color,
                  backgroundColor: Colors.grey,
                ),
                const SizedBox(width: 5),
                Text(
                  textPercentage,
                  style: TextStyle(fontSize: 13),
                ),
                const SizedBox(width: 5),
                Spacer(),
                Icon(
                  Icons.calendar_month,
                  color: color,
                ),
                const SizedBox(width: 5),
                Text(
                  textDate,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  progress,
                  style: TextStyle(fontSize: 13),
                ),
                Spacer(),
                Text(
                  priority,
                  style: TextStyle(fontSize: 13),
                ),
                Spacer(),
                Icon(
                  Icons.access_time,
                  color: color,
                ),
                const SizedBox(width: 5),
                Text(
                  time,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                for (int i = 0; i < (showAllImages ? filenames.length : 3); i++)
                  members(filename: filenames[i]),
                if (!showAllImages)
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 194, 193, 193),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '+${filenames.length - 3}',
                      style: TextStyle(
                          fontSize: 14, color: Color.fromARGB(255, 65, 65, 65)),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
