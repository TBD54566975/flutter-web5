import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

@RoutePage()
class ImportPersonasPage extends StatelessWidget {
  final logger = Logger('ImportPersonasPage');
  ImportPersonasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Import Personas')),
      body: const SafeArea(child: Center(child: Text('Coming soon...'))),
    );
  }
}
