
///////////////////// 4 cards (To do, in progress, completed, canceled) ////////////////////

import 'package:flutter/material.dart';
import 'package:flutter_application_stage_project/screens/dashboard_Page/custom_card.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ActivityDetailsCard extends StatelessWidget {
  ActivityDetailsCard({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> stage = [
    {"text": "To Do", "icon": "assets/images/12.png"},
    {"text": "In Progress ", "icon": "assets/images/7.png"},
    {"text": "Completed ", "icon": "assets/images/8.png"},
    {"text": "Canceled", "icon": "assets/images/9.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: stage.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:  2,
        crossAxisSpacing:  15,
        mainAxisSpacing: 12.0,
      ),
      itemBuilder: (context, index) {
        return CustomCard(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      stage[index]["icon"],
                      width: 42,
                      height: 40,
                    ),
                    SizedBox(height: 8),
                    Text(
                      stage[index]["text"],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  child: CircularPercentIndicator(
                    radius: 23.0,
                    lineWidth: 3.5,
                    percent: 0.7,
                    center: Text(
                      "70%",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    progressColor:  Color.fromARGB(255, 242, 176, 252),
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 222, 142, 236),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(11),
                      bottomRight: Radius.circular(11),
                    ),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.all(2),
                    icon: Icon(Icons.arrow_forward, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
