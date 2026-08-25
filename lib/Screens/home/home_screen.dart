import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../bottom_navbar/bottom_navbar.dart';
import '../../controllers/home_controller.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../category/category_providers_screen.dart';
import '../provider_profile/provider_profile_screen.dart';
import 'widgets/home_header.dart';
import 'widgets/service_categories_grid.dart';
import 'widgets/top_providers_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
        backgroundColor: FkColors.scaffoldBackground,
        body: Obx(() {
          final selectedIndex = controller.selectedNavIndex.value;
          if (selectedIndex != 0) {
            return _buildDummyTab(selectedIndex, controller);
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Fixed Header (Avatar, Greeting, Title & Search bar)
              HomeHeader(controller: controller),

              // 2. Scrollable Body (Services Grid + Top Providers List)
              Expanded(
                child: Obx(() {
                  final categories = controller.filteredCategories;
                  final providers = controller.filteredProviders;
                  final hasQuery = controller.hasActiveSearch;

                  if (controller.hasNoSearchResults) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search_off_rounded,
                              size: 56,
                              color: FkColors.brandPrimary.withValues(
                                alpha: 0.35,
                              ),
                            ),
                            const SizedBox(height: 14),
                            const Text(
                              "No results found",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: FkColors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              "Try searching for a different service or provider",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13.5,
                                fontWeight: FontWeight.w400,
                                color: FkColors.darkGrey,
                              ),
                            ),
                            const SizedBox(height: 18),
                            TextButton(
                              onPressed: controller.clearSearch,
                              style: TextButton.styleFrom(
                                foregroundColor: FkColors.brandPrimary,
                              ),
                              child: const Text(
                                "Clear search",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: FkSizes.sm + 4),

                        if (categories.isNotEmpty) ...[
                          ServiceCategoriesGrid(
                            categories: categories,
                            onCategoryTap: (category) {
                              Get.to(
                                () =>
                                    CategoryProvidersScreen(category: category),
                                transition: Transition.rightToLeft,
                                duration: const Duration(milliseconds: 300),
                              );
                            },
                          ),
                          const SizedBox(height: FkSizes.md - 2),
                        ] else if (hasQuery) ...[
                          const Padding(
                            padding: EdgeInsets.fromLTRB(20, 8, 20, 4),
                            child: Text(
                              "No matching services",
                              style: TextStyle(
                                fontSize: 13.5,
                                fontWeight: FontWeight.w500,
                                color: FkColors.textMuted,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],

                        TopProvidersList(
                          controller: controller,
                          providers: providers,
                          onProviderTap: (provider) {
                            Get.to(
                              () => ProviderProfileScreen(provider: provider),
                              transition: Transition.rightToLeft,
                              duration: const Duration(milliseconds: 300),
                            );
                          },
                        ),

                        const SizedBox(height: FkSizes.xl + 4),
                      ],
                    ),
                  );
                }),
              ),
            ],
          );
        }),
        bottomNavigationBar: Obx(
          () => ServioBottomNavBar(
            currentIndex: controller.selectedNavIndex.value,
            onTap: controller.onNavTapped,
          ),
        ),
      ),
    );
  }

  Widget _buildDummyTab(int index, HomeController controller) {
    final titles = ['Home', 'Bookings', 'Chats', 'Profile'];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          titles[index],
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            color: FkColors.textPrimary,
          ),
        ),
        backgroundColor: FkColors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              index == 1
                  ? Icons.calendar_month_outlined
                  : index == 2
                  ? Icons.chat_bubble_outline_rounded
                  : Icons.person_outline_rounded,
              size: 64,
              color: FkColors.brandPrimary.withValues(alpha: 0.4),
            ),
            const SizedBox(height: 16),
            Text(
              "${titles[index]} Screen",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF4A4A4A),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => controller.onNavTapped(0),
              style: ElevatedButton.styleFrom(
                backgroundColor: FkColors.brandPrimary,
                foregroundColor: FkColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Go to Home"),
            ),
          ],
        ),
      ),
    );
  }
}
