import 'dart:math';

import 'package:friendly_fire_web_app/src/exceptions/items_exception.dart';
import 'package:friendly_fire_web_app/src/model/item.dart';

class ItemRepository {
  var rng = Random();
  final List<Item> _dummyItemlist = List.generate(
      20,
      (index) => Item(
          title: "Title $index",
          description: "description  $index",
          id: index + 1)).toList();

  Future<List<Item>> readItems() async {
    await Future.delayed(const Duration(seconds: 1));

    if (_isErrorOccurred()) {
      throw ItemsException("Ops Somthing went wrong!");
    }
    return _generateRandomList();
  }

  List<Item> _generateRandomList() {
    final maxNumber = _dummyItemlist.length - 2;

    final randomIndex = rng.nextInt(maxNumber);

    return _dummyItemlist.getRange(randomIndex, randomIndex + 3).toList();
  }

  bool _isErrorOccurred() {
    return rng.nextBool();
  }
}
