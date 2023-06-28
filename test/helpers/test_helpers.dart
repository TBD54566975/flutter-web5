import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wallet_exp/src/l10n/app_localizations.dart';

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
        localizationsDelegates: const [
          Loc.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
        ],
      ),
    );
  }
}
