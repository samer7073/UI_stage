import 'dart:developer';
import 'dart:ffi';
import 'dart:ui';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_stage_project/providers/langue_provider.dart';
import 'package:flutter_application_stage_project/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> with WidgetsBindingObserver {
  late ThemeProvider themeProvider;
  late LangueProvider langueProvider;
  late Locale value;

  @override
  void initState() {
    super.initState();
    log("test initstate Activate Settings");
    themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    langueProvider = Provider.of<LangueProvider>(context, listen: false);
    langueProvider.addListener(_onLocaleChange);
    updateValueSelected(langueProvider.locale);
  }

  @override
  void dispose() {
    langueProvider.removeListener(_onLocaleChange);
    super.dispose();
  }

  void _onLocaleChange() {
    setState(() {
      updateValueSelected(langueProvider.locale);
    });
  }

  void updateValueSelected(Locale locale) {
    setState(() {
      valueSelected = locale.languageCode == 'fr'
          ? "Francais"
          : locale.languageCode == "en"
              ? "English"
              : "العربية";
    });
  }

  String valueSelected = '';

  @override
  Widget build(BuildContext context) {
    log("la langage de systeme est  $valueSelected");
    log("la valuer dans langueProvider ${langueProvider.locale}");
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).settings),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none_sharp,
              size: 30,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context).theme,
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              child: customSwitch(
                AppLocalizations.of(context).darkMode,
                themeProvider.isDarkMode,
                (value) {
                  themeProvider.toggleTheme();
                },
                context,
              ),
            ),
            SizedBox(height: 10),
            Text(
              AppLocalizations.of(context).language,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(height: 15),
            DropdownMenu<String>(
              textStyle: Theme.of(context).textTheme.bodyText1,
              width: 370,
              initialSelection: valueSelected,
              dropdownMenuEntries: [
                DropdownMenuEntry(value: "English", label: "English"),
                DropdownMenuEntry(value: "Francais", label: "Francais"),
                DropdownMenuEntry(value: "العربية", label: "العربية"),
              ],
              onSelected: (String? newValue) {
                setState(() {
                  valueSelected = newValue!;
                  if (newValue == "English") {
                    langueProvider.setLocale(Locale('en'));
                    log("Selected language: English");
                  } else if (newValue == "Francais") {
                    langueProvider.setLocale(Locale('fr'));
                    log("Selected language: Francais");
                  } else if (newValue == "العربية") {
                    langueProvider.setLocale(Locale('ar'));
                    log("Selected language: Arabic");
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget customSwitch(
  String text,
  bool val,
  onChangeMethod,
  BuildContext context,
) {
  log("la valeur de button switch ==== $val");
  return Padding(
    padding: EdgeInsets.only(top: 0, left: 0, right: 0),
    child: Row(
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Spacer(),
        CupertinoSwitch(
          activeColor: Colors.purple,
          value: val,
          onChanged: onChangeMethod,
        ),
      ],
    ),
  );
}
