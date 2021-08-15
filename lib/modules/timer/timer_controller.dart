import 'package:flutter_pomodoro/domain/time_manager.dart';
import 'package:get/get.dart';

class TimerController extends GetxController {
  final _time = TimeManager(30, 00);

  var time = "00:00".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    time.value = _time.toString();
  }

  void increment() {
    _time.increment(1);
    time.value = _time.toString();
  }
}
