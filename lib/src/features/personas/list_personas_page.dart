import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wallet_exp/src/features/personas/personas_card.dart';
import 'package:wallet_exp/src/routing/router.gr.dart';
import 'package:wallet_exp/src/shared/bottom_nav_container.dart';

@RoutePage()
class ListPersonasPage extends HookConsumerWidget {
  const ListPersonasPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personas'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            InkWell(
              onTap: () => context.router.push(const ViewPersonaRoute()),
              child: PersonasCard(
                backgroundColor: Theme.of(context).colorScheme.primary,
                title: 'Personal',
                connections: 42,
                lastActivity: '3 hr',
                asset: 'assets/images/person_hoodie.png',
              ),
            ),
            InkWell(
              onTap: () => context.router.push(const ViewPersonaRoute()),
              child: PersonasCard(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                title: 'Social',
                connections: 123,
                lastActivity: '24 min',
                asset: 'assets/images/person_collar.png',
              ),
            ),
            InkWell(
              onTap: () => context.router.push(const ViewPersonaRoute()),
              child: PersonasCard(
                backgroundColor: Theme.of(context).colorScheme.tertiary,
                title: 'Career',
                connections: 13,
                lastActivity: '1 day',
                asset: 'assets/images/person_suit.png',
              ),
            ),
          ],
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
