import 'package:flutter/material.dart';
import '../utils/constants/colors.dart';

class ServiceCategory {
  final String id;
  final String title;
  final String? assetPath;
  final IconData? icon;
  final String? emoji;
  final Color iconColor;
  final Color bgColor;

  const ServiceCategory({
    required this.id,
    required this.title,
    this.assetPath,
    this.icon,
    this.emoji,
    this.iconColor = FkColors.brandPrimary,
    this.bgColor = FkColors.categoryBg,
  });
}
