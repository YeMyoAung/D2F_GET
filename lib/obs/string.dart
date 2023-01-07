import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StringObsScreen extends StatelessWidget {
  const StringObsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ///obs(null valueမရှိဘူး),obx
    ///RxString  = Rx<String>
    ///.value
    final RxString text = ''.obs;

    print("ui build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("String Obs Screen"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Obx(() {
              print('obx build');
              return Text(
                "${text.value.isEmpty ? null : text.value}",
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              );
            }),
          ),
          TextField(
            onChanged: (value) {
              text.value = value;
            },
          ),
          ElevatedButton(
            onPressed: () {
              // TimeStamp
              // Get.changeTheme(ThemeData.light());

              // Get.defaultDialog(
              //     middleText: "hello world", textConfirm: 'Logout');
              ///showDialog(context,(_){})
              // Get.dialog(const AlertDialog());

              /// showModalBottomSheet(context: context, builder: builder)
              // Get.bottomSheet(Container());

              /// ScaffoldMessenger.of(context).showSnackBar(snackBar)
              // Get.showSnackbar(const GetSnackBar(
              //   snackPosition: SnackPosition.TOP,
              //   title: "From Ye Myo Aung",
              //   message: "hello",
              // ));

              ///to => Navigator.of(context).push(MaterialPageRoute(builder:(_){
              ///return}));
              // Get.to(const NumberObsScreen());

              ///toNamed => Navigator.of(context).pushNamed();
              // Get.toNamed('/number');

              ///off => replace
              ///offAll => replaceAll
              // Get.off(const NumberObsScreen());
              // Get.offNamed('/number');
            },
            child: const Text("Go To Int Screen"),
          )
        ],
      ),
    );
  }
}
