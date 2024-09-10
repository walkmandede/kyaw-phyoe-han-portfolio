import 'package:flutter/material.dart';
import 'm_theme_model.dart';

class DarkThemeData {
  static ThemeModel theme = ThemeModel(
    primary: const Color(0xFF00FF00), // Neon Green (Primary Accent)
    primarySoft: const Color(0xFF008F00), // Softer Green
    primaryAccent: const Color(0xFF00FF00), // Same Neon Green for consistency
    primaryOver: Colors.black, // Text color over primary elements
    background1: const Color(0xFF040910), // Dark Gray (Main Background)
    background2: const Color(0xFF101318), // Darker Gray for contrast
    background3: const Color(0xFF1d2528), // Deepest background color
    text1: const Color(0xFFFFFFFF), // White (Primary Text)
    text2: const Color(0xFFB0B0B0), // Light Gray (Secondary Text)
    textHighlight: const Color(0xFF00FF00), // Bright Green for Highlight
    disableColor: const Color(0xFF575757), // Disabled elements color
    secondaryAccent: const Color(0xFF4383FE), // Blue for secondary accent
    greenSuccess: const Color(0xFF66BB6A), // Success color
    redDanger: const Color(0xFFEF5350), // Danger/Error color
    yellowWarning: const Color(0xFFFDD835), // Warning color
    bgGradient1: const LinearGradient(
      colors: [Color(0xFF1A1A1A), Color(0xFF121212)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderGray: const Color(0xFF575757), // Border color
    icon: const Color(0xFFFFFFFF), // Icon color
    userIcon: const Color(0xFF00FF00), // User Icon in Green
    mgmtIcon: const Color(0xFF4F95FF), // Management Icon in Blue
    shadowColor: const Color(0xFF000000), // Shadow color
  );
}

