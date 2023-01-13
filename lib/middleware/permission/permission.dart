import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Permission extends GetMiddleware {
  @override
  int? get priority => 1;

  final bool Function(dynamic data) check;
  final String next;
  Permission({required this.check, required this.next});

  @override
  RouteSettings? redirect(String? route) {
    print("GetMiddleware Route => $route");
    print("GetMiddleware Route => ${Get.arguments}");
    if (Get.arguments == null) {
      return RouteSettings(
        name: next,
        arguments: Get.arguments,
      );
    }

    if (check(Get.arguments)) {
      return null;
    }
    return RouteSettings(
      name: next,
      arguments: Get.arguments,
    );
  }
}

class HowToCreateMiddleware extends GetMiddleware {
  @override
  int? get priority => 0;

  @override
  RouteSettings? redirect(String? route) {
    print("HowToCreateMiddleware");

    ///null value returnပြန်ပေးရင် ပေးသွားတယ်
    ///တစ်ခြား screenကိုသွားစေချင်ရင်RouteSettingsတစ်ခုကို returnပြန်ပေး
    ///RouteSettingsရဲ့ nameက ကိုယ်သွားစေချင်တဲ့ Screenရဲ့ name ဖြစ်ဖို့တော့လိုတယ်
    return null;

    ///
    // Get.arguments;
    // if (Get.find<GetBasicController>().age > 18) return null;
    // return const RouteSettings(
    //   name: '/fas',
    // );
  }
}
