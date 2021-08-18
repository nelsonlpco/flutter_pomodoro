import 'package:flutter_pomodoro/domain/time_manager.dart';
import 'package:flutter_pomodoro/domain/timer_manager.dart';
import 'package:get/get.dart';

class TimerController extends GetxController {
  final _timer = TimerManager(TimeManager(30, 0), TimeManager(15, 0));

  var time = "00:00".obs;

  @override
  void onInit() {
    super.onInit();
    time.value = _timer.currentTime;
  }

  void startTimer() {
    _timer.startTimer(() {
      time.value = _timer.currentTime;
    });
  }

  void stopTimer() {
    _timer.stopTimer();
    time.value = _timer.currentTime;
  }

  @override
  void dispose() {
    stopTimer();
    super.dispose();
  }
}
