import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:global_lang_ai/core/utils/app_colors.dart';
import 'package:global_lang_ai/core/utils/app_texts.dart';

import 'package:google_fonts/google_fonts.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;

  group('AppColors Palette Tests', () {
    test('Yellow palette matches design specification', () {
      expect(AppColors.yellow[50], const Color(0xFFFEF5E7));
      expect(AppColors.yellow[100], const Color(0xFFFCE1B3));
      expect(AppColors.yellow[200], const Color(0xFFFAD28F));
      expect(AppColors.yellow[300], const Color(0xFFF8BE5C));
      expect(AppColors.yellow[400], const Color(0xFFF7B13C));
      expect(AppColors.yellow[500], const Color(0xFFF59E0B));
      expect(AppColors.yellow[600], const Color(0xFFDF900A));
      expect(AppColors.yellow[700], const Color(0xFFAE7008));
      expect(AppColors.yellow[800], const Color(0xFF875706));
      expect(AppColors.yellow[900], const Color(0xFF674205));
    });

    test('Green palette matches design specification', () {
      expect(AppColors.green[50], const Color(0xFFE7F8F2));
      expect(AppColors.green[100], const Color(0xFFB5E9D8));
      expect(AppColors.green[200], const Color(0xFF91DFC5));
      expect(AppColors.green[300], const Color(0xFF5FD0AB));
      expect(AppColors.green[400], const Color(0xFF40C79A));
      expect(AppColors.green[500], const Color(0xFF10B981));
      expect(AppColors.green[600], const Color(0xFF0FA875));
      expect(AppColors.green[700], const Color(0xFF0B835C));
      expect(AppColors.green[800], const Color(0xFF096647));
      expect(AppColors.green[900], const Color(0xFF074E36));
    });

    test('Blue palette matches design specification', () {
      expect(AppColors.blue[50], const Color(0xFFE9EFFD));
      expect(AppColors.blue[100], const Color(0xFFBBCFF9));
      expect(AppColors.blue[200], const Color(0xFF9BB7F6));
      expect(AppColors.blue[300], const Color(0xFF6D96F2));
      expect(AppColors.blue[400], const Color(0xFF5182EF));
      expect(AppColors.blue[500], const Color(0xFF2563EB));
      expect(AppColors.blue[600], const Color(0xFF225AD6));
      expect(AppColors.blue[700], const Color(0xFF1A46A7));
      expect(AppColors.blue[800], const Color(0xFF143681));
      expect(AppColors.blue[900], const Color(0xFF102A63));
    });

    test('Black palette matches design specification', () {
      expect(AppColors.black[50], const Color(0xFFE6E6E6));
      expect(AppColors.black[100], const Color(0xFFB0B0B0));
      expect(AppColors.black[200], const Color(0xFF8A8A8A));
      expect(AppColors.black[300], const Color(0xFF545454));
      expect(AppColors.black[400], const Color(0xFF333333));
      expect(AppColors.black[500], const Color(0xFF000000));
      expect(AppColors.black[600], const Color(0xFF000000));
      expect(AppColors.black[700], const Color(0xFF000000));
      expect(AppColors.black[800], const Color(0xFF000000));
      expect(AppColors.black[900], const Color(0xFF000000));
    });
  });

  group('AppTexts Typography Tests', () {
    test('Display styles match design spec', () {
      expect(AppTexts.displayXlBold.fontSize, 64);
      expect(AppTexts.displayXlBold.fontWeight, FontWeight.w700);

      expect(AppTexts.displayLBold.fontSize, 56);
      expect(AppTexts.displayLBold.fontWeight, FontWeight.w700);

      expect(AppTexts.displayMBold.fontSize, 48);
      expect(AppTexts.displayMBold.fontWeight, FontWeight.w700);
    });

    test('Heading styles match design spec', () {
      expect(AppTexts.h1Bold.fontSize, 40);
      expect(AppTexts.h1Bold.fontWeight, FontWeight.w700);

      expect(AppTexts.h2Bold.fontSize, 32);
      expect(AppTexts.h2Bold.fontWeight, FontWeight.w700);

      expect(AppTexts.h3Semibold.fontSize, 28);
      expect(AppTexts.h3Semibold.fontWeight, FontWeight.w600);

      expect(AppTexts.h4Semibold.fontSize, 24);
      expect(AppTexts.h4Semibold.fontWeight, FontWeight.w600);

      expect(AppTexts.h5Semibold.fontSize, 20);
      expect(AppTexts.h5Semibold.fontWeight, FontWeight.w600);

      expect(AppTexts.h6Semibold.fontSize, 18);
      expect(AppTexts.h6Semibold.fontWeight, FontWeight.w600);
    });

    test('Body styles match design spec', () {
      expect(AppTexts.bodyXllRegular.fontSize, 18);
      expect(AppTexts.bodyXllRegular.fontWeight, FontWeight.w400);

      expect(AppTexts.bodyXlRegular.fontSize, 16);
      expect(AppTexts.bodyXlRegular.fontWeight, FontWeight.w400);

      expect(AppTexts.bodyLRegular.fontSize, 14);
      expect(AppTexts.bodyLRegular.fontWeight, FontWeight.w400);

      expect(AppTexts.bodyMRegular.fontSize, 13);
      expect(AppTexts.bodyMRegular.fontWeight, FontWeight.w400);

      expect(AppTexts.bodyMMedium.fontSize, 13);
      expect(AppTexts.bodyMMedium.fontWeight, FontWeight.w500);
    });

    test('Button styles match design spec', () {
      expect(AppTexts.buttonLMedium.fontSize, 18);
      expect(AppTexts.buttonLMedium.fontWeight, FontWeight.w500);

      expect(AppTexts.buttonMMedium.fontSize, 16);
      expect(AppTexts.buttonMMedium.fontWeight, FontWeight.w500);

      expect(AppTexts.buttonSMedium.fontSize, 14);
      expect(AppTexts.buttonSMedium.fontWeight, FontWeight.w500);
    });
  });
}
