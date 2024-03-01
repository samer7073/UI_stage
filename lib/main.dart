import 'package:flutter/material.dart';
import 'package:flutter_application_stage_project/onboarding_screen.dart';
import 'package:flutter_application_stage_project/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key})
      : super(key: key); // Correction de la syntaxe du constructeur

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, child) {
        final provider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          //themeMode: provider.theme,
          theme: provider.theme,
          // Permet d'activer le

          home: OnBoardingScreen(),
        );
      },
      /*
      child: MaterialApp(
        theme: ThemeData.light().copyWith(
          // Utilisation de ThemeData.light().copyWith() pour créer un thème light à partir du thème par défaut
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(color: Colors.black, fontSize: 22),
            iconTheme: IconThemeData(color: Colors.purple),
          ),
          useMaterial3: true,
          drawerTheme: const DrawerThemeData(
            shadowColor: Colors.deepPurple,
            backgroundColor: Colors.purple,
          ),
        ),
        darkTheme: ThemeData.dark().copyWith(
          appBarTheme:
              AppBarTheme(iconTheme: IconThemeData(color: Colors.purple)),
          // Utilisation de ThemeData.dark().copyWith() pour créer un thème sombre à partir du thème par défaut
          scaffoldBackgroundColor: Colors.black,
          textSelectionTheme: const TextSelectionThemeData(
            selectionColor: Colors.white,
          ),
          drawerTheme: const DrawerThemeData(
            backgroundColor: Colors.black,
            shadowColor: Colors.black,
          ),
          shadowColor: Colors.black,
        ),
        themeMode: ThemeMode
            .dark, // Utilisation de ThemeMode.system pour utiliser le thème du système par défaut (light ou dark)
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: const OnBoardingScreen(),
      ),
      */
    );
  }
}
