import 'dart:developer';

import 'package:flutter/material.dart';

import 'route_path.dart';

class RouteParser extends RouteInformationParser<RoutePath> {
  @override
  Future<RoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    try {
      if (routeInformation.location == null) {
        return HomePath();
      }

      final uri = Uri.parse(routeInformation.location!);
      log("goto " + uri.path);
      log("pathSegments.length " + uri.pathSegments.length.toString());
      if (uri.pathSegments.isEmpty) {
        return HomePath();
      } else if (uri.pathSegments.length == 1) {
        if (uri.pathSegments[0] == "items") {
          log("pathSegment " + uri.pathSegments[0]);
          return ItemListPath();
        }
      } else if (uri.pathSegments.length == 2) {
        if (uri.pathSegments[0] == "items") {
          log("pathSegment " + uri.pathSegments[0]);
          final id = int.tryParse(uri.pathSegments[1]);

          return ItemDetailsPath(id!);
        }
      }
      return UnkownPath();
    } catch (e) {
      return UnkownPath();
    }
  }

  @override
  RouteInformation? restoreRouteInformation(RoutePath configuration) {
    return RouteInformation(location: configuration.uri.path);
  }
}
