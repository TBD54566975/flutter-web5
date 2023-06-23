import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: const SafeArea(child: Center(child: Text('Contacts'))),
    );
  }
}
