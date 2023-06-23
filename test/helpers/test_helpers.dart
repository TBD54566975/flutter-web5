import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'mocks.dart';

class TestHelpers {
  static Widget testableTabsWidget({
    required Widget child,
    List<Override> overrides = const [],
    MockTabsRouter? mockTabsRouter,
  }) {
    return ProviderScope(
      overrides: overrides,
      child: MaterialApp(
        home: TabsRouterScope(
          controller: mockTabsRouter ?? MockTabsRouter(),
          stateHash: 0,
          child: Scaffold(body: child),
        ),
      ),
    );
  }
}
