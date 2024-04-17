
////////////////////////////////////////// Create Activity Listview Page ////////////////////////////////

import 'package:flutter/material.dart';
import 'package:flutter_application_stage_project/screens/Activity_Projects/activity_page/Details_page/add_details.dart';
import 'package:flutter_application_stage_project/screens/Activity_Projects/activity_page/add_task.dart';

class CreateTask extends StatelessWidget {
  const CreateTask({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Builder(builder: (BuildContext context) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(120.0),
            child: AppBar(
              title: const Text(
                'Create New Task',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.purpleAccent,
              elevation: 0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple, Colors.purpleAccent],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: SafeArea(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _TabButton(
                            text: 'Activity',
                            onPressed: () =>
                                DefaultTabController.of(context).animateTo(0)),
                        _TabButton(
                            text: 'Details',
                            onPressed: () =>
                                DefaultTabController.of(context).animateTo(1)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              AddTaskPage(),
              AddDetailPage(),
            ],
          ),
        );
      }),
    );
  }
}

class _TabButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const _TabButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
