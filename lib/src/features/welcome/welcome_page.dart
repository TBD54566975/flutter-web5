import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wallet_exp/src/routing/router.gr.dart';
import 'package:wallet_exp/src/shared/asset_constants.dart';
import 'package:wallet_exp/src/shared/grid.dart';

@RoutePage()
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Grid.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: Grid.lg),
              Text(
                'Welcome!',
                style: Theme.of(context).textTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Grid.xxs),
              Text(
                'It’s time for a more decentralized Web where you own your identity and data.',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: Image.asset(AssetConstants.welcome),
              ),
              FilledButton(
                onPressed: () => context.router.push(InitialPersonasRoute()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                ),
                child: const Text('Get started'),
              ),
              const SizedBox(height: Grid.sm),
              FilledButton(
                onPressed: () => context.router.push(ImportPersonasRoute()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.tertiary,
                ),
                child: const Text('Import your Web5 identity'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
