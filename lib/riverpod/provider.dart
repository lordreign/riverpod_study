import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_study/model/shopping_item_model.dart';
import 'package:riverpod_study/riverpod/state_notifier_provider.dart';

// provider 안의 provider
final filterShoppingListProvider = Provider<List<ShoppingItemModel>>((ref) {
  // filtering 처리
  final filterState = ref.watch(filterProvider);
  final shoppingListState = ref.watch(shoppingListProvider);

  if (filterState == FilterState.all) {
    return shoppingListState;
  }

  return shoppingListState.where((e) {
    if (filterState == FilterState.spicy) {
      return e.isSpicy;
    } else {
      return !e.isSpicy;
    }
  }).toList();
});

enum FilterState {
  all,
  spicy,
  notSpicy,
}

final filterProvider = StateProvider<FilterState>((ref) => FilterState.all);
