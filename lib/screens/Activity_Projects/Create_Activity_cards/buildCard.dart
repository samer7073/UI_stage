
/////////////////////////////////////////// Activity Card Details /////////////////////////////////////////////////

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_stage_project/screens/Activity_Projects/Create_Activity_cards/Activity_Card_Design.dart';

class buildCard extends StatelessWidget {
  const buildCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
     
      buildProjectRow(
        
        "Meet",
        "meeting day ",
        [
          "img1.jpg",
          "img2.jpg",
          "img1.jpg",
          "img2.jpg",
          "img1.jpg",
          "img2.jpg",
        ],
        Colors.blue,
        0.3,
        "30%",
        "28/02/2024",
        "To Do",
        "Urgent",
        "09:00-10:00",
       
        context,
      ),
    ],
  );
  }
}