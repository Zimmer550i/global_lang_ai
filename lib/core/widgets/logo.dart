import 'package:flutter/material.dart';
import 'package:global_lang_ai/core/utils/app_colors.dart';
import 'package:global_lang_ai/core/utils/custom_svg.dart';

// ──────────────────────────────────────────────
// CUSTOMIZABLE VARIABLES — Change these to style
// ──────────────────────────────────────────────

// Sizing
const _defaultSize = 48.0;
const _nameSpacing = 6.0;

// Assets
const _logoAsset = "assets/icons/logo";
const _logoAssetWhite = "assets/icons/logo_white";
const _logoName = "assets/icons/logo_name";
const _logoExtension = ".svg";

// ──────────────────────────────────────────────

class Logo extends StatelessWidget {
  final double size;
  final bool showName;
  final bool isWhite;
  const Logo({
    super.key,
    this.size = _defaultSize,
    this.isWhite = false,
    this.showName = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: _nameSpacing,
      children: [
        CustomSvg(
          asset: "${isWhite ? _logoAssetWhite : _logoAsset}$_logoExtension",
          height: size,
          width: size,
        ),
        if (showName)
          CustomSvg(
            asset: "$_logoName$_logoExtension",
            width: size * 4,
            color: isWhite ? Colors.white : AppColors.primary,
          ),
      ],
    );
  }
}
