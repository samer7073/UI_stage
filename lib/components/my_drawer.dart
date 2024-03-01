// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_stage_project/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  void Function()? onProfileTap;
  void Function()? onLogoutTap;
  void Function()? onSettingsTap;
  MyDrawer({super.key, required this.onProfileTap, required this.onLogoutTap,required this.onSettingsTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      //shadowColor: Colors.purple,
      //backgroundColor: Colors.purple,
      child: Column(
        children: [
          DrawerHeader(
              child: Icon(
            Icons.person,
            color: Colors.white,
            size: 64,
          )),
          MyListTile(
            icon: Icons.home,
            text: "H O M E",
            onTap: () => Navigator.pop(context),
          ),
          MyListTile(
            icon: Icons.person,
            text: "P R O F I L E",
            onTap: onProfileTap,
          ),
          MyListTile(
            icon: Icons.settings,
            text: "S E T T I N G S",
            onTap: onSettingsTap,
          ),
          MyListTile(
            icon: Icons.logout,
            text: "L O G O U T",
            onTap: onLogoutTap,
          ),
        ],
      ),
    );
  }
}
