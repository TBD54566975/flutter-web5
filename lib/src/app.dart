import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wallet_exp/src/features/web5/web5_service.dart';
import 'package:wallet_exp/src/l10n/app_localizations.dart';
import 'package:wallet_exp/src/routing/router.dart';
import 'package:wallet_exp/src/routing/router.gr.dart';
import 'package:wallet_exp/src/shared/grid.dart';
import 'package:wallet_exp/src/shared/themes.dart';
import 'package:wallet_exp/src/storage/storage_providers.dart';

class App extends HookConsumerWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final didBox = ref.watch(didBoxProvider);

    useEffect(() {
      final web5Service = ref.read(web5Provider);
      web5Service.start();
      return () => web5Service.stop();
    }, []);

    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(
        deepLinkBuilder: (deepLink) => DeepLink(
          [
            didBox.isEmpty ? const WelcomeRoute() : const AppTabs(),
          ],
        ),
      ),
      routeInformationParser: _appRouter.defaultRouteParser(),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        filledButtonTheme: FilledButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(Grid.xs),
            textStyle: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        filledButtonTheme: FilledButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(Grid.xs),
            textStyle: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ),
      localizationsDelegates: const [
        Loc.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('es', ''),
        Locale('zh', 'CN'),
      ],
    );
  }
}
