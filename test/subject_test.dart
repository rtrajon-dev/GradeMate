import 'package:flutter_test/flutter_test.dart';

import 'package:grademate/models/subject.dart';

void main() {
  Subject withMark(int mark) => Subject(id: 0, name: 'Test', mark: mark);

  group('Subject.grade thresholds', () {
    test('80 and above is A', () {
      expect(withMark(100).grade, 'A');
      expect(withMark(80).grade, 'A');
    });

    test('65 to 79 is B', () {
      expect(withMark(79).grade, 'B');
      expect(withMark(65).grade, 'B');
    });

    test('50 to 64 is C', () {
      expect(withMark(64).grade, 'C');
      expect(withMark(50).grade, 'C');
    });

    test('below 50 is F', () {
      expect(withMark(49).grade, 'F');
      expect(withMark(0).grade, 'F');
    });
  });
}
