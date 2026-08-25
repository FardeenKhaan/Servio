import 'package:flutter/material.dart';
import '../../../models/provider_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

/// Displays the provider's full name, location pin, and office address.
class ProfileIdentitySection extends StatelessWidget {
  final ProviderModel provider;

  const ProfileIdentitySection({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: FkSizes.md + 4),
      child: Column(
        children: [
          const SizedBox(height: FkSizes.md - 2),
          // Provider Full Name
          Text(
            provider.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: FkColors.textPrimary,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: FkSizes.sm),

          // Office Address Title with Location Pin
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on_rounded,
                color: FkColors.brandPrimary,
                size: 15,
              ),
              SizedBox(width: 3),
              Text(
                "Office address:",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: FkColors.brandPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),

          // Address Subtitle
          Text(
            provider.officeAddress,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: FkColors.darkGrey,
              height: 1.35,
            ),
          ),
        ],
      ),
    );
  }
}
