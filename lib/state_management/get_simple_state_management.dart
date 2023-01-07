import 'package:get/get.dart';

class GetSimpleStateManagement extends GetxController {
  ///life circle => StateFulWidget

  // @override
  // void initState() {
  //   super.initState();
  //   fetchData();
  // }

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future fetchData() async {}

  ///provider
  ///int

  ///UI => နဲ့ပတ်သတ်ပြီး manageလုပ်ဖို့အတွက် သုံးမယ်ဆိုရင် Rxပတ်သတ်တဲ့ ကောင်တွေကို သုံးတာပိုကောင်းတယ်
  ///int

  final Rx<int> count = 0.obs;

  void increment() {
    count.value++;
  }

  void decrement() {
    count.value--;
  }
}

///context.read<Provider>()
///context.read<Bloc>()

///Get Instance Management > Provider | Bloc (lazy)
///Instnace Management
///
///
///
///

///final a = GetSimpleStateManagement();
///a.somevalue = 'changes';
///
///final b = GetSimpleStateManagement();
///b.somevalue = '';