import 'package:get/get.dart';
import 'package:flutter/material.dart';

///How it work
///Example of .obs
// class CustomRxString {
//   String _value;
//   CustomRxString(this._value);
//   String get value => _value;
//   set value(String data) {
//     _value = data;
//   }

//   @override
//   String toString() {
//     return value;
//   }
// }

// extension _String on String {
//   CustomRxString get cobs {
//     return CustomRxString(this);
//   }
// }

///
///final String name = 'mg mg';
///final rxconvert = name.cobs //CustomRxString('mg mg')
///print(rxconvert)///CustomRxString('mg mg')
///rxconvert.value
///

/// Example End

class CounterState {
  int i;
  String name;
  CounterState(this.i, this.name);
}

class R {
  CounterState value;
  R(this.value);
}

class ObjectObsScreen extends StatelessWidget {
  const ObjectObsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final CounterState state = CounterState(0, '');
    // state.i = 2;
    // state.name = 'mg mg';

    // final rx = R(state);
    // rx.value.i = 1;
    /**
     * Example Start
     */
    // const String name = 'mg mg';
    // print("Example => $name");
    // print("Example => ${name.runtimeType}");

    // final convert = name.cobs;
    // print("Example convert=> $convert");
    // print("Example convert=> ${convert.runtimeType}");
    // print("Example convert=> ${convert.value}");
    /**
     * Example End
     */

    ///obs(null),obx
    ///RxList, List (useful fx)
    ///RxList => Rx<List>
    ///DataType RxList<t>,  <t>[]
    ///
    ///RxMap, Map (useful fx)
    ///RxMap<t1,t2>, <t1,t2>{}
    ///.value
    // final RxList<String> records = <String>[].obs;
    // final RxMap<String, String> records = <String, String>{}.obs;

    ///.obs == Rx
    ///int.obs == Rx<int>
    ///string.obs == Rx<String>
    ///
    hi() {}
    final data = hi.obs; //Rx<A>

    ///Rx<>.value
    final Rx<CounterState> counterState = CounterState(0, '').obs;
    int i = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Object Obs Screen"),
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
                "${counterState.value.i}",
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              );
            }),
          ),
          TextField(
            onSubmitted: (value) {
              // print(records.indexOf(value));
              // records.add(value);

              // records.addEntries({MapEntry('$i', value)});
              i++;
              counterState.value = CounterState(i, counterState.value.name);
            },
          ),
          ElevatedButton(
            onPressed: () {
              Get.until((route) => route.settings.name == '/number');
            },
            child: const Text("data"),
          )
        ],
      ),
    );
  }
}
