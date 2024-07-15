import 'package:flutter/material.dart';
import 'package:ollama_chat_desktop/pages/intro_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.purple,
        primaryColor: Colors.green,
      ),
      home: const IntroScreen(),
    );
  }
}
