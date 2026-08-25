import 'package:flutter/material.dart';
import '../../../models/provider_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

/// Horizontal selectable service pills and description text.
class ProfileServicesSection extends StatefulWidget {
  final ProviderModel provider;

  const ProfileServicesSection({super.key, required this.provider});

  @override
  State<ProfileServicesSection> createState() => _ProfileServicesSectionState();
}

class _ProfileServicesSectionState extends State<ProfileServicesSection> {
  int _selectedIndex = 0;
  final List<String> _services = ['Cooking', 'Plumbing', 'Laundry'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: FkSizes.md + 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Services",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: FkColors.textPrimary,
              letterSpacing: -0.2,
            ),
          ),
          const SizedBox(height: FkSizes.md - 4),

          // Horizontal list of service selection chips
          Wrap(
            spacing: 10,
            runSpacing: 8,
            children: List.generate(_services.length, (index) {
              final isSelected = _selectedIndex == index;
              return GestureDetector(
                onTap: () => setState(() => _selectedIndex = index),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? FkColors.brandPrimary : FkColors.white,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: isSelected
                          ? FkColors.brandPrimary
                          : FkColors.brandSecondary,
                      width: 1.2,
                    ),
                  ),
                  child: Text(
                    _services[index],
                    style: TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w600,
                      color: isSelected
                          ? FkColors.white
                          : FkColors.brandSecondary,
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: FkSizes.md - 4),

          // Service Description
          Text(
            widget.provider.about,
            style: const TextStyle(
              fontSize: 13.5,
              height: 1.5,
              color: FkColors.darkGrey,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
