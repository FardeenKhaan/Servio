import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/servio_data.dart';
import '../models/provider_model.dart';
import '../models/service_category.dart';

/// Controller managing the state and search filters of the Servio Home Screen.
class HomeController extends GetxController {
  /// Current active bottom navigation bar tab index.
  final RxInt selectedNavIndex = 0.obs;

  /// Active text query in the search bar.
  final RxString searchQuery = ''.obs;

  /// Controller managing the search input text field.
  final TextEditingController searchController = TextEditingController();

  /// Reactive list of all service categories.
  final RxList<ServiceCategory> categories = <ServiceCategory>[].obs;

  /// Reactive list of all top service providers.
  final RxList<ProviderModel> providers = <ProviderModel>[].obs;

  /// Lifecycle Methods
  @override
  void onInit() {
    super.onInit();
    // Load initial mock datasets from ServioData
    categories.assignAll(ServioData.categories);
    providers.assignAll(ServioData.topProviders);
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  /// Returns categories matching the active search query by title.
  List<ServiceCategory> get filteredCategories {
    final q = searchQuery.value.trim().toLowerCase();
    if (q.isEmpty) return categories.toList();
    return categories.where((c) => c.title.toLowerCase().contains(q)).toList();
  }

  /// Returns providers matching the active search query by name or offered services.
  List<ProviderModel> get filteredProviders {
    final q = searchQuery.value.trim().toLowerCase();
    if (q.isEmpty) return providers.toList();
    return providers.where((p) {
      final nameMatch = p.name.toLowerCase().contains(q);
      final serviceMatch = p.services.any((s) => s.toLowerCase().contains(q));
      return nameMatch || serviceMatch;
    }).toList();
  }

  /// Indicates whether the user has entered a search query.
  bool get hasActiveSearch => searchQuery.value.trim().isNotEmpty;

  /// True if a search query yielded zero categories and zero providers.
  bool get hasNoSearchResults =>
      hasActiveSearch &&
      filteredCategories.isEmpty &&
      filteredProviders.isEmpty;

  // Action Handlers
  /// Updates the search query state on input change.
  void onSearchChanged(String value) {
    searchQuery.value = value;
  }

  /// Clears the search field and resets the query state.
  void clearSearch() {
    searchController.clear();
    searchQuery.value = '';
  }

  /// Handles tab selection from the bottom navigation bar.
  void onNavTapped(int index) {
    selectedNavIndex.value = index;
  }

  /// Toggles the bookmark status for a provider by their unique ID.
  void toggleBookmark(String id) {
    final index = providers.indexWhere((p) => p.id == id);
    if (index != -1) {
      providers[index].isBookmarked = !providers[index].isBookmarked;
      providers.refresh();
    }
  }
}
