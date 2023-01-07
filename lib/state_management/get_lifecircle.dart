import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatefulSimple extends StatefulWidget {
  const StatefulSimple({super.key});

  @override
  State<StatefulSimple> createState() => _StatefulSimpleState();
}

class _StatefulSimpleState extends State<StatefulSimple> {
  String result = '';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  void didChangeDependencies() {
    ///
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant StatefulSimple oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> loadData() async {
    await Future.delayed(const Duration(seconds: 3));
    result = Random.secure().nextInt(100000).toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("StatefulSimple"),
      ),
      body: Center(
        child:
            result.isEmpty ? const CircularProgressIndicator() : Text(result),
      ),
    );
  }
}

class GetStatefulSimpleController extends GetxController {
  GetStatefulSimpleController() {
    ///Same
    loadData();
    // return GetStatefulSimpleController;
  }

  @override
  void onInit() {
    print("GetxController onInit");
    super.onInit();
    loadData();
  }

  @override
  void onReady() {
    print("GetxController Ready");
    super.onReady();
  }

  final TextEditingController controller = TextEditingController();
  RxInt count = 0.obs;

  late Worker totalWorker = once(count, (t) {});
  @override
  void onClose() {
    totalWorker.dispose();
    controller.dispose();
    super.onClose();
  }

  RxString result = ''.obs;
  Future<void> loadData() async {
    await Future.delayed(const Duration(seconds: 3));
    result.value = Random.secure().nextInt(100000).toString();
  }
}

class GetStatefulSimple extends StatelessWidget {
  const GetStatefulSimple({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GetStatefulSimpleController());

    return Scaffold(
      body: Center(
        child: Obx(() {
          return Get.find<GetStatefulSimpleController>().result.value.isEmpty
              ? const CircularProgressIndicator()
              : Text(Get.find<GetStatefulSimpleController>().result.value);
        }),
      ),
    );
  }
}
