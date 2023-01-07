import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetWorkerExample extends StatefulWidget {
  const GetWorkerExample({super.key});

  @override
  State<GetWorkerExample> createState() => _GetWorkerExampleState();
}

class _GetWorkerExampleState extends State<GetWorkerExample> {
  ///
  RxString name = ''.obs;

  RxInt total = 0.obs;
  RxInt discount = 0.obs;
  RxInt price = 0.obs;
  RxInt count = 0.obs;

  late Worker totalWorker = once(total, (t) {});

  @override
  void dispose() {
    totalWorker.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    ///Rxတန်ဖိုးလေး ပထမဆုံးအကြိမ်ပြောင်းလဲသွားတာနဲ့အလုပ်လုပ်မယ်
    // once(name, (_) {
    //   print("First Time");
    // });

    // ever(name, (_) {
    //   print("Changes....");
    // });

    // everAll([total, discount, price, count], (_) {
    //   ///
    // });

    ///ကြားကာလ
    ///သတ်မှတ်ထားတဲ့ အချိန်အတွင်း listenလုပ်ထားတဲ့ rxတန်ဖိုးကို စိတ်ကြိုက်ပြောင်းလဲခွင့်ရှိတယ်
    // interval(name, (_) {
    // if (name.isEmpty) {
    //   Get.defaultDialog(middleText: "Game Over");
    // }
    // }, time: const Duration(seconds: 5));

    // name.value = '';

    ///ဆက်တိုက်ပြောင်းလဲနေတဲ့ တန်ဖိုးကြီးရပ်သွားတဲ့အချိန်မှာအလုပ်လုပ်မယ်
    // debounce(name, (value) {
    //   setState(() {});
    // }, time: const Duration(milliseconds: 400));
  }

  @override
  Widget build(BuildContext context) {
    print("ui is rebuild");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Worker"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() {
            print("obx is rebuild");
            return Text(name.value);
          }),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              onChanged: (text) {
                name.value = text;
              },
            ),
          )
        ],
      ),
    );
  }
}
