import 'package:flutter/material.dart';
import 'package:hive_example/hive/hive_init.dart';
import 'package:hive_example/hive/person/person.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
void main() async{
  await HiveSetUp.init();
  // await Hive.initFlutter();
  // Hive.registerAdapter(PersonAdapter());
  // var box = await Hive.openBox('hive');
  // box.put('name', 'Yazan');
  // box.put('numbers', ['1','2','3']);
  // Person person = Person(name: 'Yazan',age: 21);
  // box.put('customObject', person);
  // box.put('employees',[Person(name: 'Yazan'),Person(name:'Ayham')]);
  // await box.close();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hive Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var box = Hive.box('hive');
    Person person = box.get('customObject');
    box.put('numbers',['1','2']);
    print(box.get('numbers'));
    print('my name is ${person.name} and my age is ${person.age}');
    print(box.get('employees'));
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              box.get('name'),
            ),
            // Column(
            //   children:box.get('ListOfObject'),
            // ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
