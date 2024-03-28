// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_stage_project/providers/theme_provider.dart';
import 'package:flutter_application_stage_project/screens/bottomNavigationBar.dart';
import 'package:provider/provider.dart';

import 'CustomSearchDelegate.dart';
import 'detail/TeamFolderPage.dart';
import 'notifications_page.dart';

class Ticket extends StatefulWidget {
  const Ticket({super.key});

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
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.airplane_ticket_sharp),
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
                        // color: Colors.purple[200],
                      ),
                      Icon(
                        Icons.view_kanban_outlined,
                        size: 35,
                        //color: Colors.purple[200],
                      )
                    ],
                    isSelected: selected),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return TeamFolderPage();
                    },
                  ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Tooltip(
                          message: "Telephone",
                          child: Icon(
                            Icons.local_phone_outlined,
                            color: Colors.purple,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "# 301",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        )
                      ],
                    ),
                    Text(
                      "12:58 PM",
                      style: Theme.of(context).textTheme.bodyText2,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Unable to update app",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Steven Clarke",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle_outlined,
                        color: Colors.purple,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Open",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Tooltip(
                        message: " Slove in 2h ",
                        child: Container(
                          child: Center(
                            child: Text(
                              "Slove in- 2h",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(20),
                                  right: Radius.circular(20))),
                        ),
                      )
                    ],
                  ),
                  Tooltip(
                    message: "Steven Clark",
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/download.jpg'),
                      radius: 15,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 1,
                color: Colors.purple,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return TeamFolderPage();
                        },
                      ));
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.chat_outlined,
                          color: Colors.purple,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "# 302",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  Text(
                    "12:58 PM",
                    style: Theme.of(context).textTheme.bodyText2,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Facing issue with the new update",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "David Davidson",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle_outlined,
                        color: Colors.purple,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Open",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            "Reply in- 2h",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(20),
                                right: Radius.circular(20))),
                      )
                    ],
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/face2.jpg'),
                    radius: 15,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 1,
                color: Colors.purple,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.mail_outline_outlined,
                        color: Colors.purple,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "# 303",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      )
                    ],
                  ),
                  Text(
                    "12:50 PM",
                    style: Theme.of(context).textTheme.bodyText2,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "GPS not Working",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Casie Fletcher",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle_outlined,
                        color: Colors.purple,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Open",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            "Blocked",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(20),
                                right: Radius.circular(20))),
                      )
                    ],
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/face3.jpg'),
                    radius: 15,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 1,
                color: Colors.purple,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.phone_outlined,
                        color: Colors.purple,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "# 302",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      )
                    ],
                  ),
                  Text(
                    "12:58 PM",
                    style: Theme.of(context).textTheme.bodyText2,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Unable to update my Zylker phone",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Ann",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle_outlined,
                        color: Colors.purple,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Open",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            "Slove in- 2h",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(20),
                                right: Radius.circular(20))),
                      )
                    ],
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/face4.jpg'),
                    radius: 15,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 1,
                color: Colors.purple,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.mail_outline,
                        color: Colors.purple,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "# 302",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      )
                    ],
                  ),
                  Text(
                    "12:58 PM",
                    style: Theme.of(context).textTheme.bodyText2,
                  )
                ],
              ),
              Text(
                "Which products do you sell",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Amillie",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle_outlined,
                        color: Colors.purple,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Open",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            "Reply in- 2h",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(20),
                                right: Radius.circular(20))),
                      )
                    ],
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/face5jpg.jpg'),
                    radius: 15,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 1,
                color: Colors.purple,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.chat_outlined,
                        color: Colors.purple,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "# 306",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      )
                    ],
                  ),
                  Text(
                    "12:58 PM",
                    style: Theme.of(context).textTheme.bodyText2,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Which products do you sell",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Amillie",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle_outlined,
                        color: Colors.purple,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Open",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            "Slove in- 2h",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(20),
                                right: Radius.circular(20))),
                      )
                    ],
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/face5jpg.jpg'),
                    radius: 15,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

