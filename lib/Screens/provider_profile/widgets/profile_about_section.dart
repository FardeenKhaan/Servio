import 'package:flutter/material.dart';
import '../../../models/provider_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

/// Expandable "About me" biography section with "Read more.." toggle.
class ProfileAboutSection extends StatefulWidget {
  final ProviderModel provider;

  const ProfileAboutSection({super.key, required this.provider});

  @override
  State<ProfileAboutSection> createState() => _ProfileAboutSectionState();
}

class _ProfileAboutSectionState extends State<ProfileAboutSection> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final String fullText = widget.provider.about;
    final String previewText = fullText.length > 110
        ? '${fullText.substring(0, 110)}...'
        : fullText;
    final String displayText = _isExpanded ? fullText : previewText;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: FkSizes.md + 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "About me",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: FkColors.textPrimary,
              letterSpacing: -0.2,
            ),
          ),
          const SizedBox(height: FkSizes.sm),
          Text.rich(
            TextSpan(
              style: const TextStyle(
                fontSize: 13.5,
                height: 1.5,
                color: FkColors.darkGrey,
                fontWeight: FontWeight.w400,
              ),
              children: [
                TextSpan(text: displayText),
                WidgetSpan(
                  alignment: PlaceholderAlignment.baseline,
                  baseline: TextBaseline.alphabetic,
                  child: GestureDetector(
                    onTap: () => setState(() => _isExpanded = !_isExpanded),
                    child: Text(
                      _isExpanded ? " Read less" : " Read more..",
                      style: const TextStyle(
                        fontSize: 13.5,
                        height: 1.5,
                        fontWeight: FontWeight.w700,
                        color: FkColors.brandPrimary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
