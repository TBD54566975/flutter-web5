import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wallet_exp/src/app.dart';
import 'package:wallet_exp/src/features/personas/list_personas_page.dart';
import 'package:wallet_exp/src/features/web5/web5_service.dart';
import 'package:wallet_exp/src/features/welcome/welcome_page.dart';
import 'package:wallet_exp/src/storage/storage_providers.dart';

import 'helpers/mocks.dart';

void main() {
  late MockWeb5Service web5Service;
  late MockHiveBox didBox;

  setUp(() {
    web5Service = MockWeb5Service();
    didBox = MockHiveBox();
  });

  testWidgets('App launches welcome page', (WidgetTester tester) async {
    when(() => didBox.isEmpty).thenReturn(true);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          web5Provider.overrideWithValue(web5Service),
          didBoxProvider.overrideWithValue(didBox),
        ],
        child: App(),
      ),
    );

    await tester.pumpAndSettle();
    expect(find.byType(WelcomePage), findsOneWidget);
    verify(() => didBox.isEmpty).called(1);
  });

  testWidgets('App launches tabs on personas page',
      (WidgetTester tester) async {
    when(() => didBox.isEmpty).thenReturn(false);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          web5Provider.overrideWithValue(web5Service),
          didBoxProvider.overrideWithValue(didBox),
        ],
        child: App(),
      ),
    );

    await tester.pumpAndSettle();
    expect(find.byType(ListPersonasPage), findsOneWidget);
    verify(() => didBox.isEmpty).called(1);
  });
}
