import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicationTheme {
  static ThemeData themeApp() {
    return ThemeData(
      primaryColor: Colors.brown[800],
      scaffoldBackgroundColor: const Color(0xFFF5EDE1),
      appBarTheme: AppBarTheme(
        color: Colors.brown[800],
        elevation: 4.0,
        iconTheme: const IconThemeData(color: Colors.white),
        toolbarTextStyle: TextTheme(
          titleLarge: GoogleFonts.pacifico(
            color: Colors.white,
            fontSize: 24.0,
          ),
        ).bodyMedium,
        titleTextStyle: TextTheme(
          titleLarge: GoogleFonts.pacifico(
            color: Colors.white,
            fontSize: 24.0,
          ),
        ).titleLarge,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.pacifico(
          color: Colors.brown[900],
          fontSize: 32.0,
        ),
        titleLarge: GoogleFonts.poppins(
          color: Colors.brown[700],
          fontSize: 20.0,
        ),
        bodyMedium: GoogleFonts.poppins(
          color: Colors.brown[700],
          fontSize: 16.0,
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.brown[800],
        textTheme: ButtonTextTheme.primary,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.orangeAccent,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.brown[800]!,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.brown[800]!,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Colors.orangeAccent,
          ),
        ),
        labelStyle: TextStyle(
          color: Colors.brown[800],
        ),
        hintStyle: TextStyle(
          color: Colors.brown[500],
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.brown[400],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.brown[800],
        selectedLabelStyle:
            const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        selectedIconTheme: const IconThemeData(size: 30),
        unselectedIconTheme: const IconThemeData(size: 24),
      ),
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.brown)
          .copyWith(secondary: Colors.orangeAccent),
    );
  }
}
