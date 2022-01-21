import 'package:flutter/material.dart';
import 'package:friendly_fire_web_app/src/model/item.dart';

import 'list_item.dart';

class ItemsListView extends StatelessWidget {
  const ItemsListView({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<Item> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => ListItem(item: items[index]),
    );
  }
}
