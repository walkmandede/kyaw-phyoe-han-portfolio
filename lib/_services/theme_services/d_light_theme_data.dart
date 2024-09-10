import 'package:flutter/material.dart';
import 'm_theme_model.dart';

class LightThemeData {
  static ThemeModel theme = ThemeModel(
    primary: const Color(0xFF0F2943), // Navy Blue (Primary)
    primarySoft: const Color(0xFF2D3E50), // Softer Navy Blue
    primaryAccent: const Color(0xFFD4AF37), // Gold Accent
    primaryOver: Colors.white, // White text over primary elements
    background1: const Color(0xFFF9F9F9), // Very Light Gray Background
    background2: const Color(0xFFEDEDED), // Slightly Darker Gray Background
    background3: const Color(0xFFFFFFFF), // White background option
    text1: const Color(0xFF0F2943), // Navy Blue Text (Primary)
    text2: const Color(0xFF5C6C7B), // Muted Gray-Blue (Secondary Text)
    textHighlight: const Color(0xFFD4AF37), // Gold for Highlighted Text
    disableColor: const Color(0xFFB0B0B0), // Disabled elements color
    secondaryAccent: const Color(0xFFD4AF37), // Gold as secondary accent
    greenSuccess: const Color(0xFF43A047), // Success color
    redDanger: const Color(0xFFEB5757), // Danger/Error color
    yellowWarning: const Color(0xFFF2C94C), // Warning color
    bgGradient1: const LinearGradient(
      colors: [Color(0xFFF9F9F9), Color(0xFFEDEDED)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderGray: const Color(0xFFB0B0B0), // Border color
    icon: const Color(0xFF5C6C7B), // Icon color
    userIcon: const Color(0xFFD4AF37), // User Icon in Gold
    mgmtIcon: const Color(0xFF4F95FF), // Management Icon in Blue
    shadowColor: const Color(0xFF000000), // Shadow color
  );
}
