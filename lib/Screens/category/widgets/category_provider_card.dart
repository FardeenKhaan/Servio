import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../models/provider_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

/// Provider card widget displayed in category listings (e.g. Home cleaning).
class CategoryProviderCard extends StatelessWidget {
  /// Provider data model
  final ProviderModel provider;

  /// Callback when the card is tapped
  final VoidCallback? onTap;

  /// Callback when the "Book" button is tapped
  final VoidCallback? onBookTap;

  /// Callback when the bookmark icon is toggled
  final VoidCallback? onBookmarkToggle;

  const CategoryProviderCard({
    super.key,
    required this.provider,
    this.onTap,
    this.onBookTap,
    this.onBookmarkToggle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(FkSizes.cardRadius),
      child: Container(
        padding: const EdgeInsets.all(FkSizes.cardRadiusSm),
        decoration: BoxDecoration(
          color: FkColors.cardBackground,
          borderRadius: BorderRadius.circular(FkSizes.cardRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ---------------------------------------------------------------
              // Left: Provider Photo
              // ---------------------------------------------------------------
              ClipRRect(
                borderRadius: BorderRadius.circular(FkSizes.cardRadiusSm),
                child: SizedBox(
                  width: 88,
                  height: 88,
                  child: provider.avatar.startsWith('assets/')
                      ? Image.asset(
                          provider.avatar,
                          fit: BoxFit.cover,
                          errorBuilder: (_, _, _) => Container(
                            color: FkColors.borderCard,
                            child: const Icon(
                              Icons.person,
                              color: FkColors.textMuted,
                              size: 32,
                            ),
                          ),
                        )
                      : CachedNetworkImage(
                          imageUrl: provider.avatar,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            color: FkColors.light,
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
                            color: FkColors.borderCard,
                            child: const Icon(
                              Icons.person,
                              color: FkColors.textMuted,
                              size: 32,
                            ),
                          ),
                        ),
                ),
              ),

              const SizedBox(width: FkSizes.cardRadiusSm),

              // ---------------------------------------------------------------
              // Center: Provider Name, Star Rating, and Hourly Price
              // ---------------------------------------------------------------
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Provider Name
                    Text(
                      provider.name,
                      style: const TextStyle(
                        fontSize: FkSizes.fontSizeMd,
                        fontWeight: FontWeight.w700,
                        color: FkColors.textPrimary,
                        letterSpacing: -0.2,
                        height: 1.2,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: FkSizes.sm),

                    // Rating badge + review count text
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 7,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: FkColors.white,
                            borderRadius:
                                BorderRadius.circular(FkSizes.borderRadiusMd),
                            border: Border.all(
                              color: FkColors.divider,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.star_rounded,
                                color: FkColors.starYellow,
                                size: 14,
                              ),
                              const SizedBox(width: 3),
                              Text(
                                provider.rating.toString(),
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: FkColors.textPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: FkSizes.sm),
                        Flexible(
                          child: Text(
                            provider.reviewCount,
                            style: const TextStyle(
                              fontSize: 12.5,
                              fontWeight: FontWeight.w400,
                              color: FkColors.darkGrey,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // Hourly rate
                    Text(
                      "\$${provider.hourlyRate}/hr",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: FkColors.textPrimary,
                        letterSpacing: -0.2,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: FkSizes.sm),

              // ---------------------------------------------------------------
              // Right: Bookmark Toggle & Book Button
              // ---------------------------------------------------------------
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Bookmark button
                  GestureDetector(
                    onTap: onBookmarkToggle,
                    behavior: HitTestBehavior.opaque,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 2, left: 8),
                      child: Icon(
                        provider.isBookmarked
                            ? Icons.bookmark_rounded
                            : Icons.bookmark_border_rounded,
                        color: FkColors.brandPrimary,
                        size: FkSizes.iconMd,
                      ),
                    ),
                  ),

                  // Pill "Book" action button
                  Material(
                    color: FkColors.brandPrimary,
                    borderRadius: BorderRadius.circular(22),
                    child: InkWell(
                      onTap: onBookTap ?? onTap,
                      borderRadius: BorderRadius.circular(22),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 9,
                        ),
                        child: Text(
                          "Book",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: FkColors.white,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
