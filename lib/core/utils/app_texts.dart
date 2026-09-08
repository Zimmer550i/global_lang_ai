import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:global_lang_ai/core/utils/app_colors.dart';

/// AppTexts
/// ---------------------------------------------------------------------------
/// Design System Typography:
///
/// 1. Display (Inter - Bold)
///    - XL-bold : 64px
///    - L-bold  : 56px
///    - M-bold  : 48px
///
/// 2. Heading (Inter - Bold & Semi-Bold)
///    - H1-bold     : 40px, Bold (w700)
///    - H2-bold     : 32px, Bold (w700)
///    - H3-Semibold : 28px, Semi-Bold (w600)
///    - H4-Semibold : 24px, Semi-Bold (w600)
///    - H5-Semibold : 20px, Semi-Bold (w600)
///    - H6-Semibold : 18px, Semi-Bold (w600)
///
/// 3. Body (Poppins - Regular & Medium)
///    - XLL-Regular : 18px, Regular (w400)
///    - XL-Regular  : 16px, Regular (w400)
///    - L-Regular   : 14px, Regular (w400)
///    - M-Regular   : 13px, Regular (w400)
///    - M-Medium    : 13px, Medium (w500)
///
/// 4. Button (Poppins - Medium)
///    - L-medium (L-medieum) : 18px, Medium (w500)
///    - M-Medium             : 16px, Medium (w500)
///    - S-Medium             : 14px, Medium (w500)
/// ---------------------------------------------------------------------------
class AppTexts {
  // ==========================================
  // Display (Font: Inter, Bold: w700)
  // ==========================================

  /// XL-bold – 64px, Inter, Bold (w700)
  static TextStyle displayXlBold = _inter(64, FontWeight.w700);

  /// L-bold – 56px, Inter, Bold (w700)
  static TextStyle displayLBold = _inter(56, FontWeight.w700);

  /// M-bold – 48px, Inter, Bold (w700)
  static TextStyle displayMBold = _inter(48, FontWeight.w700);

  // ==========================================
  // Heading (Font: Inter)
  // ==========================================

  /// H1-bold – 40px, Inter, Bold (w700)
  static TextStyle h1Bold = _inter(40, FontWeight.w700);

  /// H2-bold – 32px, Inter, Bold (w700)
  static TextStyle h2Bold = _inter(32, FontWeight.w700);

  /// H3-Semibold – 28px, Inter, Semi-Bold (w600)
  static TextStyle h3Semibold = _inter(28, FontWeight.w600);

  /// H4-Semibold – 24px, Inter, Semi-Bold (w600)
  static TextStyle h4Semibold = _inter(24, FontWeight.w600);

  /// H5-Semibold – 20px, Inter, Semi-Bold (w600)
  static TextStyle h5Semibold = _inter(20, FontWeight.w600);

  /// H6-Semibold – 18px, Inter, Semi-Bold (w600)
  static TextStyle h6Semibold = _inter(18, FontWeight.w600);

  // ==========================================
  // Body (Font: Poppins)
  // ==========================================

  /// XLL-Regular – 18px, Poppins, Regular (w400)
  static TextStyle bodyXllRegular = _poppins(18, FontWeight.w400);

  /// XL-Regular – 16px, Poppins, Regular (w400)
  static TextStyle bodyXlRegular = _poppins(16, FontWeight.w400);

  /// L-Regular – 14px, Poppins, Regular (w400)
  static TextStyle bodyLRegular = _poppins(14, FontWeight.w400);

  /// M-Regular – 13px, Poppins, Regular (w400)
  static TextStyle bodyMRegular = _poppins(13, FontWeight.w400);

  /// M-Medium – 13px, Poppins, Medium (w500)
  static TextStyle bodyMMedium = _poppins(13, FontWeight.w500);

  // ==========================================
  // Button (Font: Poppins, Medium: w500)
  // ==========================================

  /// L-medieum – 18px, Poppins, Medium (w500)
  static TextStyle buttonLMedium = _poppins(18, FontWeight.w500);

  /// M-Medium – 16px, Poppins, Medium (w500)
  static TextStyle buttonMMedium = _poppins(16, FontWeight.w500);

  /// S-Medium – 14px, Poppins, Medium (w500)
  static TextStyle buttonSMedium = _poppins(14, FontWeight.w500);

  // ==========================================
  // Base Style Generators
  // ==========================================

  static TextStyle _inter(
    double fontSize,
    FontWeight weight, {
    double? height,
    double letterSpacing = 0.0,
    Color? color,
  }) {
    return GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: weight,
      height: height,
      letterSpacing: letterSpacing,
      color: color ?? AppColors.black.shade400,
    );
  }

  static TextStyle _poppins(
    double fontSize,
    FontWeight weight, {
    double? height,
    double letterSpacing = 0.0,
    Color? color,
  }) {
    return GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: weight,
      height: height,
      letterSpacing: letterSpacing,
      color: color ?? AppColors.black.shade400,
    );
  }
}
