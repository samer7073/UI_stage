// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_application_stage_project/home_page.dart';
import 'package:flutter_application_stage_project/login_page.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerfierPassword extends StatefulWidget {
  const VerfierPassword({super.key});

  @override
  State<VerfierPassword> createState() => _VerfierPasswordState();
}

class _VerfierPasswordState extends State<VerfierPassword> {
  void confirmUser() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            SizedBox(
              height: 50,
            ),
            Text(
              "verification code",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text("nous avons envoyé la vérification du code à votre email"),
            SizedBox(
              height: 40,
            ),
            OtpTextField(
              keyboardType: TextInputType.number,
              mainAxisAlignment: MainAxisAlignment.center,
              numberOfFields: 6,
              fillColor: Colors.purple.withOpacity(0.1),
              filled: true,
              onSubmit: (value) {
                print("OTP CODE EST : $value");
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*
                MyButton(onTap: confirmUser, text: "Confirmer"),
                SizedBox(width: 50,),
                MyButton(onTap: confirmUser, text: "Annuler"),
                */

                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return HomePage();
                        },
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 16),
                      backgroundColor: Color.fromARGB(255, 246, 228, 250),
                    ),
                    child: const Text(
                      "Confirmer",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 145, 33, 250),
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return LoginPage();
                        },
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 16),
                      backgroundColor: Color.fromARGB(255, 246, 228, 250),
                    ),
                    child: const Text(
                      "Annuler",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 145, 33, 250),
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
