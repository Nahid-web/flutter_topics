import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_counter/home_screen.dart';
import 'package:getx_counter/second_screen.dart';
import 'counter_state_controller.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  CounterStateController counterStateController =
      Get.find<CounterStateController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Third Screen')),
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Get.to(const SecondScreen());
            },
            child: const Text('Go to Second Page'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.offAll(const HomeScreen());
            },
            child: const Text('Go to Home Page'),
          ),
        ],
      )),
    );
  }
}
