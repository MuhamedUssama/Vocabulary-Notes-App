import 'package:flutter/material.dart';
import 'view/screens/home_screen.dart';

void main() {
  runApp(const VocabularyApp());
}

class VocabularyApp extends StatelessWidget {
  const VocabularyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Vocabulary Notes App',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
