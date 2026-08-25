import 'package:flutter/material.dart';
import '../../../controllers/category_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

/// Search input field and filter button row on Category Providers screen.
class CategorySearchBar extends StatelessWidget {
  final CategoryController controller;
  final VoidCallback? onFilterTap;

  const CategorySearchBar({
    super.key,
    required this.controller,
    this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: FkSizes.md),
      child: Row(
        children: [
          // Search Input Field
          Expanded(
            child: Container(
              height: FkSizes.searchFieldHeight,
              decoration: BoxDecoration(
                color: FkColors.white,
                borderRadius: BorderRadius.circular(FkSizes.borderRadiusLg - 2),
                border: Border.all(color: FkColors.borderLight, width: 1),
                boxShadow: const [
                  BoxShadow(
                    color: FkColors.shadowSubtle,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                controller: controller.searchController,
                onChanged: (val) => controller.searchQuery.value = val,
                style: const TextStyle(
                  fontSize: FkSizes.fontSizeSm,
                  color: FkColors.textPrimary,
                  fontWeight: FontWeight.w500,
                ),
                decoration: const InputDecoration(
                  hintText: "Search providers",
                  hintStyle: TextStyle(
                    color: FkColors.textMuted,
                    fontSize: FkSizes.fontSizeSm,
                    fontWeight: FontWeight.w400,
                  ),
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: FkColors.textMuted,
                    size: FkSizes.iconCategoryBack + 2,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: FkSizes.md - 2,
                    vertical: 13,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 10),

          // Filter / Adjust Icon Button
          InkWell(
            onTap: onFilterTap ?? () {},
            borderRadius: BorderRadius.circular(FkSizes.borderRadiusLg - 2),
            child: Container(
              width: FkSizes.searchFieldHeight,
              height: FkSizes.searchFieldHeight,
              decoration: BoxDecoration(
                color: FkColors.white,
                borderRadius: BorderRadius.circular(FkSizes.borderRadiusLg - 2),
                border: Border.all(color: FkColors.borderLight, width: 1),
                boxShadow: const [
                  BoxShadow(
                    color: FkColors.shadowSubtle,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(
                Icons.tune_rounded,
                color: FkColors.textDark,
                size: FkSizes.iconCategoryBack + 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
