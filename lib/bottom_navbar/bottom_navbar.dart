import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/sizes.dart';

class ServioBottomNavBar extends StatelessWidget {
  /// The active selected navigation tab index (0 to 3).
  final int currentIndex;

  /// Callback when a navigation tab is tapped.
  final ValueChanged<int> onTap;

  const ServioBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  // Unselected outline icons from Iconsax
  static const List<IconData> _unselectedIcons = [
    Iconsax.home,
    Iconsax.task_square,
    Iconsax.message,
    Iconsax.user,
  ];

  /// Active filled icons from Iconsax
  static const List<IconData> _selectedIcons = [
    Iconsax.home5,
    Iconsax.task_square5,
    Iconsax.message5,
    Iconsax.user,
  ];

  /// Navigation item labels
  static const List<String> _labels = ['Home', 'Bookings', 'Chats', 'Profile'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: FkColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(FkSizes.navBarRadius),
          topRight: Radius.circular(FkSizes.navBarRadius),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 16,
            offset: Offset(0, -4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: AnimatedBottomNavigationBar.builder(
        itemCount: _labels.length,
        height: FkSizes.navBarHeight,
        safeAreaValues: const SafeAreaValues(top: false, bottom: true),
        activeIndex: currentIndex,
        gapLocation: GapLocation.none,
        splashColor: FkColors.brandPrimary.withValues(alpha: 0.1),
        backgroundColor: FkColors.white,
        onTap: onTap,
        tabBuilder: (int index, bool isActive) {
          // Active state uses brandPrimary (#004E42), inactive uses textMuted (#9E9E9E)
          final Color iconColor = isActive
              ? FkColors.brandPrimary
              : FkColors.textMuted;
          final IconData iconData = isActive
              ? _selectedIcons[index]
              : _unselectedIcons[index];

          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Navigation Tab Icon
              Icon(iconData, size: FkSizes.iconMd, color: iconColor),
              const SizedBox(height: FkSizes.xs),

              // Navigation Tab Label
              Text(
                _labels[index],
                style: TextStyle(
                  fontSize: FkSizes.fontSizeXs - 1,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                  color: iconColor,
                  height: 1.1,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
