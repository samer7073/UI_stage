// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_stage_project/screens/add_task.dart';
import 'package:flutter_application_stage_project/screens/detail.dart';
import 'package:flutter_application_stage_project/screens/settings/notifications_page.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'package:flutter_application_stage_project/screens/Profile.dart';
import 'package:flutter_application_stage_project/screens/chat_page.dart';
import 'package:flutter_application_stage_project/components/my_drawer.dart';

import 'package:flutter_application_stage_project/providers/theme_provider.dart';
import 'package:flutter_application_stage_project/screens/settings/settings.dart';
import 'package:flutter_application_stage_project/screens/ticket_page.dart';

import 'bottomNavigationBar.dart';
import 'detail/kanban_page.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ThemeProvider themeProvider;
  int selectedIndex = 0;
  void initState() {
    // TODO: implement initState
    super.initState();
    log("test Init state activted ");
    themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    log("valeur isdark  dans initstate ${themeProvider.isDarkMode}");
    //selectedIndex = 0;
  }

  void signOut() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return LoginPage();
      },
    ));
  }

  void goToProfilePage() {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return ProfilePage();
      },
    ));
  }

  void goToSettingsPage() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return Settings();
      },
    ));
  }

  void goToTicketPage() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return Ticket();
      },
    ));
  }

  void goToChatPage() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return DetailPage();
      },
    ));
  }

  void goToKanaban() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return KanbanPage1();
      },
    ));
  }

  void goTocha() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return ChatPage();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    log("la valeur de is dark dans build ${themeProvider.isDarkMode}");

    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Settings();
                  },
                ));
              },
              child: CircleAvatar(
                backgroundImage: Image.asset('assets/face4.jpg').image,
                radius: 20,
              ),
            ),
          ],
        ),
        centerTitle: true,
        title: Text(
          'Sphere',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Settings();
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
      /*
      drawer: MyDrawer(
        onLogoutTap: signOut,
        onProfileTap: goToProfilePage,
        onSettingsTap: goToSettingsPage,
        onChatTap: goTocha,
      ),
      */
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            containerDashbored(
                "Totale Tickets", "15", "Résolu", "7", "Dépassé", "8"),
            containerDashbored(
                "Totale Deals", "40", "Résolu", "10", "Perdu", "30"),
            containerDashbored(
                "Totale Activités", "60", "Résolu", "10", "Dépassé", "50"),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationBar(
        Index: selectedIndex,
      ),
    );
  }

  Container containerDashbored(String tiltle, String totale, String text1,
      String nbText1, String text2, String nbText2) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 247, 237, 249),
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(20),
      width: double.infinity,
      child: Column(children: [
        Text(
          tiltle,
          style: TextStyle(
              fontSize: 24, color: Colors.black, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          totale,
          style: TextStyle(fontSize: 24, color: Colors.grey),
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  text1,
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  nbText1,
                  style: TextStyle(color: Colors.green, fontSize: 20),
                )
              ],
            ),
            Column(
              children: [
                Text(
                  text2,
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  nbText2,
                  style: TextStyle(color: Colors.red, fontSize: 20),
                )
              ],
            ),
          ],
        )
      ]),
    );
  }
  /*

  BottomNavigationBar bottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,

      //unselectedLabelStyle: TextStyle(color: Colors.green),
      //showUnselectedLabels: true,
      //showSelectedLabels: true,

      //selectedItemColor: Colors.purple,
      /*
      unselectedIconTheme: IconThemeData(
          color:
              themeProvider.isDarkMode == true ? Colors.white : Colors.black),
      unselectedItemColor:
          themeProvider.isDarkMode == true ? Colors.white : Colors.black,
      //backgroundColor: Colors.green,
      */
      onTap: (int index) {
        setState(() {
          selectedIndex = index;
          if (index == 2) {
            // Navigate to ProfilePage when "Ticket" item is tapped
            goToTicketPage();
            selectedIndex = 0;
          } else if (index == 1) {
            goToChatPage();
            selectedIndex = 0;
          } else if (index == 3) {
            goToKanaban();
            selectedIndex = 0;
          }
        });
        // selectedIndex = 0;
      },

      items: [
        BottomNavigationBarItem(
          // backgroundColor: Color.fromARGB(255, 246, 214, 252),
          icon: Icon(
            Icons.home_outlined,
            //color: selectedIndex == 0 ? Colors.purple : Colors.black,
          ),
          activeIcon: Icon(
            Icons.home,
            //color: Colors.purple,
          ),
          label: AppLocalizations.of(context).homePage,

          // TextStyle for unselected
          // TextStyle(color: selectedIndex == 0 ? Colors.purple : Colors.black),
        ),
        BottomNavigationBarItem(
          //backgroundColor: Color.fromARGB(255, 246, 214, 252),
          icon: Icon(
            Icons.calendar_today_outlined,
            //color: selectedIndex == 1 ? Colors.purple : Colors.black,
          ),
          activeIcon: Icon(
            Icons.calendar_today_rounded,
            //color: Colors.purple,
          ),
          label: AppLocalizations.of(context).activities,
        ),
        BottomNavigationBarItem(
          // backgroundColor: Color.fromARGB(255, 246, 214, 252),
          icon: Icon(
            Icons.airplane_ticket_outlined,
            //color: selectedIndex == 2 ? Colors.purple : Colors.black,
          ),
          activeIcon: Icon(
            Icons.airplane_ticket_rounded,
            // color: Colors.purple,
          ),
          label: AppLocalizations.of(context).tickets,
        ),
        BottomNavigationBarItem(
          //backgroundColor: Color.fromARGB(255, 246, 214, 252),
          icon: Icon(
            Icons.handshake_outlined,
            // color: selectedIndex == 3 ? Colors.purple : Colors.black,
          ),
          activeIcon: Icon(
            Icons.handshake_rounded,
            // color: Colors.purple,
          ),
          label: AppLocalizations.of(context).deals,
        ),
      ],
      // selectedLabelStyle: TextStyle(color: Colors.green),
      //selectedItemColor: Colors.purple[900],
    );
  }
  */
}
