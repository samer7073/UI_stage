// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_application_stage_project/screens/home_page.dart';
import 'package:flutter_application_stage_project/providers/theme_provider.dart';
import 'package:flutter_application_stage_project/screens/verifier_password.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final urlController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late ThemeProvider themeProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    themeProvider = Provider.of<ThemeProvider>(context, listen: false);
  }

  void signUser() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    log('build ${themeProvider.isDarkMode}');
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _header(context),
            _inputField(context),
            _forgotPassword(context),
            // _signup(context),
          ],
        ),
      ),
    );
  }

  _header(context) {
    return Column(
      children: [
        Text(
          AppLocalizations.of(context).headerLogin,
          style: Theme.of(context).textTheme.headline1,
        ),
        Text(AppLocalizations.of(context).textLogin),
      ],
    );
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          decoration: InputDecoration(
              hintText: AppLocalizations.of(context).email,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none),
              fillColor: Colors.purple.withOpacity(0.1),
              filled: true,
              prefixIcon: const Icon(
                Icons.email,
              )),
        ),
        const SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context).password,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: Colors.purple.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(
              Icons.password,
            ),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 10),
        Container(
          padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
          width: 50,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return HomePage();
                },
              ));
            },
            style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              backgroundColor: Color.fromARGB(255, 246, 228, 250),
            ),
            child: Text(
              AppLocalizations.of(context).login,
              style: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 145, 33, 250),
                  fontWeight: FontWeight.w900),
            ),
          ),
        ),
      ],
    );
  }

  _forgotPassword(context) {
    return TextButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return VerfierPassword();
          },
        ));
      },
      child: Text(
        AppLocalizations.of(context).forgotPassword,
        style: TextStyle(color: Colors.purple),
      ),
    );
  }
}
