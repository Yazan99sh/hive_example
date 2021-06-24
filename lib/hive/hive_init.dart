import 'package:hive_example/hive/person/person.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class HiveSetUp {
  static Future<void> init()async{
    await Hive.initFlutter();
    await adapterRegistration();
    await publicBoxes();
  }
   static Future<void> adapterRegistration() async {
   Hive.registerAdapter(PersonAdapter());
  }
 static Future <void> publicBoxes() async {
    await Hive.openBox('hive');
  }
}