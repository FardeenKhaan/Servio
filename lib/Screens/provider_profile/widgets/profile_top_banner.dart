import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/provider_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

/// Top banner widget with parallax gradient, back button, "Fully booked" pill,
/// and overlapping circular avatar.
class ProfileTopBanner extends StatelessWidget {
  final ProviderModel provider;

  const ProfileTopBanner({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        // Background Banner Image with Gradient Overlay
        Container(
          margin: const EdgeInsets.only(bottom: 48),
          height: 220,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(FkImages.providerBackground),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              // Subtle gradient overlay for back button contrast
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.28),
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.08),
                    ],
                  ),
                ),
              ),

              // Circular White Back Button
              SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: FkSizes.md,
                    top: FkSizes.sm,
                  ),
                  child: InkWell(
                    onTap: () => Get.back(),
                    borderRadius: BorderRadius.circular(24),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: FkColors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.12),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: FkColors.textPrimary,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ),

              // "Fully booked" status badge on bottom-right of the banner
              Positioned(
                right: FkSizes.md,
                bottom: 18,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: FkColors.fullyBookedBg,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: FkColors.brandSecondary.withValues(alpha: 0.45),
                      width: 1,
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Fully booked",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: FkColors.fullyBookedText,
                        ),
                      ),
                      SizedBox(width: 6),
                      Icon(
                        Icons.circle,
                        size: 7,
                        color: FkColors.fullyBookedDot,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // Overlapping Circular Profile Avatar
        Positioned(
          bottom: 0,
          child: Container(
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: FkColors.white, width: 4),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipOval(
              child: provider.avatar.startsWith('assets/')
                  ? Image.asset(
                      provider.avatar,
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) => Container(
                        color: FkColors.borderCard,
                        child: const Icon(
                          Icons.person,
                          size: 40,
                          color: FkColors.textMuted,
                        ),
                      ),
                    )
                  : CachedNetworkImage(
                      imageUrl: provider.avatar,
                      fit: BoxFit.cover,
                      placeholder: (_, _) => Container(
                        color: FkColors.borderCard,
                        child: const Center(
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
                      errorWidget: (_, _, _) => Container(
                        color: FkColors.borderCard,
                        child: const Icon(
                          Icons.person,
                          size: 40,
                          color: FkColors.textMuted,
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
