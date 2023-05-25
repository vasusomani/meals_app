import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/Util/bottomNav.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var kColorScheme = ColorScheme.fromSeed(
        seedColor: Colors.black, brightness: Brightness.dark);
    return MaterialApp(
      theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: kColorScheme,
          iconTheme: const IconThemeData(color: Colors.white),
          textTheme: GoogleFonts.latoTextTheme()
              .apply(displayColor: Colors.white, bodyColor: Colors.white),
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.black,
            selectedItemColor: Colors.blue.shade400,
            unselectedItemColor: Colors.white,
          )),
      home: BottomNav(),
    );
  }
}
