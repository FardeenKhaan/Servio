import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:servio/routes/app_routes.dart';
import 'package:servio/utils/constants/colors.dart';
import 'package:servio/utils/constants/image_strings.dart';
import 'package:servio/utils/constants/sizes.dart';

/// Animated Splash Screen that introduces the Servio brand on launch.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Configure light system status bar icons over the dark forest green background
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );

    // Trigger automatic navigation after a brief splash delay
    _navigateToHome();
  }

  /// Navigates to the Home Screen using GetX replacement routing after 2400ms.
  void _navigateToHome() {
    Timer(const Duration(milliseconds: 2400), () {
      if (mounted) {
        Get.offNamed(AppRoutes.home);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Proportional logo width scaling based on device viewport
    final double logoWidth = FkSizes.w(context, 215).clamp(180.0, 260.0);

    return Scaffold(
      backgroundColor: FkColors.brandPrimary, // Primary brand green (#004E42)
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 3),

              // Branding logo on primary green (#004E42)
              Image.asset(
                    FkImages.appBranding,
                    width: logoWidth,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Text(
                        "Servio",
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.5,
                          color: FkColors.white,
                        ),
                      );
                    },
                  )
                  .animate()
                  .fadeIn(duration: 600.ms)
                  .scale(
                    begin: const Offset(0.88, 0.88),
                    end: const Offset(1.0, 1.0),
                    duration: 700.ms,
                    curve: Curves.easeOutBack,
                  ),

              const Spacer(flex: 3),

              const SizedBox(
                width: FkSizes.iconMd + 2, // 26px
                height: FkSizes.iconMd + 2,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(FkColors.white),
                ),
              ).animate().fadeIn(delay: 400.ms, duration: 400.ms),

              const SizedBox(height: FkSizes.xxl), // 40px bottom spacing
            ],
          ),
        ),
      ),
    );
  }
}
