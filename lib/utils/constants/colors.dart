import 'package:flutter/material.dart';

/// Central color tokens for Servio.
class FkColors {
  FkColors._();

  // ---------------------------------------------------------------------------
  // Servio Brand Palette
  // ---------------------------------------------------------------------------

  /// Primary brand green (#004E42)
  static const Color brandPrimary = Color(0xFF004E42);

  /// Secondary brand green (#2A6251)
  static const Color brandSecondary = Color(0xFF2A6251);

  /// Medium Green accent (#3B7A68)
  static const Color brandTertiary = Color(0xFF3B7A68);

  /// Deep Forest Green for dark contrast elements (#00352D)
  static const Color brandDark = Color(0xFF00352D);

  /// Primary & Secondary Aliases
  static const Color primary = brandPrimary;
  static const Color secondary = brandSecondary;

  // ---------------------------------------------------------------------------
  // Rating & Status Accents
  // ---------------------------------------------------------------------------

  /// Warm Gold star rating color (#FFB800)
  static const Color starYellow = Color(0xFFFFB800);
  static const Color accentGold = Color(0xFFF4B400);

  /// Rating Pill pastel yellow background (#FFF9E6)
  static const Color ratingPillBg = Color(0xFFFFF9E6);

  /// Category circle pastel cream background (#F7F4EB)
  static const Color categoryBg = Color(0xFFF7F4EB);

  /// Status badge colors
  static const Color fullyBookedBg = Color(0xFFE8F5E9);
  static const Color fullyBookedText = Color(0xFF2D6A4F);
  static const Color fullyBookedDot = Color(0xFF52B788);

  // ---------------------------------------------------------------------------
  // Surfaces & Backgrounds
  // ---------------------------------------------------------------------------

  static const Color scaffoldBackground = Color(0xFFF8F9FA);
  static const Color cardBackground = Colors.white;
  static const Color inputBackground = Color(0xFFF0F1F5);
  static const Color circularButtonBg = Color(0xFFF2F4F7);
  static const Color surfaceSubtle = Color(0xFFF7F5EE);
  static const Color light = Color(0xFFF6F7F9);
  static const Color dark = Color(0xFF272727);

  // ---------------------------------------------------------------------------
  // Typography & Text
  // ---------------------------------------------------------------------------

  static const Color textPrimary = Color(0xFF1E1E1E);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textMuted = Color(0xFF9E9E9E);
  static const Color textWhite = Colors.white;
  static const Color textDark = Color(0xFF2C3E50);

  // ---------------------------------------------------------------------------
  // Neutrals, Shadows & Borders
  // ---------------------------------------------------------------------------

  static const Color white = Colors.white;
  static const Color black = Color(0xFF1E1E1E);
  static const Color grey = Color(0xFFDDE1E5);
  static const Color darkGrey = Color(0xFF8A8F94);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color borderLight = Color(0xFFEEEEEE);
  static const Color borderCard = Color(0xFFE2E8F0);
  static const Color borderPrimary = Color(0xFFD0D5DA);
  static const Color borderSecondary = Color(0xFFE4E7EB);
  static const Color divider = Color(0xFFE0E0E0);
  static const Color shadowSubtle = Color(0x0A000000);
  static const Color shadowMedium = Color(0x14000000);

  // ---------------------------------------------------------------------------
  // Buttons
  // ---------------------------------------------------------------------------

  static const Color buttonPrimary = brandPrimary;
  static const Color buttonSecondary = brandSecondary;
  static const Color buttonDisabled = Color(0xFFBFC5CC);
  static const Color buttonNeutral = Color(0xFF8C8CA1);

  // ---------------------------------------------------------------------------
  // Feedback & Alerts
  // ---------------------------------------------------------------------------

  static const Color success = Color(0xFF2E7D32);
  static const Color error = Color(0xFFD32F2F);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);
}
