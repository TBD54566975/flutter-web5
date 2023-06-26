import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:wallet_exp/src/app.dart';
import 'package:wallet_exp/src/storage/storage_providers.dart';

void main() async {
  Logger.root.onRecord.listen((record) {
    log('${record.level.name}: ${record.time}: ${record.message}');
  });

  final logger = Logger('main');
  logger.info('Starting app');

  WidgetsFlutterBinding.ensureInitialized();

  Hive.initFlutter();
  final didBox = await createDidBox();

  runApp(
    ProviderScope(
      overrides: [didBoxProvider.overrideWithValue(didBox)],
      child: App(),
    ),
  );
}
