import 'package:flutter/material.dart';
import 'telas/home.dart';

Future<void> main() async {
  runApp(const HomeApp());
}

class HomeApp extends StatelessWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: const Home(),
    );
  }
}
