import 'package:flutter/material.dart';

/// A NavigatorObserver that can be used to react to route transitions.
///
/// This basic implementation prints route changes to the console.
/// You can add custom logic here, for example, to trigger animations
/// or interact with state management based on navigation events.
class TransitionRouteObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    // Log route push events
    if (route is PageRoute && previousRoute is PageRoute) {
      debugPrint(
        'Route Pushed: ${route.settings.name} from ${previousRoute.settings.name}',
      );
    } else if (route is PageRoute) {
      debugPrint('Route Pushed: ${route.settings.name} (Initial Route)');
    }
    // TODO: Add any logic needed when a route is pushed (e.g., start animations)
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    // Log route pop events
    if (route is PageRoute && previousRoute is PageRoute) {
      debugPrint(
        'Route Popped: ${route.settings.name}, returning to ${previousRoute.settings.name}',
      );
    }
    // TODO: Add any logic needed when a route is popped (e.g., reset state)
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    // Log route replace events
    if (newRoute is PageRoute && oldRoute is PageRoute) {
      debugPrint(
        'Route Replaced: ${oldRoute.settings.name} with ${newRoute.settings.name}',
      );
    }
    // TODO: Add any logic needed when a route is replaced
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    // Log route remove events
    if (route is PageRoute && previousRoute is PageRoute) {
      debugPrint(
        'Route Removed: ${route.settings.name}, previous was ${previousRoute.settings.name}',
      );
    } else if (route is PageRoute) {
      debugPrint('Route Removed: ${route.settings.name}');
    }
    // TODO: Add any logic needed when a route is removed
  }

  @override
  void didStartUserGesture(
    Route<dynamic> route,
    Route<dynamic>? previousRoute,
  ) {
    super.didStartUserGesture(route, previousRoute);
    // Log user gesture start (e.g., swipe back)
    // debugPrint('User started gesture on route: ${route.settings.name}');
    // TODO: Add logic if needed when a user starts a pop gesture
  }

  @override
  void didStopUserGesture() {
    super.didStopUserGesture();
    // Log user gesture stop
    // debugPrint('User stopped gesture');
    // TODO: Add logic if needed when a user stops/cancels a pop gesture
  }
}
