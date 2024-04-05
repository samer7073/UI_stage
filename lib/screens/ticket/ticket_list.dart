// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_stage_project/screens/ticket/ticketListRow.dart';

class ticketList extends StatefulWidget {
  const ticketList({super.key});

  @override
  State<ticketList> createState() => _ticketListState();
}

class _ticketListState extends State<ticketList> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ticketListRow(
        SourceIcon: Icons.chat_outlined,
        id: "400",
        title: "samer aller au ",
        owner: "samer",
        createTime: "13:00 PM",
        stateIcon: Icons.check_circle_outlined,
        stateMessage: "Open",
        colorContainer: Colors.red,
        messageContainer: "Reply in- 2h",
        ownerImage: 'assets/face5jpg.jpg',
      ),
      ticketListRow(
        SourceIcon: Icons.chat_outlined,
        id: "400",
        title: "samer aller au ",
        owner: "samer",
        createTime: "13:00 PM",
        stateIcon: Icons.check_circle_outlined,
        stateMessage: "Open",
        colorContainer: Colors.green,
        messageContainer: "Slove in- 2h",
        ownerImage: 'assets/face5jpg.jpg',
      ),
      ticketListRow(
        SourceIcon: Icons.chat_outlined,
        id: "400",
        title: "samer aller au ",
        owner: "samer",
        createTime: "13:00 PM",
        stateIcon: Icons.check_circle_outlined,
        stateMessage: "Open",
        colorContainer: Colors.amber,
        messageContainer: " Blocked",
        ownerImage: 'assets/download.jpg',
      ),
      ticketListRow(
        SourceIcon: Icons.chat_outlined,
        id: "400",
        title: "samer aller au ",
        owner: "samer",
        createTime: "13:00 PM",
        stateIcon: Icons.check_circle_outlined,
        stateMessage: "Open",
        colorContainer: Colors.amber,
        messageContainer: "Blocked",
        ownerImage: 'assets/face3.jpg',
      ),
      ticketListRow(
        SourceIcon: Icons.chat_outlined,
        id: "400",
        title: "samer aller au ",
        owner: "samer",
        createTime: "13:00 PM",
        stateIcon: Icons.check_circle_outlined,
        stateMessage: "Open",
        colorContainer: Colors.red,
        messageContainer: "Reply in- 2h",
        ownerImage: 'assets/face4.jpg',
      ),
      ticketListRow(
        SourceIcon: Icons.chat_outlined,
        id: "400",
        title: "samer aller au ",
        owner: "samer",
        createTime: "13:00 PM",
        stateIcon: Icons.check_circle_outlined,
        stateMessage: "Open",
        colorContainer: Colors.green,
        messageContainer: "Slove in- 2h",
        ownerImage: 'assets/face4.jpg',
      )
    ]);
  }
}
