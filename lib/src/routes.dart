import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_earth_history/src/features/collection/collection.dart';
import 'package:flutter_earth_history/src/features/overview/overview.dart';
import 'package:flutter_earth_history/src/features/period/period.dart';
import 'package:flutter_earth_history/src/features/timeline/timeline.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProjectRoute {
  const ProjectRoute(this.route);
  static const overviewScreen = ProjectRoute('/overview');
  static const globalTimelineScreen = ProjectRoute('/global-timeline');
  static const collectionScreen = ProjectRoute('/collection');
  static const periodScreen = ProjectRoute('/period');

  final String route;

  @override
  String toString() => route;
}

final routerProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    initialLocation: ProjectRoute.overviewScreen.route,
    redirect: (context, state) async {
      var hooks = <String, RoutePreload>{};

      if (hooks.containsKey(state.uri.toString())) {
        return await hooks[state.uri.toString()]!(context, ref, state);
      }
      return null;
    },
    routes: [
      GoRoute(
        path: ProjectRoute.globalTimelineScreen.route,
        builder: (context, state) => const GlobalTimelineScreen(),
      ),
      GoRoute(
        path: ProjectRoute.overviewScreen.route,
        builder: (context, state) => const OverviewScreen(),
      ),
      GoRoute(
        path: ProjectRoute.periodScreen.route,
        builder: (context, state) => const PeriodScreen(),
      ),
      GoRoute(
        path: ProjectRoute.collectionScreen.route,
        builder: (context, state) => const CollectionScreen(),
      ),
    ],
  ),
);

typedef RoutePreload = FutureOr<String?> Function(
  BuildContext context,
  ProviderRef ref,
  GoRouterState state,
);

CustomTransitionPage buildPageWithFadeTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) =>
    CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
    );

CustomTransitionPage buildPageWithoutTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) =>
    CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          child,
    );
