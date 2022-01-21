import 'package:flutter/material.dart';

import 'package:friendly_fire_web_app/src/provider/items_provider.dart';
import 'package:provider/provider.dart';

import 'widgets/items_list_view.dart';

class ListItemsPage extends StatelessWidget {
  const ListItemsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Title(
      color: Colors.black,
      title: "Items",
      child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  context.read<ItemsProvider>().loadItems();
                },
              )
            ],
            centerTitle: false,
            title: const Text("items"),
          ),
          body: Consumer<ItemsProvider>(
            builder: (context, itemsProvider, child) {
              final state = itemsProvider.state;

              if (state == ItemsState.init) {
                itemsProvider.loadItems();
              }
              if (state == ItemsState.loaded) {
                return ItemsListView(items: itemsProvider.items);
              }
              if (state == ItemsState.error) {
                return Center(
                  child: Text(itemsProvider.errorMessage),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          )),
    );
  }
}
