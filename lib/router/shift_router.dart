import 'dart:convert';

import 'package:exercise_mobile/shift/shift.dart';
import 'package:exercise_mobile/shift/shift_detail_view.dart';
import 'package:exercise_mobile/shift/shift_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RoutePath {
  const RoutePath();
}

class ShiftRoutePath extends RoutePath {
  const ShiftRoutePath(this._shift);
  final Shift _shift;
  Shift get shift => _shift;
}

class ShiftRouterDelegate extends RouterDelegate<RoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RoutePath> {
  Shift? _selectedShift;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onPopPage: (route, dynamic result) {
        if (!route.didPop(result)) {
          return false;
        }
        _selectedShift = null;
        notifyListeners();
        return true;
      },
      key: navigatorKey,
      pages: [
        MaterialPage<void>(
          key: const ValueKey('ShiftListPage'),
          child: ShiftsPage(
            tapShift: (Shift shift) {
              _selectedShift = shift;
              notifyListeners();
            },
          ),
        ),
        if (_selectedShift != null)
          MaterialPage<void>(
            key: ValueKey(_selectedShift),
            child: ShiftDetailsPage(_selectedShift!),
          )
      ],
    );
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  Future<void> setNewRoutePath(RoutePath configuration) {
    if (configuration is ShiftRoutePath) {
      _selectedShift = configuration.shift;
    } else {
      _selectedShift = null;
    }
    notifyListeners();
    return SynchronousFuture<void>(null);
  }
}

class ShiftRouteInformationParser extends RouteInformationParser<RoutePath> {
  @override
  Future<RoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? '');
    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] == 'shift') {
        final shiftJsonString = uri.pathSegments[1];
        return ShiftRoutePath(
          Shift.fromJson(jsonDecode(shiftJsonString) as Map<String, dynamic>),
        );
      }
    }
    return const RoutePath();
  }

  @override
  RouteInformation restoreRouteInformation(RoutePath path) {
    if (path is ShiftRoutePath) {
      return RouteInformation(location: '/shift/${path.shift.id}');
    }
    return const RouteInformation(location: '/');
  }
}
