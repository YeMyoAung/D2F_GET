import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MiddlewareScreen extends StatelessWidget {
  final String title;
  const MiddlewareScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final RxInt number = 0.obs;
    ModalRoute.of(context)?.settings;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ///spread
          if (title == 'Home Screen') ...[
            Obx(() {
              return Text(number.toString());
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      number.value--;
                    },
                    icon: const Icon(Icons.remove)),
                IconButton(
                    onPressed: () {
                      number.value++;
                    },
                    icon: const Icon(Icons.add))
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  // if (number.value > 5) {
                  //   Get.toNamed('/profile', arguments: number.value);
                  // } else {
                  Get.toNamed('/login-screen', arguments: number.value);
                  // }
                },
                child: const Text("Login Screen")),
            ElevatedButton(
                onPressed: () {
                  // if (number.value > 5) {
                  Get.toNamed('/profile', arguments: number.value);
                  // } else {
                  //   Get.toNamed('/login-screen', arguments: number.value);
                  // }
                },
                child: const Text("Profile Screen")),
          ],

          // if (title == 'Home Screen') ...[
          //   Obx(() {
          //     return Text(number.toString());
          //   }),
          //   Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       IconButton(
          //           onPressed: () {
          //             number.value--;
          //           },
          //           icon: const Icon(Icons.remove)),
          //       IconButton(
          //           onPressed: () {
          //             number.value++;
          //           },
          //           icon: const Icon(Icons.add))
          //     ],
          //   ),
          //   ElevatedButton(
          //       onPressed: () {
          //         if (number.value > 5) {
          //           Get.toNamed('/profile');
          //         } else {
          //           Get.toNamed('/login-screen');
          //         }
          //       },
          //       child: const Text("Login Screen")),
          //   ElevatedButton(
          //       onPressed: () {}, child: const Text("Profile Screen")),
          // ]
        ],
      ),
    );
  }
}
