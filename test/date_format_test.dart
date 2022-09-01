import 'package:flutter_test/flutter_test.dart';

import '../lib/src/utils/date_format.dart';

void main() {
  group('date format DMY tests', () {
    test('day < 10 month < 10', () {
      final date = DateTime(2010, 2, 1);
      expect(date.formatDMY, "01/02/2010");
    });
    test('day  >= 10 month >= 10', () {
      final date = DateTime(2010, 12, 10);
      expect(date.formatDMY, "10/12/2010");
    });

    test('day < 10 && month >= 10', () {
      final date = DateTime(2010, 12, 1);
      expect(date.formatDMY, "01/12/2010");
    });
    test('day >= 10 && month < 10', () {
      final date = DateTime(2010, 2, 10);
      expect(date.formatDMY, "10/02/2010");
    });
  });

  group('date format MDY tests', () {
    test('day < 10 && month < 10', () {
      final date = DateTime(2010, 2, 1);
      expect(date.formatMDY, "02/01/2010");
    });
    test('day  >= 10 && month >= 10', () {
      final date = DateTime(2010, 12, 10);
      expect(date.formatMDY, "12/10/2010");
    });
    test('day < 10 && month >= 10', () {
      final date = DateTime(2010, 12, 1);
      expect(date.formatMDY, "12/01/2010");
    });
    test('day >= 10 && month < 10', () {
      final date = DateTime(2010, 2, 10);
      expect(date.formatMDY, "02/10/2010");
    });
  });

  group('date format YMD tests', () {
    test('day < 10 && month < 10', () {
      final date = DateTime(2010, 2, 1);
      expect(date.formatYMD, "2010/02/01");
    });
    test('day  >= 10 && month >= 10', () {
      final date = DateTime(2010, 12, 10);
      expect(date.formatYMD, "2010/12/10");
    });
    test('day < 10 && month >= 10', () {
      final date = DateTime(2010, 12, 1);
      expect(date.formatYMD, "2010/12/01");
    });
    test('day >= 10 && month < 10', () {
      final date = DateTime(2010, 2, 10);
      expect(date.formatYMD, "2010/02/10");
    });
  });
}
