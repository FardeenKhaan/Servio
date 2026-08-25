import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../bottom_navbar/bottom_navbar.dart';
import '../../controllers/category_controller.dart';
import '../../models/service_category.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import 'widgets/category_app_bar.dart';
import 'widgets/category_providers_list.dart';
import 'widgets/category_search_bar.dart';

/// Screen displaying all providers belonging to a specific service category.
class CategoryProvidersScreen extends StatelessWidget {
  final ServiceCategory category;

  const CategoryProvidersScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    // Unique tag in case multiple category screens are opened
    final controller = Get.put(
      CategoryController(category: category),
      tag: category.id,
    );

    final displayTitle = category.id == 'cleaning'
        ? 'Home cleaning'
        : category.title;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
        backgroundColor: FkColors.scaffoldBackground,
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              const SizedBox(height: FkSizes.sm),

              // 1. Top Navigation Bar (Back Button + Title)
              CategoryAppBar(title: displayTitle),
              const SizedBox(height: FkSizes.md),

              // 2. Search Bar & Filter Button Row
              CategorySearchBar(controller: controller),
              const SizedBox(height: FkSizes.md),

              // 3. Provider Cards List
              Expanded(child: CategoryProvidersList(controller: controller)),
            ],
          ),
        ),
        bottomNavigationBar: Obx(
          () => ServioBottomNavBar(
            currentIndex: controller.selectedNavIndex.value,
            onTap: (index) {
              if (index == 0) {
                Get.back();
              } else {
                controller.selectedNavIndex.value = index;
              }
            },
          ),
        ),
      ),
    );
  }
}
