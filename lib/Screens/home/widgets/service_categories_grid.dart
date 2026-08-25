import 'package:flutter/material.dart';
import '../../../models/service_category.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class ServiceCategoriesGrid extends StatelessWidget {
  final List<ServiceCategory> categories;
  final Function(ServiceCategory)? onCategoryTap;

  const ServiceCategoriesGrid({
    super.key,
    required this.categories,
    this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Section Header: "Services" and "See all"
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Services",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1E1E1E),
                  letterSpacing: -0.2,
                ),
              ),
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(6),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  child: Text(
                    "See all",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: FkColors.brandPrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 14),

        // 2 Rows x 4 Columns Category Grid
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 16,
              crossAxisSpacing: 6,
              mainAxisExtent: 98,
            ),
            itemBuilder: (context, index) {
              final category = categories[index];
              return _CategoryItem(
                category: category,
                onTap: () => onCategoryTap?.call(category),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final ServiceCategory category;
  final VoidCallback? onTap;

  const _CategoryItem({
    required this.category,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Pastel Cream Circular Container
          Container(
            width: FkSizes.categoryCircleSize,
            height: FkSizes.categoryCircleSize,
            decoration: BoxDecoration(
              color: category.bgColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: _buildIcon(category),
            ),
          ),
          const SizedBox(height: FkSizes.sm),

          // Category Label Text
          Text(
            category.title,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Color(0xFF222222),
              letterSpacing: -0.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(ServiceCategory category) {
    if (category.assetPath != null) {
      return Image.asset(
        category.assetPath!,
        width: 36,
        height: 36,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return _buildFallbackIcon(category.id);
        },
      );
    }
    return _buildFallbackIcon(category.id);
  }

  Widget _buildFallbackIcon(String id) {
    switch (id) {
      case 'logistics':
        return Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: const Color(0xFFE0F2FE),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Icon(
              Icons.local_shipping_rounded,
              color: Color(0xFF0284C7),
              size: 22,
            ),
          ),
        );
      default:
        return const Icon(
          Icons.home_repair_service_rounded,
          color: FkColors.brandPrimary,
          size: 28,
        );
    }
  }
}
