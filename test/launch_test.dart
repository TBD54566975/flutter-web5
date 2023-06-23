import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wallet_exp/src/app.dart';
import 'package:wallet_exp/src/features/web5/web5_service.dart';

import 'helpers/mocks.dart';

void main() {
  late MockWeb5Service web5Service;

  setUp(() {
    web5Service = MockWeb5Service();
  });

  testWidgets('App launches with tabs', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [web5Provider.overrideWithValue(web5Service)],
        child: App(),
      ),
    );
    expect(find.byType(App), findsOneWidget);
  });
}
