import 'package:flutter/material.dart';
import 'package:friendly_fire_web_app/src/friendly_fiire_app.dart';
import 'package:friendly_fire_web_app/src/provider/items_provider.dart';
import 'package:friendly_fire_web_app/src/repositories/item_repository.dart';
import 'package:provider/provider.dart';

void main() {
  final _itemsRepository = ItemRepository();
  Provider.debugCheckInvalidValueType = null;
  runApp(ChangeNotifierProvider(
      create: (context) => ItemsProvider(_itemsRepository),
      child: FriendlyFireApp()));
}
