import 'package:flutter/material.dart';
import 'package:local_database_setup/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local Database setup',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.green[600],
              foregroundColor: Colors.white),
          inputDecorationTheme: InputDecorationTheme(
              enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(7)),
                  borderSide: BorderSide(color: Colors.green.shade600)),
              fillColor: Colors.green[200],
              focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(7)),
                  borderSide: BorderSide(color: Colors.green.shade600)),
              filled: true),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[600],
                  foregroundColor: Colors.white,
                  fixedSize: const Size.fromWidth(double.maxFinite),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  )))),
      home: const HomeScreen(),
    );
  }
}
