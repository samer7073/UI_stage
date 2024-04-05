// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_stage_project/providers/theme_provider.dart';
import 'package:flutter_application_stage_project/screens/bottomNavigationBar.dart';
import 'package:flutter_application_stage_project/screens/ticket/ticket_kanban.dart';
import 'package:flutter_application_stage_project/screens/ticket/ticket_list.dart';
import 'package:provider/provider.dart';

import '../CustomSearchDelegate.dart';
import '../notifications/notifications_page.dart';

class Ticket extends StatefulWidget {
  const Ticket({Key? key}) : super(key: key);

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  late ThemeProvider themeProvider;
  void initState() {
    // TODO: implement initState
    super.initState();
    log("test Init state activted ");
    themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    log("valeur isdark  dans initstate ${themeProvider.isDarkMode}");
  }

  List<bool> selected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar(Index: 2),
      /*
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
          */
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Tickets'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context); // Pop the current route
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              },
              icon: Icon(
                Icons.search,
                size: 30,
              )),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return NotificationsPage();
                },
              ));
            },
            icon: Icon(
              Icons.notifications_none_sharp,
              size: 30,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ToggleButtons(
                    fillColor: Colors.white,
                    selectedColor: Colors.purple,
                    constraints: BoxConstraints(
                        minHeight: 0.0, maxHeight: double.infinity),
                    renderBorder: false,
                    onPressed: (int index) {
                      setState(() {
                        for (int buttonIndex = 0;
                            buttonIndex < selected.length;
                            buttonIndex++) {
                          if (buttonIndex == index) {
                            selected[buttonIndex] = true;
                          } else {
                            selected[buttonIndex] = false;
                          }
                        }
                      });
                    },
                    children: [
                      Icon(
                        Icons.list,
                        size: 35,
                      ),
                      Icon(
                        Icons.view_kanban_outlined,
                        size: 35,
                      )
                    ],
                    isSelected: selected),
              ),
              SizedBox(height: 20),
              selected[0] ? ticketList() : ticketKanban(),
            ],
          ),
        ),
      ),
    );
  }
}
