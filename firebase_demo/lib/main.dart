import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

import 'package:firebase_demo/screens/authentication_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return const MaterialApp(
      home: AuthenticationScreen(),
    );
  }
}