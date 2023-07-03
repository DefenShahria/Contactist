import 'package:flutter/material.dart';

import 'home.dart';


void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Contact list",
      home: HomeScreen(),
    );
  }
}




