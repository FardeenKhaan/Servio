import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/home_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

class HomeHeader extends StatelessWidget {
  final HomeController controller;

  const HomeHeader({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: FkColors.brandPrimary, // #004E42
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(FkSizes.headerRadius),
          bottomRight: Radius.circular(FkSizes.headerRadius),
        ),
      ),
      child: Stack(
        children: [
          // Geometric facet overlay matching Figma Image 1 exactly
          Positioned.fill(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(FkSizes.headerRadius),
                bottomRight: Radius.circular(FkSizes.headerRadius),
              ),
              child: ClipPath(
                clipper: _HeaderFacetClipper(),
                child: Container(
                  color: FkColors.brandSecondary.withValues(alpha: 0.7), // #2A6251
                ),
              ),
            ),
          ),

          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Row: Avatar, Welcome Jane, Notification Bell
                  Row(
                    children: [
                      // Avatar
                      Container(
                        width: FkSizes.userAvatarSize,
                        height: FkSizes.userAvatarSize,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.35),
                            width: 1.5,
                          ),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            FkImages.userAvatar,
                            width: FkSizes.userAvatarSize,
                            height: FkSizes.userAvatarSize,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: FkColors.brandSecondary,
                                child: const Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 28,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),

                      // Greeting & Name
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Welcome,",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.2,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Jane",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -0.3,
                                  height: 1.15,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Image.asset(
                                FkImages.wavingHandEmoji,
                                width: 22,
                                height: 22,
                                fit: BoxFit.contain,
                                errorBuilder: (_, _, _) => const Text(
                                  "👋",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const Spacer(),

                      // Circular Notification Bell Button
                      Container(
                        width: 48,
                        height: 48,
                        decoration: const BoxDecoration(
                          color: FkColors.brandDark,
                          shape: BoxShape.circle,
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            const Icon(
                              Icons.notifications,
                              color: Colors.white,
                              size: 24,
                            ),
                            // Red notification dot
                            Positioned(
                              top: 13,
                              right: 14,
                              child: Container(
                                width: 7,
                                height: 7,
                                decoration: const BoxDecoration(
                                  color: FkColors.error,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 22),

                  // Headline: "What service do you need?"
                  const Text(
                    "What service do\nyou need?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      height: 1.18,
                      letterSpacing: -0.6,
                    ),
                  ),

                  const SizedBox(height: 18),

                  // Search Bar
                  Container(
                    height: FkSizes.searchBarHeight,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(FkSizes.cardRadius),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.08),
                          blurRadius: 14,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Obx(() {
                      final hasQuery = controller.searchQuery.value
                          .trim()
                          .isNotEmpty;
                      return TextField(
                        controller: controller.searchController,
                        onChanged: controller.onSearchChanged,
                        style: const TextStyle(
                          fontSize: 14.5,
                          color: Color(0xFF222222),
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          hintText: "Search services, providers..",
                          hintStyle: const TextStyle(
                            color: FkColors.textMuted,
                            fontSize: 14.5,
                            fontWeight: FontWeight.w400,
                          ),
                          prefixIcon: const Icon(
                            Icons.search_rounded,
                            color: FkColors.textMuted,
                            size: 24,
                          ),
                          suffixIcon: hasQuery
                              ? IconButton(
                                  onPressed: controller.clearSearch,
                                  icon: const Icon(
                                    Icons.close_rounded,
                                    color: FkColors.textMuted,
                                    size: 20,
                                  ),
                                )
                              : null,
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Custom clipper that creates the exact geometric facet starting right after "Jane 👋"
class _HeaderFacetClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    // Starts on top edge to the right of "Welcome, Jane"
    path.moveTo(size.width * 0.41, 0);
    // Goes down vertically past "Jane 👋"
    path.lineTo(size.width * 0.44, size.height * 0.27);
    // Slopes diagonally across to the bottom-right corner
    path.lineTo(size.width, size.height * 0.95);
    // Across right edge and top-right corner
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
