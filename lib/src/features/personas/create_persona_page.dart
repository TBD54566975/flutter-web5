import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CreatePersonaPage extends StatelessWidget {
  const CreatePersonaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personas'),
      ),
      body: const SafeArea(child: Center(child: Text('Create Persona'))),
    );
  }
}
