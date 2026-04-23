import 'package:flutter_test/flutter_test.dart';

import 'package:restaurant_app/app.dart';

void main() {
  testWidgets('bottom navigation opens menu and dish details', (tester) async {
    await tester.pumpWidget(const RestaurantApp());

    expect(find.text('Ember and Thyme'), findsOneWidget);
    expect(find.text('View menu'), findsOneWidget);

    await tester.tap(find.text('Menu'));
    await tester.pumpAndSettle();

    expect(find.text('Smoked Tomato Soup'), findsOneWidget);

    await tester.tap(find.text('Smoked Tomato Soup'));
    await tester.pumpAndSettle();

    expect(find.text('Suggested pairing'), findsOneWidget);
    expect(find.text('Return to menu'), findsOneWidget);
  });
}
