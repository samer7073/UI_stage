
////////////////////////////////////  Hey there!!! ///////////////////////////////////////////////////////////

import 'package:flutter/material.dart';
import 'package:flutter_application_stage_project/screens/dashboard_Page/custom_card.dart';

class welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomCard(
        padding: const EdgeInsets.all(6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Text.rich(
                TextSpan(
                  text: 'Hey there!\n\n',
                  style: const TextStyle(
                    fontSize: 21.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Ready to dive\n into productivity?',
                      style: TextStyle(
                        fontSize: 14.5,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
           SizedBox(width: 23,),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                "assets/images/55.png",
                width: 170,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ));
  }
}
