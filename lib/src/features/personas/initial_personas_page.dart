import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:wallet_exp/src/features/personas/persona.dart';
import 'package:wallet_exp/src/features/personas/personas_providers.dart';
import 'package:wallet_exp/src/features/web5/did.dart';
import 'package:wallet_exp/src/features/web5/web5_service.dart';
import 'package:wallet_exp/src/routing/router.gr.dart';
import 'package:wallet_exp/src/shared/asset_constants.dart';
import 'package:wallet_exp/src/shared/grid.dart';
import 'package:wallet_exp/src/storage/storage_providers.dart';

enum LoadingState {
  initial,
  creating,
  done,
}

@RoutePage()
class InitialPersonasPage extends HookConsumerWidget {
  final logger = Logger('InitialPersonasPage');
  InitialPersonasPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = useState<LoadingState>(LoadingState.initial);
    final personalState = useState<LoadingState>(LoadingState.initial);
    final socialState = useState<LoadingState>(LoadingState.initial);
    final careerState = useState<LoadingState>(LoadingState.initial);

    return Scaffold(
      appBar: AppBar(title: const Text('Initial Personas')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Grid.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: Grid.lg),
              Text(
                "Let's get started!",
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Grid.xxs),
              Text(
                "To help get you started, we're going to create a few standard personas",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Grid.sm),
              Column(
                children: [
                  _personaRow(
                    context,
                    'Personal',
                    Theme.of(context).colorScheme.primary,
                    AssetConstants.personHoodie,
                    personalState.value,
                  ),
                  const SizedBox(height: Grid.xs),
                  _personaRow(
                    context,
                    'Social',
                    Theme.of(context).colorScheme.primary,
                    AssetConstants.personCollar,
                    socialState.value,
                  ),
                  const SizedBox(height: Grid.xs),
                  _personaRow(
                    context,
                    'Career',
                    Theme.of(context).colorScheme.primary,
                    AssetConstants.personSuit,
                    careerState.value,
                  ),
                ],
              ),
              const Spacer(),
              if (pageState.value == LoadingState.initial)
                FilledButton(
                  onPressed: () => _createPersonas(
                    context,
                    ref,
                    personalState,
                    socialState,
                    careerState,
                    pageState,
                  ),
                  child: const Text('Start'),
                ),
              if (pageState.value == LoadingState.done)
                FilledButton(
                  onPressed: () => context.router.replaceAll([const AppTabs()]),
                  child: const Text('Done'),
                ),
              const SizedBox(height: Grid.sm),
            ],
          ),
        ),
      ),
    );
  }

  Widget _personaRow(BuildContext context, String title, Color backgroundColor,
      String asset, LoadingState state) {
    return ListTile(
      leading: Image.asset(asset, height: 40, width: 40),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      trailing: _stateIcon(context, state),
    );
  }

  Widget? _stateIcon(BuildContext context, LoadingState state) {
    switch (state) {
      case LoadingState.initial:
        return null;
      case LoadingState.creating:
        return const SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(),
        );
      case LoadingState.done:
        return Icon(Icons.check, color: Theme.of(context).colorScheme.primary);
      default:
        return null;
    }
  }

  Future<void> _createPersonas(
    BuildContext context,
    WidgetRef ref,
    ValueNotifier<LoadingState> personalState,
    ValueNotifier<LoadingState> socialState,
    ValueNotifier<LoadingState> careerState,
    ValueNotifier<LoadingState> pageState,
  ) async {
    pageState.value = LoadingState.creating;

    personalState.value = LoadingState.creating;
    final personal = await _createPersona(context, ref, 'Personal');
    personalState.value = LoadingState.done;

    socialState.value = LoadingState.creating;
    // ignore: use_build_context_synchronously
    final social = await _createPersona(context, ref, 'Social');
    socialState.value = LoadingState.done;

    careerState.value = LoadingState.creating;
    // ignore: use_build_context_synchronously
    final career = await _createPersona(context, ref, 'Career');
    careerState.value = LoadingState.done;

    ref.read(personasProvider.notifier).state = [
      personal,
      social,
      career,
    ];

    pageState.value = LoadingState.done;
  }

  Future<Persona> _createPersona(
    BuildContext context,
    WidgetRef ref,
    String name,
  ) async {
    final web5 = ref.read(web5Provider);
    final didBox = ref.read(didBoxProvider);
    final did = await web5.createDid();
    if (did == null) {
      if (context.mounted) throw Exception('Failed to create $name persona');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to create $name persona'),
        ),
      );

      throw Exception('Failed to create $name persona');
    }

    final persona = Persona(name: name, did: Did.fromJson(jsonDecode(did)));
    await didBox.put(name, jsonEncode(persona));

    // Fake a delay for the UI
    await Future.delayed(const Duration(seconds: 1));
    return persona;
  }
}
