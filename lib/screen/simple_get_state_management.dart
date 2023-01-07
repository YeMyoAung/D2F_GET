import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../state_management/get_simple_state_management.dart';

class SimpleGetStateManagementScreen extends StatelessWidget {
  final String title;
  const SimpleGetStateManagementScreen({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    final GetSimpleStateManagement stateManagement = Get.find(tag: 'simple');
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() {
            return Text(stateManagement.count.toString());
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  stateManagement.decrement();
                },
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () {
                  stateManagement.increment();
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              switch (title) {
                case 'Screen Two':
                  Get.to(const SimpleGetStateManagementScreen(
                    title: "Screen Three",
                  ));
                  break;
                case 'Screen Three':
                  Get.to(const SimpleGetStateManagementScreen(
                    title: "Screen Four",
                  ));
                  break;
                case 'Screen Four':
                  Get.offAll(const SimpleGetStateManagementScreen(
                    title: "SimpleGetStateManagementScreen",
                  ));
                  break;
                default:
                  Get.to(const SimpleGetStateManagementScreen(
                    title: "Screen Two",
                  ));
              }
            },
            child: const Icon(Icons.arrow_right),
          )
        ],
      ),
    );
  }
}
