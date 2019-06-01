import 'package:neverlate/very_first_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'SF Pro Display'),
      title: '#Hack19',
      home: veryFirstPage(),
    );
  }
}
