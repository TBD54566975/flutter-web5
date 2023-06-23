import 'package:flutter/material.dart';
import 'package:wallet_exp/src/shared/grid.dart';

class BottomNavContainer extends StatelessWidget {
  final Widget child;

  const BottomNavContainer({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom > 0
        ? MediaQuery.of(context).padding.bottom + Grid.xs
        : Grid.xs;

    return Container(
      padding: EdgeInsets.only(
        top: Grid.xs,
        bottom: bottomPadding,
        left: Grid.xs,
        right: Grid.xs,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: child,
    );
  }
}
