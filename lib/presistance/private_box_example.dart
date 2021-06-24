import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

// don't forget @injectable

class PrivateHiveHelper {

  Future <void> setData(String data) async {
    var box = await Hive.openBox('auth');
    box.put('data', data);
    await box.close();
  }

  Future<String?> getData() async {
    var box = await Hive.openBox('auth');
    var data = box.get('data');
    await box.close();
    return data;
  }

  Future<void> clear() async {
    var box = await Hive.openBox('auth');
    await box.clear();
    await box.close();
  }

  Future<void> deleteData() async {
    var box = await Hive.openBox('auth');
    box.delete('data');
    await box.close();
  }
}