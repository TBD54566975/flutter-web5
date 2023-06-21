import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wallet_exp/src/app.dart';
import 'package:wallet_exp/src/routing/deep_links.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final deepLinks = DeepLinks();
  await deepLinks.initDeepLinks();

  runApp(
    ProviderScope(
      child: App(),
    ),
  );
}
