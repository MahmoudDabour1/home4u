import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class RouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _logRouteChange('Pushed', route);
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _logRouteChange('Popped', route);
    super.didPop(route, previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (newRoute != null) {
      _logRouteChange('Replaced', newRoute);
    }
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _logRouteChange('Removed', route);
    super.didRemove(route, previousRoute);
  }

  @override
  void didStartUserGesture(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _logRouteChange('Started user gesture on', route);
    super.didStartUserGesture(route, previousRoute);
  }

  @override
  void didStopUserGesture() {
    logger.i('Stopped user gesture');
    super.didStopUserGesture();
  }

  /// Helper method to log route changes
  void _logRouteChange(String action, Route<dynamic> route) {
    final routeName = _extractRouteName(route);
    final logName = routeName ?? route.runtimeType.toString();
    logger.i('$action route: $logName');
  }

  /// Try to extract route name from Route.settings.name
  String? _extractRouteName(Route<dynamic> route) {
    return route.settings.name;
  }
}
