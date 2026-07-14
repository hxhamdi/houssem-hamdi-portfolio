import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.poppins(fontSize: 48, fontWeight: FontWeight.bold),
        displayMedium: GoogleFonts.poppins(fontSize: 36, fontWeight: FontWeight.bold),
        displaySmall: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
        headlineMedium: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
        headlineSmall: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),
        titleLarge: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
        bodyLarge: GoogleFonts.poppins(fontSize: 16),
        bodyMedium: GoogleFonts.poppins(fontSize: 14),
        bodySmall: GoogleFonts.poppins(fontSize: 12),
      ),
      colorScheme: ColorScheme.light(
        primary: const Color(0xFF3498db),
        secondary: const Color(0xFF2ecc71),
        surface: Colors.white,
        background: const Color(0xFFf8f9fa),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.black87,
        onBackground: Colors.black87,
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.poppins(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white),
        displayMedium: GoogleFonts.poppins(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
        displaySmall: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        headlineMedium: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        headlineSmall: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white70),
        titleLarge: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
        bodyLarge: GoogleFonts.poppins(fontSize: 16, color: Colors.white70),
        bodyMedium: GoogleFonts.poppins(fontSize: 14, color: Colors.white60),
        bodySmall: GoogleFonts.poppins(fontSize: 12, color: Colors.white54),
      ),
      colorScheme: ColorScheme.dark(
        primary: const Color(0xFF3498db),
        secondary: const Color(0xFF2ecc71),
        surface: const Color(0xFF121212),
        background: const Color(0xFF1e1e1e),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.white,
        onBackground: Colors.white,
      ),
    );
  }
}