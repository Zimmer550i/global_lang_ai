import 'package:global_lang_ai/core/utils/app_colors.dart';
import 'package:global_lang_ai/core/utils/app_texts.dart';
import 'package:flutter/material.dart';

// ──────────────────────────────────────────────
// CUSTOMIZABLE VARIABLES — Change these to style
// ──────────────────────────────────────────────

// Sizing
const _defaultSize = 80.0;
const _nameSpacing = 6.0;
const _nameFontSize = 28.0;

// Colors
const _nameColor = AppColors.blue;
const _nameWhiteColor = Colors.white;

// Typography
final _nameStyle = AppTexts.dmdm;

// Assets
const _logoAsset = "assets/images/logo";
const _logoWhiteAsset = "assets/images/logo_white";
const _logoExtension = ".png";

// Text
const _appName = "App Name";

// ──────────────────────────────────────────────

class Logo extends StatelessWidget {
  final double size;
  final bool showName;
  final bool isWhite;
  const Logo({
    super.key,
    this.size = _defaultSize,
    this.showName = false,
    this.isWhite = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: _nameSpacing,
      children: [
        Image.asset(
          "${isWhite ? _logoWhiteAsset : _logoAsset}$_logoExtension",
          fit: BoxFit.cover,
          height: size,
          width: size,
        ),
        if (showName)
          Text(
            _appName,
            style: _nameStyle.copyWith(
              color: isWhite ? _nameWhiteColor : _nameColor,
              fontSize: _nameFontSize,
            ),
          ),
      ],
    );
  }
}
