import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:taskk/activitiesView.dart';
import 'package:taskk/firebase_options.dart';
import 'package:taskk/urrentlocation.dart';
import 'loginView.dart';
import 'mapView.dart';

void main() async {
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
