import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:wallet_exp/src/shared/grid.dart';

@RoutePage()
class ViewPersonaPage extends StatelessWidget {
  final String title;
  final String did;

  const ViewPersonaPage({required this.title, required this.did, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(Grid.sm),
          child: Text(did),
        ),
      ),
    );
  }
}
