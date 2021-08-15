import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pomodoro/modules/timer/timer_controller.dart';
import 'package:get/get.dart';

class TimerView extends StatelessWidget {
  final _controller = Get.find<TimerController>();

  TimerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () {
              return Text(
                "TIMER: ${_controller.time}",
                key: const Key("timer"),
              );
            },
          ),
          TextButton(
            onPressed: () {
              // Get.toNamed(AppRoutes.TIMER_CONFIG);
              _controller.increment();
            },
            child: const Text("config "),
          ),
        ],
      ),
    );
  }
}
