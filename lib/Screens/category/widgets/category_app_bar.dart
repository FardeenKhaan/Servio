import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

/// Top App Bar for the Category Providers screen featuring a circular back button and category title.
class CategoryAppBar extends StatelessWidget {
  final String title;

  const CategoryAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: FkSizes.md,
        vertical: FkSizes.sm,
      ),
      child: Row(
        children: [
          // Circular Back Button
          InkWell(
            onTap: () => Get.back(),
            borderRadius: BorderRadius.circular(FkSizes.backButtonRadius),
            child: Container(
              width: FkSizes.backButtonSize,
              height: FkSizes.backButtonSize,
              decoration: BoxDecoration(
                color: FkColors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: FkColors.borderLight,
                  width: 1,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: FkColors.shadowSubtle,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(
                Icons.arrow_back_rounded,
                color: FkColors.textPrimary,
                size: FkSizes.iconCategoryBack,
              ),
            ),
          ),

          const SizedBox(width: FkSizes.md - 2),

          // Category Title
          Text(
            title,
            style: const TextStyle(
              fontSize: FkSizes.fontSizeTitle,
              fontWeight: FontWeight.w700,
              color: FkColors.textPrimary,
              letterSpacing: -0.2,
            ),
          ),
        ],
      ),
    );
  }
}
