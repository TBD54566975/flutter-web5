import 'package:auto_route/auto_route.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wallet_exp/src/features/web5/web5_service.dart';

class MockTabsRouter extends Mock implements TabsRouter {}

class MockWeb5Service extends Mock implements Web5Service {}

class MockHiveBox extends Mock implements Box {}
