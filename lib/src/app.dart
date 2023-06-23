import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wallet_exp/src/features/web5/web5_service.dart';
import 'package:wallet_exp/src/routing/router.dart';
import 'package:wallet_exp/src/shared/grid.dart';
import 'package:wallet_exp/src/shared/themes.dart';

class App extends HookConsumerWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      final web5Service = ref.read(web5Provider);
      web5Service.start();
      return () => web5Service.stop();
    }, []);

    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        filledButtonTheme: FilledButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(Grid.xs),
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
          ),
        ),
      ),
    );
  }
}
