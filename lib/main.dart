import 'package:flutter/material.dart';
import 'package:x_o/widgets/playing_field.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: PlayingField(),
      ),
    );
  }
}
