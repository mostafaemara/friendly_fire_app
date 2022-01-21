class RoutePath {
  final Uri uri;

  RoutePath(this.uri);
}

class HomePath extends RoutePath {
  HomePath() : super(Uri(path: "/"));
}

class ItemListPath extends RoutePath {
  ItemListPath() : super(Uri(path: "/items"));
}

class ItemDetailsPath extends RoutePath {
  final int id;

  ItemDetailsPath(this.id) : super(Uri(path: "/items/$id"));
}

class UnkownPath extends RoutePath {
  UnkownPath() : super(Uri(path: "/404"));
}
