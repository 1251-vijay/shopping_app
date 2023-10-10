import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cart_provider.dart';

import 'package:shopping_app/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CardProvider(),
      child: MaterialApp(
          theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(
                  seedColor: const Color.fromARGB(255, 237, 238, 232),
                  primary: Colors.yellow),
              inputDecorationTheme:
                  InputDecorationTheme(hintStyle: GoogleFonts.lato())),
          debugShowCheckedModeBanner: false,
          home: const HomeScreen()),
    );
  }
}
