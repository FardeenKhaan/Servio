import 'package:get/get.dart';
import '../Screens/category/category_providers_screen.dart';
import '../data/servio_data.dart';
import '../Screens/home/home_screen.dart';
import '../Screens/home/splash_screen.dart';
import '../models/provider_model.dart';
import '../models/service_category.dart';
import '../Screens/provider_profile/provider_profile_screen.dart';
import 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.splash;

  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.categoryProviders,
      page: () {
        final category = Get.arguments is ServiceCategory
            ? Get.arguments as ServiceCategory
            : ServioData.categories.first;
        return CategoryProvidersScreen(category: category);
      },
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.providerProfile,
      page: () {
        final provider = Get.arguments is ProviderModel
            ? Get.arguments as ProviderModel
            : ServioData.topProviders.first;
        return ProviderProfileScreen(provider: provider);
      },
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
}
