import 'package:flutter/material.dart';
import 'package:get/get.dart';

///အလွယ် Obx Widgetနဲ့ obs Variableတွေကအလွယ်ကူဆုံးဘဲ
///Obx(() => Widget()) ,သတိထားစရာတစ်ခုရှိတယ်
///Obx Widgetကိုသုံးမယ်ဆိုရင် Obx Widgetထဲမှာ obs variableတစ်ခုခုကို
///အသုံးပြုထားတဲ့ widgetတစ်ခု ရှိနေဖို့လိုတယ်
///
///ပုံမှန် variableတွေကို နောက်မှာ .obsထည့်ပေးလိုက်ရင်ရပြီ

class NumberObsScreen extends StatelessWidget {
  const NumberObsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("ui is rebuild");

    ///int => value
    ///Rx<Int> => .value
    ///int    => RxInt
    ///double => RxDouble
    ///Obx
    final RxInt i = 125.obs;
    // final RxDouble i = 125.68.obs;
    // int i = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Number Obs Screen"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Obx(() {
              return Text(
                "$i",
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              );
            }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {
                    i.value--;
                  },
                  icon: const Icon(Icons.remove)),
              IconButton(
                  onPressed: () {
                    i.value++;
                  },
                  icon: const Icon(Icons.add)),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              ///to => Navigator.of(context).push(MaterialPageRoute(builder:(_){
              ///return}));
              // Get.to(const NumberObsScreen());

              ///toNamed => Navigator.of(context).pushNamed();
              Get.toNamed('/object');

              ///off => replace
              ///offAll => replaceAll
              // Get.off(const NumberObsScreen());
              // Get.offAll(const ObjectObsScreen());
              // Get.offAllNamed('/object');
              // Get.offAndToNamed('/object');

              ///until => တိုင်အောင်
              // Get.offUntil(MaterialPageRoute(builder: (_) {
              //   return const ObjectObsScreen();
              // }), (route) {
              //   return route.settings.name == '/number';
              // });

              // Get.back();
            },
            child: const Text("Go To Int Screen"),
          )
        ],
      ),
    );
  }
}
