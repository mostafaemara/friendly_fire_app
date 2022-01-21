import 'package:flutter/cupertino.dart';
import 'package:friendly_fire_web_app/src/exceptions/items_exception.dart';
import 'package:friendly_fire_web_app/src/model/item.dart';

import 'package:friendly_fire_web_app/src/repositories/item_repository.dart';

enum ItemsState { init, loading, loaded, error }

class ItemsProvider extends ChangeNotifier {
  ItemsProvider(this._itemRepository);
  List<Item> items = [];
  String errorMessage = "";
  final ItemRepository _itemRepository;

  int favoriteItemId = 0;
  ItemsState state = ItemsState.init;

  void loadItems() async {
    try {
      state = ItemsState.loading;
      notifyListeners();
      items = await _itemRepository.readItems();
      state = ItemsState.loaded;
    } on ItemsException catch (e) {
      state = ItemsState.error;
      errorMessage = e.message;
    }

    notifyListeners();
  }

  void setFavoriteItem(int id) {
    favoriteItemId = id;
    notifyListeners();
  }
}
