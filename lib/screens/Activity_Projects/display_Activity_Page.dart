
/////////////////////////////////////// Display Activity Page ////////////////////////////////////////

import 'package:flutter/material.dart';
import 'package:flutter_application_stage_project/screens/Activity_Projects/Create_Activity_cards/buildCard.dart';
import 'package:flutter_application_stage_project/screens/Activity_Projects/Entity/floatingbutton.dart';
import 'package:flutter_application_stage_project/screens/Activity_Projects/display_tasks_page/buildTimeline.dart';
import 'package:flutter_application_stage_project/screens/Activity_Projects/Entity/calendar.dart';

class DetailPage extends StatefulWidget {
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 204, 247),
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          SliverToBoxAdapter(
            child: Container(
              height: 5000,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
/////////////////////////calendar////////////////////////////////////////////////
                  calendar(),

//////////////////////////Sphere and  timeline  row////////////////////////////////
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sphere',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Timeline',
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.keyboard_arrow_down_outlined)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildTimeline(),
                      Text("09:00"),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Container(
                            width: 150.0,
//////////////////////////////card///////////////////////////////////////////////////////
                            child: buildCard()
////////////////////////////////////////////////////////////////////////////////////////////
                            ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

///////////////////////////////////////////FloatingActionButton////////////////////////////////////////////////////
      floatingActionButton: floatbutton(),

    );
  }

///////////////////////////////////widget Appbar///////////////////////////////////////////////////////////////////
  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 90,
      backgroundColor: Color.fromARGB(255, 240, 204, 247),
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(Icons.arrow_back_sharp, color: Colors.white),
        iconSize: 30,
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Module tasks',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'You have 3 tasks for today!',
                style: TextStyle(fontSize: 12, color: Colors.grey[700]),
              )
            ]),
      ),
    );
  }
}
