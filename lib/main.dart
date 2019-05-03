import 'package:flutter/material.dart';
import 'package:flutterigapi/ui/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => new Home(),
      },
    );
  }
}
