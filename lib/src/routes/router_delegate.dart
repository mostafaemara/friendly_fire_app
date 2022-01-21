import 'package:flutter/material.dart';
import 'package:friendly_fire_web_app/src/model/item.dart';
import 'package:friendly_fire_web_app/src/pages/home_page.dart';
import 'package:friendly_fire_web_app/src/pages/item_details_page.dart';
import 'package:friendly_fire_web_app/src/pages/list_item/list_items_page.dart';
import 'package:friendly_fire_web_app/src/pages/not_found_page.dart';
import 'package:friendly_fire_web_app/src/provider/items_provider.dart';
import 'package:provider/provider.dart';

import 'route_path.dart';

class MyRouterDelegate extends RouterDelegate<RoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;
  RoutePath _currentPath = HomePath();
  RoutePath _lastPath = HomePath();
  int currentIndex = 0;
  MyRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  RoutePath? get currentConfiguration => _currentPath;
  @override
  Widget build(BuildContext context) {
    Item? item;
    if (_currentPath is ItemDetailsPath) {
      item = _findItemById(context, (_currentPath as ItemDetailsPath).id);
    }
    return Navigator(
      key: navigatorKey,
      pages: _buildPages(item),
      onPopPage: _handlePopPage,
    );
  }

  List<Page<dynamic>> _buildPages(Item? item) {
    List<Page<dynamic>> pages = [
      const MaterialPage(key: ValueKey("home"), child: HomePage()),
      if (_currentPath is ItemDetailsPath && item != null)
        MaterialPage(
            key: const ValueKey("itemDetails"),
            child: ItemDetailsPage(
              item: item,
            )),
      if (_currentPath is ItemListPath)
        const MaterialPage(key: ValueKey("items"), child: ListItemsPage()),
      if (_currentPath is UnkownPath ||
          (_currentPath is ItemDetailsPath && item == null))
        const MaterialPage(key: ValueKey("404"), child: NotFoundPage())
    ];

    return pages;
  }

  Item? _findItemById(BuildContext context, int id) {
    final items = context.read<ItemsProvider>().items;
    for (final item in items) {
      if (item.id == id) {
        return item;
      }
    }
  }

  bool _handlePopPage(Route<dynamic> route, dynamic result) {
    final bool success = route.didPop(result);
    if (success) {
      _currentPath = _lastPath;
      _lastPath = HomePath();
    }
    notifyListeners();
    return success;
  }

  @override
  Future<void> setNewRoutePath(RoutePath configuration) async {
    _lastPath = _currentPath;
    _currentPath = configuration;

    notifyListeners();
    return;
  }
}
