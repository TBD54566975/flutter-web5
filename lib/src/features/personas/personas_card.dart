import 'package:flutter/material.dart';
import 'package:wallet_exp/src/features/personas/persona.dart';
import 'package:wallet_exp/src/l10n/app_localizations.dart';
import 'package:wallet_exp/src/shared/grid.dart';

class PersonasCard extends StatelessWidget {
  final Persona persona;
  final int connections;
  final String lastActivity;

  const PersonasCard({
    required this.persona,
    required this.connections,
    required this.lastActivity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: Grid.sm, vertical: Grid.xs),
      child: Row(
        children: [
          Container(
            height: 104,
            width: 104,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: persona.backgroundColor(context),
            ),
            child: Image.asset(persona.asset),
          ),
          const SizedBox(width: Grid.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  persona.name,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  '${Loc.of(context).connections}: $connections',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  '${Loc.of(context).lastActivity}: $lastActivity',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
