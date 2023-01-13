import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenAndControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BindingController());
  }
}

class BindingController extends GetxController {
  bool isDarkMode = false;

  void change() {
    isDarkMode = !isDarkMode;
    Get.updateLocale(
      isDarkMode ? const Locale('a') : const Locale('b'),
    );

    // final theme1 = ThemeData(
    //   appBarTheme: const AppBarTheme(
    //     backgroundColor: Colors.pink,
    //   ),
    //   floatingActionButtonTheme: const FloatingActionButtonThemeData(
    //     backgroundColor: Colors.red,
    //   ),
    // );
    // final theme2 = ThemeData(
    //   appBarTheme: const AppBarTheme(
    //     backgroundColor: Colors.amber,
    //   ),
    //   floatingActionButtonTheme: const FloatingActionButtonThemeData(
    //     backgroundColor: Colors.yellow,
    //   ),
    // );

    ///First Method(ထည့်ပေးလိုက်တဲ့ themeကို သုံးပေးမှာ)
    // Get.changeTheme(isDarkMode ? theme1 : theme2);
    // Second Method(ပုံသေသွားတာ)
    // Get.changeThemeMode(isDarkMode ? ThemeMode.dark : ThemeMode.light);
    // update(['random']);
  }
}
