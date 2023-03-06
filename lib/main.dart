import 'package:flutter/material.dart';
import 'Common/main_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Instagram Page',
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
