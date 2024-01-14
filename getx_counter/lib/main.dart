import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'counter_state_controller.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class GetXDependencyBinder extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(CounterStateController());
  }
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: GetXDependencyBinder(),
      home: const HomeScreen(),
    );
  }
}
