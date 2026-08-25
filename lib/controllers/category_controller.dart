import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/servio_data.dart';
import '../models/provider_model.dart';
import '../models/service_category.dart';

/// Controller managing state, search filtering, and bookmarks for a specific category screen.
class CategoryController extends GetxController {
  /// The category currently being viewed.
  final ServiceCategory category;

  CategoryController({required this.category});

  /// Active navigation tab index on this screen.
  final RxInt selectedNavIndex = 0.obs;

  /// Active search query string for filtering providers.
  final RxString searchQuery = ''.obs;

  /// Text editing controller for the category search field.
  final TextEditingController searchController = TextEditingController();

  /// Reactive list of providers in this category.
  final RxList<ProviderModel> providers = <ProviderModel>[].obs;

  // Lifecycle Methods
  @override
  void onInit() {
    super.onInit();
    // Load category-specific providers
    providers.assignAll(ServioData.getCleaningProviders());
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  /// Returns providers filtered by search query matching name or service tag.
  List<ProviderModel> get filteredProviders {
    final query = searchQuery.value.trim().toLowerCase();
    if (query.isEmpty) {
      return providers;
    }
    return providers
        .where((p) =>
            p.name.toLowerCase().contains(query) ||
            p.services.any((s) => s.toLowerCase().contains(query)))
        .toList();
  }

  /// Toggles the bookmark status for a provider by their ID.
  void toggleBookmark(String id) {
    final index = providers.indexWhere((p) => p.id == id);
    if (index != -1) {
      providers[index].isBookmarked = !providers[index].isBookmarked;
      providers.refresh();
    }
  }
}
