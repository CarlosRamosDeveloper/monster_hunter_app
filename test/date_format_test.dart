import 'package:flutter_test/flutter_test.dart';
import 'package:monster_hunter_app/src/utils/date_format.dart';

void main() {
  test('date format test', () {
    final date = DateTime(2010, 2, 1);
    expect(date.formatDMY, "01/02/2010");
  });

  test('date format MDY', () {
    final date = DateTime(2010, 2, 1);
    expect(date.formatMDY, "02/01/2010");
  });

  test('date format YMD', () {
    final date = DateTime(2010, 2, 1);
    expect(date.formatYMD, "2010/02/01");
  });
}
