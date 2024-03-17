import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ActiviteSettingsPage extends StatefulWidget {
  const ActiviteSettingsPage({super.key});

  @override
  State<ActiviteSettingsPage> createState() => _ActiviteSettingsPageState();
}

class _ActiviteSettingsPageState extends State<ActiviteSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).activities),
        centerTitle: true,
      ),
    );
  }
}
