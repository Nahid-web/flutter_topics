import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_counter/second_screen.dart';
import 'package:getx_counter/third_screen.dart';
import 'counter_state_controller.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CounterStateController counterStateController = Get.find<CounterStateController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterStateController.updateValue(3);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Center(child: Text('Count App')),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Get.to(const SecondScreen());
            }, child: const Text('Go to Second Page')),
            ElevatedButton(onPressed: (){
              Get.to(const ThirdScreen());
            }, child: const Text('Go to third Page')),
            GetBuilder<CounterStateController>(
                builder: (controller) {
                  return Text(
                    controller.count.toString(),
                    style: const TextStyle(fontSize: 25),
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}
