// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_stage_project/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late ThemeProvider themeProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    themeProvider = Provider.of<ThemeProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          themeProvider.isDarkMode == true ? Colors.black : Colors.grey[200],
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none_sharp,
              size: 30,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 70.0,
                backgroundImage: NetworkImage(
                    'https://media.istockphoto.com/id/1460122390/photo/portrait-beauty-and-facial-with-a-black-woman-in-studio-to-promote-natural-skincare-or.jpg?s=1024x1024&w=is&k=20&c=OM9PF35xRZavW_xaS4Ru-3DVdJ_9HIy-VQHZMOLVBrk='),
                backgroundColor: Colors.transparent,
              ),
            ),
            Text(
              "Theme",
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: customSwitch(
                  "Dark mode",
                  themeProvider.isDarkMode,
                  (value) {
                    setState(() {
                      log("here the value is $value");

                      themeProvider.toggleTheme(value);
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            /*
            ElevatedButton(
              onPressed: () {
                //themeProvider.toggleTheme();
              }, // Placeholder for other functionality
              child: Text("data"),
            ),
            */
          ],
        ),
      ),
    );
  }
}

Widget customSwitch(String text, bool val, onChangeMethod) {
  return Padding(
    padding: EdgeInsets.only(top: 0, left: 0, right: 0),
    child: Row(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        Spacer(),
        CupertinoSwitch(
          trackColor: Colors.grey,
          activeColor: Colors.purple,
          value: val,
          onChanged: onChangeMethod,
        )
      ],
    ),
  );
}
