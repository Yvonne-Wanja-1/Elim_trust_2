import 'package:elim_trust_2/pages/homepage.dart';
import 'package:elim_trust_2/pages/profilepage.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Elim Trust Org',
theme: ThemeData( // It's good practice to enable Material 3
  // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true, // meaning it will use the latest Material Design 3 features
),
initialRoute: '/home', // The initial route of the app
routes: {
  '/home': (context) => const HomePage(), // The initial route of the app
  '/profile': (context) => const ProfilePage(), // The home page route
},
     
    );
  }
}