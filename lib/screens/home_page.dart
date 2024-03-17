// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_stage_project/screens/add_task.dart';
import 'package:flutter_application_stage_project/screens/detail.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'package:flutter_application_stage_project/screens/Profile.dart';
import 'package:flutter_application_stage_project/screens/chat_page.dart';
import 'package:flutter_application_stage_project/components/my_drawer.dart';
import 'package:flutter_application_stage_project/screens/kanban_page.dart';
import 'package:flutter_application_stage_project/providers/theme_provider.dart';
import 'package:flutter_application_stage_project/screens/settings/settings.dart';
import 'package:flutter_application_stage_project/screens/ticket_page.dart';

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
              signOut();
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
      body: Container(
        child: Center(
          child: Text('Espace réservé pour le contenu principal'),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
      ),
    );
  }
}
