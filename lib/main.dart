import 'package:flutter/material.dart';
import 'package:student_flutter_app/studentScreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Studentscreen(),
      theme: ThemeData.dark(),
        );
  }
}