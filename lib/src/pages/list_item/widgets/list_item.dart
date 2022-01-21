import 'package:flutter/material.dart';
import 'package:friendly_fire_web_app/src/model/item.dart';
import 'package:friendly_fire_web_app/src/provider/items_provider.dart';
import 'package:friendly_fire_web_app/src/routes/route_path.dart';
import 'package:provider/provider.dart';

class ListItem extends StatelessWidget {
  const ListItem({Key? key, required this.item}) : super(key: key);
  final Item item;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Router.of(context)
            .routerDelegate
            .setNewRoutePath(ItemDetailsPath(item.id));
      },
      leading: Consumer<ItemsProvider>(
        builder: (context, itemsProvider, child) => Checkbox(
          value: itemsProvider.favoriteItemId == item.id,
          onChanged: (value) {
            itemsProvider.setFavoriteItem(item.id);
          },
        ),
      ),
      title: Text(item.title),
      subtitle: Text(item.description),
    );
  }
}
