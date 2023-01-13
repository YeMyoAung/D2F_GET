import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/binding/binding/binding.dart';
//StateFul  => 2
//StateLess => 1

class BindingHomeScreen extends StatefulWidget {
  const BindingHomeScreen({super.key});

  @override
  State<BindingHomeScreen> createState() => _BindingHomeScreenState();
}

class _BindingHomeScreenState extends State<BindingHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // backgroundColor: !Get.isDarkMode ? Colors.pink : Colors.amber,
          ),
      body: Center(
        child: Text('2'.tr),
      ),
      // body: Center(
      //   child: GetBuilder<BindingController>(
      //     id: 'random',
      //     builder: (controller) {
      //       return controller.isDarkMode
      //           ? const Icon(Icons.dark_mode)
      //           : const Icon(Icons.light_mode);
      //     },
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.find<BindingController>().change();
          setState(() {});
        },
      ),
    );
  }
}
