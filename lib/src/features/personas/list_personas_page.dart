import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wallet_exp/src/features/personas/personas_card.dart';
import 'package:wallet_exp/src/features/personas/personas_providers.dart';
import 'package:wallet_exp/src/routing/router.gr.dart';
import 'package:wallet_exp/src/shared/bottom_nav_container.dart';

@RoutePage()
class ListPersonasPage extends HookConsumerWidget {
  const ListPersonasPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personas = ref.watch(personasProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Personas'),
      ),
      body: SafeArea(
        child: ListView(
          children: personas.entries
              .map(
                (e) => InkWell(
                  onTap: () => context.router.push(ViewPersonaRoute(
                    title: e.key,
                    did: e.value,
                  )),
                  child: PersonasCard(
                    title: e.key,
                    did: e.value,
                    connections: 42,
                    lastActivity: '3 hr',
                  ),
                ),
              )
              .toList(),
        ),
      ),
      bottomNavigationBar: BottomNavContainer(
        child: FilledButton(
          onPressed: () => context.router.push(CreatePersonaRoute()),
          child: const Text('Create new persona'),
        ),
      ),
    );
  }
}
