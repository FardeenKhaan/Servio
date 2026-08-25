import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../controllers/home_controller.dart';
import '../../../models/provider_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class TopProvidersList extends StatelessWidget {
  final HomeController controller;
  final List<ProviderModel> providers;
  final Function(ProviderModel)? onProviderTap;

  const TopProvidersList({
    super.key,
    required this.controller,
    required this.providers,
    this.onProviderTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header: "Top providers" & "See all"
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Top providers",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1E1E1E),
                  letterSpacing: -0.2,
                ),
              ),
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(6),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  child: Text(
                    "See all",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: FkColors.brandPrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 14),

        if (providers.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Text(
              "No matching providers",
              style: TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.w500,
                color: Color(0xFF8A8F94),
              ),
            ),
          )
        else
          ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: providers.length,
            separatorBuilder: (_, _) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final provider = providers[index];
              return _ProviderCard(
                provider: provider,
                onTap: () => onProviderTap?.call(provider),
                onBookmarkToggle: () => controller.toggleBookmark(provider.id),
              );
            },
          ),
      ],
    );
  }
}

class _ProviderCard extends StatelessWidget {
  final ProviderModel provider;
  final VoidCallback? onTap;
  final VoidCallback? onBookmarkToggle;

  const _ProviderCard({
    required this.provider,
    this.onTap,
    this.onBookmarkToggle,
  });

  String _formatServices(List<String> services) {
    if (services.isEmpty) return '';
    if (services.length <= 2) return services.join(' • ');
    return '${services[0]} • ${services[1]} • +${services.length - 2} more';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFFEEEEEE),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            // Provider Photo
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: 76,
                height: 76,
                child: provider.avatar.startsWith('assets/')
                    ? Image.asset(
                        provider.avatar,
                        fit: BoxFit.cover,
                        errorBuilder: (_, _, _) => Container(
                          color: const Color(0xFFE2E8F0),
                          child: const Icon(
                            Icons.person,
                            color: Color(0xFF94A3B8),
                            size: 32,
                          ),
                        ),
                      )
                    : CachedNetworkImage(
                        imageUrl: provider.avatar,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          color: const Color(0xFFF2F4F7),
                          child: const Center(
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: FkColors.brandPrimary,
                              ),
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          color: const Color(0xFFE2E8F0),
                          child: const Icon(
                            Icons.person,
                            color: Color(0xFF94A3B8),
                            size: 32,
                          ),
                        ),
                      ),
              ),
            ),

            const SizedBox(width: 14),

            // Provider Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  Text(
                    provider.name,
                    style: const TextStyle(
                      fontSize: 16.5,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1E1E1E),
                      letterSpacing: -0.2,
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Subtitle: e.g. "Cooking • Laundry • +2 more"
                  Text(
                    _formatServices(provider.services),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF757575),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Rating pill
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xFFE5E7EB),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: Color(0xFFFFB800),
                          size: 15,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          provider.rating.toString(),
                          style: const TextStyle(
                            fontSize: 12.5,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF222222),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Bookmark Action
            GestureDetector(
              onTap: onBookmarkToggle,
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  provider.isBookmarked
                      ? Icons.bookmark_rounded
                      : Icons.bookmark_border_rounded,
                  color: FkColors.brandPrimary,
                  size: FkSizes.iconMd,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
