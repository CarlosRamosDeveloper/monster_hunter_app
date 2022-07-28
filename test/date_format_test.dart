import 'package:flutter_test/flutter_test.dart';
import 'package:monster_hunter_app/src/utils/date_format.dart';

void main() {
  test('date format test', () {
    final date = DateTime(2010, 2, 10);
    expect(date.formatDMY, "10/02/2010");
  });

  test('date format MDY', () {
    final date = DateTime(2010, 12, 1);
    expect(date.formatMDY, "12/01/2010");
  });

  test('date format YMD', () {
    final date = DateTime(2010, 12, 10);
    expect(date.formatYMD, "2010/12/10");
  });
}
