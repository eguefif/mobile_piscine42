import 'package:diaryapp/firebase_options.dart';
import 'package:diaryapp/models/diary_model.dart';
import 'package:diaryapp/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DiaryApp(),
    );
  }
}

class DiaryApp extends StatelessWidget {
  const DiaryApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DiaryModel(),
      child: const HomeView(),
    );
  }
}
