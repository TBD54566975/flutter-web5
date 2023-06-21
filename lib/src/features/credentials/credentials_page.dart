import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CredentialsPage extends StatelessWidget {
  const CredentialsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Credentials'),
    );
  }
}
