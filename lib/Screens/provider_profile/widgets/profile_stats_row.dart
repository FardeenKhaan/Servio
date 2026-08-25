import 'package:flutter/material.dart';
import '../../../models/provider_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

/// Row of 3 pastel cream stat cards: Rating, Total Bookings, Services Offered.
class ProfileStatsRow extends StatelessWidget {
  final ProviderModel provider;

  const ProfileStatsRow({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: FkSizes.md + 4),
      child: Row(
        children: [
          // 1. Overall Rating Card
          Expanded(
            child: _StatCard(
              header: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.star_rounded,
                    color: FkColors.starYellow,
                    size: 17,
                  ),
                  const SizedBox(width: 3),
                  Text(
                    provider.rating.toString(),
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: FkColors.textPrimary,
                    ),
                  ),
                ],
              ),
              label: "Overall rating",
            ),
          ),
          const SizedBox(width: 10),

          // 2. Total Bookings Card
          Expanded(
            child: _StatCard(
              header: Text(
                provider.totalBookings.toString(),
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: FkColors.textPrimary,
                ),
              ),
              label: "Total Bookings",
            ),
          ),
          const SizedBox(width: 10),

          // 3. Services Offered Card
          Expanded(
            child: _StatCard(
              header: Text(
                provider.servicesOffered.toString(),
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: FkColors.textPrimary,
                ),
              ),
              label: "Services offered",
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final Widget header;
  final String label;

  const _StatCard({required this.header, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 6),
      decoration: BoxDecoration(
        color: FkColors.surfaceSubtle,
        borderRadius: BorderRadius.circular(FkSizes.cardRadius),
      ),
      child: Column(
        children: [
          header,
          const SizedBox(height: 5),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: FkColors.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}
