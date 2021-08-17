import 'package:flutter_pomodoro/domain/time_manager.dart';
import 'package:flutter_pomodoro/domain/timer_manager.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("domain > timer_manager", () {
    test('should be create a stoped timer', () {
      final timer = TimerManager(TimeManager(30, 0), TimeManager(15, 0));

      expect(timer.status, TimerStatus.stoped);
      expect(timer.currentTime, "00:00");
    });

    test('should be start work time with 30 min', () {
      final timer = TimerManager(TimeManager(30, 0), TimeManager(15, 0));

      timer.startWork();

      expect(timer.status, TimerStatus.working);
      expect(timer.currentTime, "30:00");
    });

    test('should be start rest time with 15 min', () {
      final timer = TimerManager(TimeManager(30, 0), TimeManager(15, 0));

      timer.startRest();

      expect(timer.status, TimerStatus.resting);
      expect(timer.currentTime, "15:00");
    });

    test('should be stop rest timer', () {
      final timer = TimerManager(TimeManager(30, 0), TimeManager(15, 0));

      timer.startWork();

      timer.stopTimer();
      expect(timer.status, TimerStatus.stoped);
      expect(timer.currentTime, "00:00");
    });

    test('Should be start the timer with 3 secs to work and 2 sec to rest',
        () async {
      var callbackIsCalled = false;

      final timer = TimerManager(TimeManager(0, 3), TimeManager(0, 2));

      timer.startTimer(() {
        callbackIsCalled = true;
      });

      await Future.delayed(const Duration(seconds: 3), () {});

      expect(timer.status, TimerStatus.resting);
      expect(timer.currentTime, "00:02");

      timer.stopTimer();

      assert(callbackIsCalled);
    });
  });
}
