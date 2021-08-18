import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pomodoro/modules/timer/timer_controller.dart';
import 'package:get/get.dart';

class TimerView extends StatefulWidget {
  TimerView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TimerViewState();
}

class TimerViewState extends State<TimerView> {
  final _controller = Get.find<TimerController>();

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
              _controller.startTimer();
            },
            child: const Text("start"),
          ),
          TextButton(
            onPressed: () {
              _controller.stopTimer();
            },
            child: const Text("stop"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
