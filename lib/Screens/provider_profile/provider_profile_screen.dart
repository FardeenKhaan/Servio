import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../bottom_navbar/bottom_navbar.dart';
import '../../models/provider_model.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import 'widgets/profile_about_section.dart';
import 'widgets/profile_gallery_and_certifications.dart';
import 'widgets/profile_identity_section.dart';
import 'widgets/profile_info_cards.dart';
import 'widgets/profile_services_section.dart';
import 'widgets/profile_stats_row.dart';
import 'widgets/profile_top_banner.dart';

/// Provider Profile Screen displaying full provider details, stats, services,
/// reviews, gallery photos, and certifications.
class ProviderProfileScreen extends StatefulWidget {
  final ProviderModel provider;

  const ProviderProfileScreen({super.key, required this.provider});

  @override
  State<ProviderProfileScreen> createState() => _ProviderProfileScreenState();
}

class _ProviderProfileScreenState extends State<ProviderProfileScreen> {
  int _selectedNavIndex = 3;

  @override
  Widget build(BuildContext context) {
    final provider = widget.provider;

    return Scaffold(
      backgroundColor: FkColors.scaffoldBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Pinned Header (Banner, Overlapping Avatar, Name & Stats)
          ProfileTopBanner(provider: provider),
          ProfileIdentitySection(provider: provider),
          const SizedBox(height: FkSizes.md + 4),
          ProfileStatsRow(provider: provider),

          // 2. Scrollable Body Content
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              padding: const EdgeInsets.only(top: 26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // About Me Section (with Expandable Read More)
                  ProfileAboutSection(provider: provider),
                  const SizedBox(height: 26),

                  // Services Offered Section (Selectable Chips)
                  ProfileServicesSection(provider: provider),
                  const SizedBox(height: FkSizes.md + 2),

                  // Number of Staffs Card
                  ProfileStaffsCard(provider: provider),
                  const SizedBox(height: FkSizes.sm + 4),

                  // Reviews Summary Card
                  ProfileReviewsCard(provider: provider),
                  const SizedBox(height: 26),

                  // Work Gallery (Photos & Videos)
                  const ProfileGallerySection(),
                  const SizedBox(height: 26),

                  // Certifications Section
                  const ProfileCertificationsSection(),
                  const SizedBox(height: 36),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: ServioBottomNavBar(
        currentIndex: _selectedNavIndex,
        onTap: (index) {
          if (index == 0) {
            Get.back();
          } else {
            setState(() => _selectedNavIndex = index);
          }
        },
      ),
    );
  }
}
