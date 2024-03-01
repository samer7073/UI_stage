// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_stage_project/components/my_drawer.dart';
import 'package:flutter_application_stage_project/Profile.dart';
import 'package:flutter_application_stage_project/settings.dart';

import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

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

  @override
  Widget build(BuildContext context) {
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
          child: Text('Placeholder for main content'),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //unselectedLabelStyle: TextStyle(color: Colors.green),
        showUnselectedLabels: true,
        showSelectedLabels: true,
        currentIndex: selectedIndex,
        //backgroundColor: Colors.green,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            // backgroundColor: Color.fromARGB(255, 246, 214, 252),
            icon: Icon(
              Icons.home_outlined,
              color: selectedIndex == 0 ? Colors.purple : Colors.black,
            ),
            activeIcon: Icon(
              Icons.home,
              color: Colors.purple,
            ),
            label: 'Home',

            // TextStyle for unselected
            // TextStyle(color: selectedIndex == 0 ? Colors.purple : Colors.black),
          ),
          BottomNavigationBarItem(
            //backgroundColor: Color.fromARGB(255, 246, 214, 252),
            icon: Icon(
              Icons.phone_enabled_outlined,
              color: selectedIndex == 1 ? Colors.purple : Colors.black,
            ),
            activeIcon: Icon(
              Icons.phone_enabled_rounded,
              color: Colors.purple,
            ),
            label: 'Appels',
          ),
          BottomNavigationBarItem(
            // backgroundColor: Color.fromARGB(255, 246, 214, 252),
            icon: Icon(
              Icons.message_outlined,
              color: selectedIndex == 2 ? Colors.purple : Colors.black,
            ),
            activeIcon: Icon(
              Icons.message_rounded,
              color: Colors.purple,
            ),
            label: 'Discussions',
          ),
          BottomNavigationBarItem(
            //backgroundColor: Color.fromARGB(255, 246, 214, 252),
            icon: Icon(
              Icons.settings,
              color: selectedIndex == 3 ? Colors.purple : Colors.black,
            ),
            activeIcon: Icon(
              Icons.settings,
              color: Colors.purple,
            ),
            label: 'Settings',
          ),
        ],
        // selectedLabelStyle: TextStyle(color: Colors.green),
        selectedItemColor: Colors.purple[900],
      ),
    );
  }
}
