import 'package:flutter_test/flutter_test.dart';

import 'package:grademate/main.dart';

void main() {
  testWidgets('App boots to the Add Subject screen', (WidgetTester tester) async {
    await tester.pumpWidget(const GradeMateApp());

    expect(find.text('Add Subject'), findsWidgets);
    expect(find.text('Summary'), findsWidgets);
  });
}
