import 'package:get/get.dart';

// final GetBasicController controller = GetBasicController();

class GetBasicController extends GetxController {
  //.obs => context.watch()
  RxString name = 'Mg Mg'.obs;

  void changeName(String value) {
    name.value = value;
    // notifylistener()
    // emit
    // update();
    // notifiylistener() == update()

    // update(['name','2']) =>သတ်မှတ်ထားတဲ့ idတွေကိုဘဲ buildပြန်လုပ်တယ်
    //
  }

  int age = 0;
  void increase() {
    age++;
    update(['age']);
  }
}
