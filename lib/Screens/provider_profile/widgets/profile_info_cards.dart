import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../models/provider_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

/// Card showing the number of staffs.
class ProfileStaffsCard extends StatelessWidget {
  final ProviderModel provider;

  const ProfileStaffsCard({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: FkSizes.md + 4),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: FkSizes.md,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          color: FkColors.white,
          borderRadius: BorderRadius.circular(FkSizes.cardRadius),
          border: Border.all(color: FkColors.borderLight),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "No of staffs",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: FkColors.textPrimary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "${provider.staffCount} staffs",
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: FkColors.textMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Card showing reviews summary, rating pill, avatar stack, and chevron action.
class ProfileReviewsCard extends StatelessWidget {
  final ProviderModel provider;

  const ProfileReviewsCard({super.key, required this.provider});

  static const List<String> _reviewerAvatars = [
    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&q=80&w=150',
    'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&q=80&w=150',
    'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&q=80&w=150',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: FkSizes.md + 4),
      child: Container(
        padding: const EdgeInsets.all(FkSizes.md),
        decoration: BoxDecoration(
          color: FkColors.white,
          borderRadius: BorderRadius.circular(FkSizes.cardRadius),
          border: Border.all(color: FkColors.borderLight),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Reviews",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: FkColors.textPrimary,
              ),
            ),
            const SizedBox(height: FkSizes.md - 4),
            Row(
              children: [
                // Rating pill
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: FkSizes.sm,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: FkColors.ratingPillBg,
                    borderRadius: BorderRadius.circular(FkSizes.borderRadiusMd),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: FkColors.starYellow,
                        size: 15,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        provider.rating.toString(),
                        style: const TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w700,
                          color: FkColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: FkSizes.sm),

                // Review Count Text
                const Text(
                  "(1,575 reviews)",
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w400,
                    color: FkColors.textMuted,
                  ),
                ),
                const Spacer(),

                // Overlapping avatar stack
                SizedBox(
                  width: 64,
                  height: 28,
                  child: Stack(
                    children: List.generate(_reviewerAvatars.length, (i) {
                      return Positioned(
                        left: i * 16.0,
                        child: Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: FkColors.white, width: 2),
                          ),
                          child: ClipOval(
                            child: CachedNetworkImage(
                              imageUrl: _reviewerAvatars[i],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(width: 6),

                // Chevron icon
                Container(
                  width: 28,
                  height: 28,
                  decoration: const BoxDecoration(
                    color: FkColors.circularButtonBg,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.chevron_right_rounded,
                    color: FkColors.textDark,
                    size: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
