import 'package:flutter/material.dart';
import 'package:flutter_pomodoro/modules/timer/timer_controller.dart';
import 'package:flutter_pomodoro/modules/timer/timer_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  group("Timer View", () {
    setUpAll(() {
      Get.testMode = true;
      Get.put<TimerController>(TimerController());
    });

    testWidgets("testando interface timer", (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: TimerView(),
        ),
      );

      expect(find.text("start"), findsOneWidget);
      expect(find.text("stop"), findsOneWidget);

      expect(find.text("TIMER: 00:00"), findsOneWidget);
      await tester.tap(find.text("start"));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.text("TIMER: 29:59"), findsOneWidget);

      await tester.tap(find.text("stop"));
    });
  });
}
