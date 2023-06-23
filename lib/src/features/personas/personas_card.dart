import 'package:flutter/material.dart';
import 'package:wallet_exp/src/shared/grid.dart';

class PersonasCard extends StatelessWidget {
  final Color backgroundColor;
  final String title;
  final int connections;
  final String lastActivity;
  final String asset;

  const PersonasCard({
    required this.backgroundColor,
    required this.title,
    required this.connections,
    required this.lastActivity,
    required this.asset,
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
              color: backgroundColor,
            ),
            child: Image.asset(asset),
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
}
