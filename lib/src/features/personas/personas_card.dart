import 'package:flutter/material.dart';
import 'package:wallet_exp/src/shared/asset_constants.dart';
import 'package:wallet_exp/src/shared/grid.dart';

class PersonasCard extends StatelessWidget {
  final String title;
  final String did;
  final int connections;
  final String lastActivity;

  const PersonasCard({
    required this.title,
    required this.did,
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
              color: _backgroundColor(context, title),
            ),
            child: Image.asset(_asset(context, title)),
          ),
          const SizedBox(width: Grid.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  'Connections: $connections',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  'Last activity: $lastActivity',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Color _backgroundColor(BuildContext context, String title) {
    switch (title) {
      case 'Social':
        return Theme.of(context).colorScheme.secondary;
      case 'Career':
        return Theme.of(context).colorScheme.tertiary;
      default:
        return Theme.of(context).colorScheme.primary;
    }
  }

  String _asset(BuildContext context, String title) {
    switch (title) {
      case 'Social':
        return AssetConstants.personCollar;
      case 'Career':
        return AssetConstants.personSuit;
      default:
        return AssetConstants.personHoodie;
    }
  }
}
