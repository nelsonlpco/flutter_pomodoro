import 'package:flutter_pomodoro/domain/time_manager.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("domain > time_manager", () {
    test('Should be input 12 min and 58 sec expect to return 778 seconds', () {
      final time = TimeManager(12, 58);

      equals(time, 778);
    });

    test('Should be input 2 min and 8 sec returns 02:08', () {
      final time = TimeManager(2, 8);

      expect(time.toString(), "02:08");
    });

    test('Should be input 2 min and 59 sec and increment 1 sec should be 3:00',
        () {
      final time = TimeManager(2, 59);
      time.increment(1);

      expect(time.toString(), "03:00");
    });

    test('Should be input 2 min and 0 sec and decrement 1 sec should be 1:59',
        () {
      final time = TimeManager(2, 0);
      time.drecrement(1);

      expect(time.toString(), "01:59");
    });

    test('Should be input 0 min and 0 sec and decrement 1 sec should be 00:00',
        () {
      final time = TimeManager(0, 0);
      time.drecrement(1);

      expect(time.toString(), "00:00");
    });
  });
}
