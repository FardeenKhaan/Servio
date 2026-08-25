import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/category_controller.dart';
import '../../../models/provider_model.dart';
import '../../provider_profile/provider_profile_screen.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import 'category_provider_card.dart';

/// Reactive list view displaying providers in the category with tap/bookmark callbacks.
class CategoryProvidersList extends StatelessWidget {
  final CategoryController controller;

  const CategoryProvidersList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final providers = controller.filteredProviders;

      if (providers.isEmpty) {
        return const Center(
          child: Text(
            "No providers found",
            style: TextStyle(
              fontSize: 15,
              color: FkColors.textMuted,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }

      return ListView.separated(
        padding: const EdgeInsets.fromLTRB(
          FkSizes.md,
          FkSizes.xs,
          FkSizes.md,
          FkSizes.lg,
        ),
        physics: const BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemCount: providers.length,
        separatorBuilder: (_, _) => const SizedBox(height: FkSizes.md - 2),
        itemBuilder: (context, index) {
          final provider = providers[index];
          return CategoryProviderCard(
            provider: provider,
            onTap: () => _navigateToProfile(provider),
            onBookTap: () => _navigateToProfile(provider),
            onBookmarkToggle: () => controller.toggleBookmark(provider.id),
          );
        },
      );
    });
  }

  void _navigateToProfile(ProviderModel provider) {
    Get.to(
      () => ProviderProfileScreen(provider: provider),
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 300),
    );
  }
}
