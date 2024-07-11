import 'package:flutter/material.dart';
import 'package:flutter01/Widgets/menu.dart';

import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interview Task-Jewellery ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: hidden_drawer(),
      debugShowCheckedModeBanner: false,
    );
  }
}
