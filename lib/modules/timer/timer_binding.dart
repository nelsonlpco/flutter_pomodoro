import 'package:flutter_pomodoro/modules/timer/timer_controller.dart';
import 'package:get/get.dart';

class TimerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TimerController>(() => TimerController());
  }
}
