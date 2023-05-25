import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersNotifier extends StateNotifier<List<bool>> {
  FiltersNotifier() : super([false, false, false, false]);
  void changeFilters(List<bool> filtersList) {
    state = filtersList;
  }
}

final filtersListProvider = StateNotifierProvider<FiltersNotifier, List<bool>>(
    (ref) => FiltersNotifier());
