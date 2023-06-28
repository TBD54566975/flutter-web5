import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:wallet_exp/src/features/personas/persona.dart';
import 'package:wallet_exp/src/features/personas/personas_card.dart';
import 'package:wallet_exp/src/features/personas/personas_providers.dart';
import 'package:wallet_exp/src/l10n/app_localizations.dart';
import 'package:wallet_exp/src/routing/router.gr.dart';
import 'package:wallet_exp/src/shared/bottom_nav_container.dart';
import 'package:wallet_exp/src/storage/storage_providers.dart';

@RoutePage()
class ListPersonasPage extends HookConsumerWidget {
  final logger = Logger('ListPersonasPage');
  ListPersonasPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final didBox = ref.watch(didBoxProvider);
    final personas = ref.watch(personasProvider);

    useEffect(() {
      final personas = didBox.values
          .map((e) => Persona.fromJson(jsonDecode(e.toString())))
          .toList();
      Future.delayed(Duration.zero, () {
        ref.watch(personasProvider.notifier).state = personas;
      });

      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: Text(Loc.of(context).personas),
      ),
      body: SafeArea(
        child: ListView(
          children: personas.map((persona) {
            return InkWell(
              onTap: () => context.router.push(ViewPersonaRoute(
                persona: persona,
              )),
              child: PersonasCard(
                persona: persona,
                connections: 42,
                lastActivity: '3 hr',
              ),
            );
          }).toList(),
        ),
      ),
      bottomNavigationBar: BottomNavContainer(
        child: FilledButton(
          onPressed: () => context.router.push(CreatePersonaRoute()),
          child: Text(Loc.of(context).createNewPersona),
        ),
      ),
    );
  }
}
