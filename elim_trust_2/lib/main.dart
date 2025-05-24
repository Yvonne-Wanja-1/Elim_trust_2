import 'package:elim_trust_2/pages/joincomm.dart';
import 'package:flutter/material.dart';

void main(){
  // This is the main entry point of the application.
  // It runs the app and sets up the necessary configurations.
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elim Trust Org',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyWidget(),
    );
  }
}