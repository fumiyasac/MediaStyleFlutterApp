import 'package:flutter/material.dart';
import 'package:media_style_app/ui/navigation/bottom_navigation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Media Style Demo',
      home: BottomNavigation(),
    );
  }
}
