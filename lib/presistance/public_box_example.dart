import 'package:hive_flutter/hive_flutter.dart';

// don't forget @injectable

class HiveHelper {
  var box = Hive.box('example');

  void setData(String data) {
    box.put('data', data);
  }

  String? getData() {
    return box.get('data');
  }

// to clear all entity in the box

  Future<void> clear() async {
    await box.clear();
  }

// to delete specific key in hive

  void deleteData() {
    box.delete('data');
  }
}
