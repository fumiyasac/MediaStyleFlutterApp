import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Galleries"),
      ),
      body: Center(
        child: Text("This is galleries screen example."),
      ),
    );
  }
}