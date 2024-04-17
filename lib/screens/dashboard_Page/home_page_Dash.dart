
///////////////////////////////////// Dashboard Home Page /////////////////////////////////////////////

import 'package:flutter/material.dart';
import 'package:flutter_application_stage_project/screens/dashboard_Page/stage.dart';
import 'package:flutter_application_stage_project/screens/dashboard_Page/bargraph.dart';
import 'package:flutter_application_stage_project/screens/dashboard_Page/line_chart.dart';
import 'package:flutter_application_stage_project/screens/dashboard_Page/total_tasks.dart';
import 'package:flutter_application_stage_project/screens/dashboard_Page/welcoming_part.dart';

class HomePageDash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizedBox _height(BuildContext context) => SizedBox(
          height: 15,
        );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                welcome(),
                _height(context),
                counting(),
                _height(context),
                ActivityDetailsCard(),
                _height(context),
                BarGraph(),
                _height(context),
                LineChartCard(),
                _height(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
