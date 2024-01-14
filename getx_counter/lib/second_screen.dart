import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_counter/home_screen.dart';
import 'package:getx_counter/third_screen.dart';
import 'counter_state_controller.dart';



class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  CounterStateController counterStateController = Get.find<CounterStateController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('SecondScreen')),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Get.to(const ThirdScreen());
            }, child: const Text('Go to Third Page')),
            ElevatedButton(onPressed: (){
              Get.offAll(const HomeScreen());
            }, child: const Text('Go to Home Page')),
          ],
        )
      ),
    );
  }
}
