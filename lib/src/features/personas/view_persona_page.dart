import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ViewPersonaPage extends StatelessWidget {
  const ViewPersonaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Persona'),
      ),
      body: const SafeArea(child: Center(child: Text('View Persona'))),
    );
  }
}
