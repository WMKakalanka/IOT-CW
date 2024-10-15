import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iott/count.dart';
import 'package:iott/firebase_options.dart';
import 'package:iott/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
  routes: {
    '/home':(context) => Count(),

  },

    );
  }
}
