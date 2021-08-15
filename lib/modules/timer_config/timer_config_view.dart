import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimerConfigView extends StatelessWidget {
  const TimerConfigView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: newMethod(),
    );
  }

  Center newMethod() {
    return const Center(
      child: Text("Timer Config"),
    );
  }
}
