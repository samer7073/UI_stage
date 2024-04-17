
//////////////////////////////////// Purple Button (Projet, Activity, Home) //////////////////////////////////

import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_stage_project/screens/Activity_Projects/Activity_list_view.dart';
import 'package:flutter_application_stage_project/screens/Activity_Projects/display_Activity_Page.dart';
import 'package:flutter_application_stage_project/screens/Activity_Projects/project_Page/add_project.dart';

class floatbutton extends StatefulWidget {
  @override
  State<floatbutton> createState() => _floatbuttonState();
}

class _floatbuttonState extends State<floatbutton>
    with TickerProviderStateMixin {
  Animation<double>? _animation;
  AnimationController? _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController!);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionBubble(
      items: <Bubble>[
        Bubble(
          title: "Create Project",
          iconColor: Colors.white,
          bubbleColor: Colors.purple,
          icon: Icons.folder_copy_outlined,
          titleStyle: TextStyle(fontSize: 16, color: Colors.white),
          onPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddProjectPage()),
            );
            _animationController!.reverse();
          },
        ),
        Bubble(
          title: "Create Activity",
          iconColor: Colors.white,
          bubbleColor: Colors.purple,
          icon: Icons.feed_outlined,
          titleStyle: TextStyle(fontSize: 16, color: Colors.white),
          onPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateTask()),
            );
            _animationController!.reverse();
          },
        ),
        Bubble(
          title: "Home",
          iconColor: Colors.white,
          bubbleColor: Colors.purple,
          icon: Icons.home,
          titleStyle: TextStyle(fontSize: 16, color: Colors.white),
          onPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailPage()),
            );
            _animationController!.reverse();
          },
        ),
      ],
      animation: _animation!,
      onPress: () => _animationController!.isCompleted
          ? _animationController!.reverse()
          : _animationController!.forward(),
      backGroundColor: Colors.purple,
      iconColor: Colors.white,
      iconData: Icons.add,
    );
  }
}
