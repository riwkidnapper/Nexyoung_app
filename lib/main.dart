import 'package:flutter/material.dart';
import 'package:nutsyong_app/Account/welcome_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nux Young',
      home: Welcome(),
      debugShowCheckedModeBanner: false,
    );
  }
}
