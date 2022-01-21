import 'package:flutter/material.dart';
import 'package:friendly_fire_web_app/src/model/item.dart';
import 'package:friendly_fire_web_app/src/provider/items_provider.dart';
import 'package:provider/provider.dart';

class ItemDetailsPage extends StatelessWidget {
  const ItemDetailsPage({
    Key? key,
    required this.item,
  }) : super(key: key);
  final Item item;

  @override
  Widget build(BuildContext context) {
    final isFavorite = context.read<ItemsProvider>().favoriteItemId == item.id;
    return Title(
      color: Colors.black,
      title: "Item #${item.id}",
      child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Text(item.title),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(item.description),
                if (isFavorite)
                  const Icon(
                    Icons.check,
                    color: Colors.green,
                  )
              ],
            ),
          )),
    );
  }
}
