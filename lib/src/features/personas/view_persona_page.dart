import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:wallet_exp/src/features/personas/persona.dart';
import 'package:wallet_exp/src/shared/grid.dart';

@RoutePage()
class ViewPersonaPage extends StatelessWidget {
  final Persona persona;

  const ViewPersonaPage({required this.persona, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(persona.name),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(Grid.sm),
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 104,
                  width: 104,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: persona.backgroundColor(context),
                  ),
                  child: Image.asset(persona.asset),
                ),
              ),
              const SizedBox(height: Grid.lg),
              _dataRow(context, 'Interal ID', persona.did.internalId),
              _dataRow(context, 'ID', persona.did.id),
              _dataRow(
                context,
                'Document',
                persona.did.didDocument.toString(),
              ),
              _dataRow(
                context,
                'Method Data',
                persona.did.methodData.toString(),
              ),
              _dataRow(
                context,
                'Keys',
                persona.did.keys.toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dataRow(BuildContext context, String title, String data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text(data),
        const SizedBox(height: Grid.xs)
      ],
    );
  }
}
