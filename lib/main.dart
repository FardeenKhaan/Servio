import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'routes/routes.dart';
import 'utils/constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Servio',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme.apply(
            bodyColor: FkColors.textPrimary,
            displayColor: FkColors.textPrimary,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: FkColors.brandPrimary,
          primary: FkColors.brandPrimary,
          secondary: FkColors.brandSecondary,
          surface: FkColors.white,
          onSurface: FkColors.textPrimary,
          error: FkColors.error,
        ),
        scaffoldBackgroundColor: FkColors.scaffoldBackground,
      ),
      initialRoute: AppPages.initial,
      getPages: AppPages.pages,
    );
  }
}
