import 'dart:async';

import 'package:flutter_pomodoro/domain/time_manager.dart';

enum TimerStatus {
  working,
  resting,
  stoped,
}

class TimerManager {
  late TimeManager _workTime;
  late TimeManager _restTime;
  late TimeManager _currentTime;
  TimerStatus _status = TimerStatus.stoped;
  Timer? _timer;

  TimerManager(this._workTime, this._restTime) {
    _currentTime = TimeManager(0, 0);
  }

  int get totalTimeInSeconds => _currentTime.totalTimeInSeconds;
  String get currentTime => _currentTime.toString();
  TimerStatus get status => _status;

  void startWork() {
    _status = TimerStatus.working;
    _currentTime = TimeManager(_workTime.minutes, _workTime.seconds);
  }

  void startRest() {
    _status = TimerStatus.resting;
    _currentTime = TimeManager(_restTime.minutes, _restTime.seconds);
  }

  void stopTimer() {
    if (_timer != null) {
      _timer?.cancel();
    }
    _status = TimerStatus.stoped;
    _currentTime = TimeManager(0, 0);
  }

  void _decrementTime() {
    _currentTime.drecrement(1);
    if (_currentTime.totalTimeInSeconds == 0) {
      _status == TimerStatus.working ? startRest() : startRest();
    }
  }

  void startTimer(void Function() callback) {
    startWork();

    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        _timer = timer;
        if (_status == TimerStatus.stoped) {
          timer.cancel();
        }
        callback();
        _decrementTime();
      },
    );
  }
}
