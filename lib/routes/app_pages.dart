import 'package:flutter_pomodoro/modules/timer/timer_binding.dart';
import 'package:flutter_pomodoro/modules/timer/timer_view.dart';
import 'package:flutter_pomodoro/modules/timer_config/timer_config_view.dart';
import 'package:get/get.dart';

import 'package:flutter_pomodoro/routes/app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.timer,
      page: () => TimerView(),
      binding: TimerBinding(),
    ),
    GetPage(name: AppRoutes.timerConfig, page: () => const TimerConfigView()),
  ];
}
