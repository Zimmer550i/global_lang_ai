import 'package:flutter/material.dart';
import 'package:global_lang_ai/core/utils/app_colors.dart';
import 'package:global_lang_ai/core/utils/custom_svg.dart';

class FaqWidget extends StatelessWidget {
  final String title;
  final String description;
  final bool isExpanded;
  final void Function() onChanged;
  const FaqWidget({
    super.key,
    required this.title,
    required this.description,
    required this.isExpanded,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final defaultDuration = Duration(milliseconds: 300);

    return GestureDetector(
      onTap: onChanged,
      child: AnimatedContainer(
        duration: defaultDuration,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: .circular(16),
          color: isExpanded ? AppColors.green.shade50 : AppColors.blue.shade50,
        ),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Row(
              children: [
                Expanded(child: Text(title)),
                AnimatedRotation(
                  turns: isExpanded ? 0.5 : 1,
                  duration: defaultDuration,
                  child: CustomSvg(asset: "assets/icons/arrow_down.svg"),
                ),
              ],
            ),
            AnimatedSize(
              alignment: Alignment.topCenter,
              duration: defaultDuration,
              child: isExpanded
                  ? Container(
                      margin: EdgeInsets.only(left: 20, top: 12),
                      padding: EdgeInsets.only(left: 12),
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: AppColors.blue.shade200,
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: Text(description),
                    )
                  : SizedBox(width: double.infinity),
            ),
          ],
        ),
      ),
    );
  }
}
