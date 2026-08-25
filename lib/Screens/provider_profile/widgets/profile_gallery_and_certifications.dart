import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

/// Horizontal scrolling gallery for provider's past work photos & videos.
class ProfileGallerySection extends StatelessWidget {
  const ProfileGallerySection({super.key});

  static const List<String> _galleryPhotos = [
    FkImages.sample1,
    FkImages.sample2,
    FkImages.sample3,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: FkSizes.md + 4),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Photos & Videos",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: FkColors.textPrimary,
                  letterSpacing: -0.2,
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  "See all",
                  style: TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w600,
                    color: FkColors.brandPrimary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: FkSizes.md - 4),
          SizedBox(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: _galleryPhotos.length,
              separatorBuilder: (_, _) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: SizedBox(
                    width: 112,
                    height: 100,
                    child: Image.asset(
                      _galleryPhotos[index],
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) => Container(
                        color: FkColors.borderCard,
                        child: const Icon(
                          Icons.image_not_supported_outlined,
                          color: FkColors.textMuted,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// Displays credential and certification preview cards.
class ProfileCertificationsSection extends StatelessWidget {
  const ProfileCertificationsSection({super.key});

  static const List<String> _certificates = [
    FkImages.certificate1,
    FkImages.certificate2,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: FkSizes.md + 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Certification",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: FkColors.textPrimary,
              letterSpacing: -0.2,
            ),
          ),
          const SizedBox(height: FkSizes.md - 4),
          Row(
            children: [
              Expanded(child: _buildCertificateCard(_certificates[0])),
              const SizedBox(width: 12),
              Expanded(child: _buildCertificateCard(_certificates[1])),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCertificateCard(String assetPath) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: FkColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: FkColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Image.asset(
          assetPath,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          errorBuilder: (_, _, _) => Container(
            color: FkColors.white,
            child: const Center(
              child: Icon(
                Icons.workspace_premium_rounded,
                color: Color(0xFF00A86B),
                size: 32,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
