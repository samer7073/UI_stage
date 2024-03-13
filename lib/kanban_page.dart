// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_stage_project/stages/stage1.dart';
import 'package:flutter_application_stage_project/stages/stage2.dart';
import 'package:flutter_application_stage_project/stages/stage3.dart';
import 'package:flutter_application_stage_project/stages/stage4.dart';
import 'package:flutter_application_stage_project/stages/stage5.dart';
import 'package:flutter_application_stage_project/stages/stage6.dart';

class KanbanPage1 extends StatefulWidget {
  @override
  _KanbanPage1State createState() => _KanbanPage1State();
}

class _KanbanPage1State extends State<KanbanPage1> {
  late PageController _pageController;
  int _currentIndex = 0;
  int selectedIndex = 0;
  int _currentIndexNavBar = 0;

  List<Widget> stages = [
    Stage1Content(),
    Stage2Content(),
    Stage3Content(),
    Stage4Content(),
    Stage5Content(),
    Stage6Content(),
  ];

  List<String> stageTitles = [
    "To Do",
    "Done",
    "Blocked",
    "Rejected",
    "Review",
    "In Progress",
  ];
  List<String> stageTitles2 = [
    "5",
    "20",
    "30",
    "40",
    "50",
    "10",
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.deepPurple.shade300,
        centerTitle: true,
        title: Text(
          "Sphere Board",
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Container(
            child: Row(children: [
              for (int i = 0; i < stages.length; i++)
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _currentIndex = i;

                        _pageController.animateToPage(
                          _currentIndex,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 100, // Adjust as needed
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: _currentIndex == i
                            ? Colors.deepPurple[100]
                            : Colors.white,
                      ),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: stageTitles2[i],
                                  style: Theme.of(context).textTheme.bodyText2),
                              TextSpan(
                                text:
                                    '\n', // Add a newline character to separate the texts vertically
                              ),
                              TextSpan(
                                  text: stageTitles[i],
                                  style: Theme.of(context).textTheme.bodyText2),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ]),
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: stages,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, color: Colors.white, size: 25),
        //backgroundColor: Colors.deepPurple.shade300,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
