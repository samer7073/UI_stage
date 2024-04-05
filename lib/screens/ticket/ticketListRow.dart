import 'package:flutter/material.dart';

class ticketListRow extends StatelessWidget {
  final IconData SourceIcon;
  final String id;
  final String title;
  final String owner;
  final String createTime;
  final IconData stateIcon;
  final String stateMessage;
  final Color colorContainer;
  final String messageContainer;
  final String ownerImage;

  const ticketListRow({
    super.key,
    required this.SourceIcon,
    required this.id,
    required this.title,
    required this.owner,
    required this.createTime,
    required this.stateIcon,
    required this.stateMessage,
    required this.colorContainer,
    required this.messageContainer,
    required this.ownerImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  SourceIcon,
                  color: Colors.purple,
                ),
                SizedBox(width: 5),
                Text(
                  "# " + id,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                )
              ],
            ),
            Text(
              createTime,
              style: Theme.of(context).textTheme.bodyText2,
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          owner,
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
                  stateIcon,
                  color: Colors.purple,
                ),
                SizedBox(width: 5),
                Text(
                  stateMessage,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Center(
                    child: Text(
                      messageContainer,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                      color: colorContainer,
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(20),
                          right: Radius.circular(20))),
                )
              ],
            ),
            CircleAvatar(
              backgroundImage: AssetImage(ownerImage),
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
      ],
    );
  }
}
