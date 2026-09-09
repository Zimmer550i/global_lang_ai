import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_lang_ai/core/models/cliclable_button_model.dart';
import 'package:global_lang_ai/core/utils/app_colors.dart';
import 'package:global_lang_ai/core/utils/app_icons.dart';
import 'package:global_lang_ai/core/utils/app_texts.dart';
import 'package:global_lang_ai/core/utils/custom_svg.dart';
import 'package:global_lang_ai/core/widgets/logo.dart';

// ──────────────────────────────────────────────
// CUSTOMIZABLE VARIABLES — Change these to style
// ──────────────────────────────────────────────

// Colors
final _backgroundColor = Colors.transparent;
final _tintColor = AppColors.blue.shade500;
final _titleColor = AppColors.black[400]!;
final _leadingColor = Colors.white;

// Sizing
const _appBarHeight = 44.0;
const _padding = 20.0;
const _leadingSize = 32.0;
const _titleLeftPadding = 15.0;

// Typography
final _titleStyle = AppTexts.h5Semibold;

// Icons
const _backIcon = AppIcons.back;

// ──────────────────────────────────────────────

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool hasLeading;
  final List<CliclableButtonModel> actions;
  const CustomAppBar({
    super.key,
    this.title,
    this.hasLeading = true,
    this.actions = const [],
  });

  @override
  Size get preferredSize => Size(double.infinity, kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: _backgroundColor,
      surfaceTintColor: _tintColor,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: SizedBox(
        height: _appBarHeight,
        child: Row(
          children: [
            SizedBox(width: _padding),
            hasLeading
                ? InkWell(
                    onTap: () => hasLeading ? Get.back() : null,
                    borderRadius: BorderRadius.circular(999),
                    child: Container(
                      height: _leadingSize,
                      width: _leadingSize,
                      decoration: BoxDecoration(
                        color: _leadingColor,
                        shape: .circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            offset: Offset(0, 5),
                            blurRadius: 26,
                          ),
                        ],
                      ),
                      child: Center(child: CustomSvg(asset: _backIcon)),
                    ),
                  )
                : Logo(size: 32),
            const SizedBox(width: _titleLeftPadding),
            Expanded(
              child: Text(
                title ?? "",
                style: _titleStyle.copyWith(color: _titleColor),
              ),
            ),

            Row(
              spacing: 12,
              children: [
                for (var i in actions)
                  GestureDetector(
                    onTap: i.onTap,
                    child: Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        shape: .circle,
                        color: Colors.white,
                      ),
                      child: Center(
                        child: CustomSvg(
                          asset: "assets/icons/${i.iconName}.svg",
                          size: 24,
                          color: AppColors.black.shade400,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: _padding),
          ],
        ),
      ),
    );
  }
}
