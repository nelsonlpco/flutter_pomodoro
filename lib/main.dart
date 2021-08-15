import 'package:flutter/material.dart';
import 'package:flutter_pomodoro/routes/app_pages.dart';
import 'package:flutter_pomodoro/routes/app_routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // actions: ,
      getPages: AppPages.routes,
      initialRoute: AppRoutes.timer,
    ),
  );
}
