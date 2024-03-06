import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'models/word_type_adapter.dart';
import 'view/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(WordTypeAdapter());
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
