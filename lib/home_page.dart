// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_stage_project/chat_page.dart';

import 'package:flutter_application_stage_project/components/my_drawer.dart';
import 'package:flutter_application_stage_project/Profile.dart';
import 'package:flutter_application_stage_project/providers/theme_provider.dart';
import 'package:flutter_application_stage_project/settings.dart';
import 'package:flutter_application_stage_project/ticket_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
      drawer: MyDrawer(
        onLogoutTap: signOut,
        onProfileTap: goToProfilePage,
        onSettingsTap: goToSettingsPage,
      ),
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
              Icons.phone_enabled_outlined,
              //color: selectedIndex == 1 ? Colors.purple : Colors.black,
            ),
            activeIcon: Icon(
              Icons.phone_enabled_rounded,
              //color: Colors.purple,
            ),
            label: AppLocalizations.of(context).calls,
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
            label: AppLocalizations.of(context).ticket,
          ),
          BottomNavigationBarItem(
            //backgroundColor: Color.fromARGB(255, 246, 214, 252),
            icon: Icon(
              Icons.settings,
              // color: selectedIndex == 3 ? Colors.purple : Colors.black,
            ),
            activeIcon: Icon(
              Icons.settings,
              // color: Colors.purple,
            ),
            label: AppLocalizations.of(context).settings,
          ),
        ],
        // selectedLabelStyle: TextStyle(color: Colors.green),
        //selectedItemColor: Colors.purple[900],
      ),
    );
  }
}
