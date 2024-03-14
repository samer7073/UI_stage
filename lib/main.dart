// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_stage_project/screens/onboarding_screen.dart';
import 'package:flutter_application_stage_project/providers/langue_provider.dart';
import 'package:flutter_application_stage_project/providers/theme_provider.dart';
import 'package:flutter_application_stage_project/core/constants/design/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:language_code/language_code.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LangueProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  static void setLocale(BuildContext context, Locale newLocale) {
    final _MyAppState state = context.findAncestorStateOfType<_MyAppState>()!;
    state.setLocale(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = LanguageCode.locale;

  void setLocale(Locale newLocale) {
    setState(() {
      _locale = newLocale;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);
    final providerLangue = Provider.of<LangueProvider>(context);
    log('la  valeur de isdark dans build Main  ==== ${provider.isDarkMode}');
    log("Le thème initial est  et le mode sombre est ${provider.isDarkMode}");

    return MaterialApp(
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        locale: providerLangue.locale,
        supportedLocales: [
          Locale('en'),
          Locale('fr'),
          Locale('ar'),
        ],
        debugShowCheckedModeBanner: false,
        theme: provider.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
        themeMode: provider.themeMode,
        //themeMode: provider.isDarkMode == true ? ThemeMode.light  : ThemeMode.dark ,
        home: ChangeNotifierProvider.value(
          value: provider,
          child: OnBoardingScreen(),
        ));
  }
}
