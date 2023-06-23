import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:wallet_exp/src/shared/bottom_nav_container.dart';

@RoutePage()
class CreatePersonaPage extends StatelessWidget {
  final logger = Logger('CreatePersonaPage');
  CreatePersonaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personas')),
      body: const SafeArea(child: Center(child: Text('Create Persona'))),
      bottomNavigationBar: BottomNavContainer(
        child: FilledButton(
          onPressed: () => logger.info('Create new persona'),
          child: const Text('Create'),
        ),
      ),
    );
  }
}
