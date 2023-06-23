import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:wallet_exp/src/app.dart';
import 'package:wallet_exp/src/routing/deep_links.dart';

void main() async {
  Logger.root.onRecord.listen((record) {
    // ignore: avoid_print
    print('${record.level.name}: ${record.time}: ${record.message}');
  });

  final logger = Logger('main');
  logger.info('Starting app');

  WidgetsFlutterBinding.ensureInitialized();

  final deepLinks = DeepLinks();
  await deepLinks.initDeepLinks();

  runApp(
    ProviderScope(child: App()),
  );
}
