import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/basic_controller.dart';

class BasicControllerScreen extends StatelessWidget {
  const BasicControllerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GetBasicController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basic Controller"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Obx((){
          //   DataTypeရွေးတယ်
          //   Obx Widgetကိုသုံးမယ််ဆိုရင် လက်ရှိ Obxထဲမှာreturnပေးထားတဲ့
          //   Widgetမှာ .obs variable တစ်ခုကိုသုံးထားဖို့လိုတယ်
          //   aတန်ဖိုးလေး အပြောင်းအလဲဖြစ်တိုင်းမှာ ပြန်လည်တည်ဆောက်နေမှာ
          //   return Text(a.value);
          // })

          GetBuilder<GetBasicController>(
            id: '2',
            builder: (controller) {
              print("Name is Rebuild");
              return Text(controller.name.value);
            },
          ),

          // Text("Name"),
          TextField(
            onChanged: (value) {
              Get.find<GetBasicController>().changeName(value);
            },
          ),

          GetBuilder<GetBasicController>(
            id: 'age',
            builder: (controller) {
              print("Age is Rebuild");
              return Text(controller.age.toString());
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.find<GetBasicController>().increase();
        },
      ),
    );
  }
}
