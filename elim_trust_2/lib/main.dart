import 'package:elim_trust_2/pages/capacity.dart';
import 'package:elim_trust_2/pages/communitypage.dart';
import 'package:elim_trust_2/pages/donations.dart';
import 'package:elim_trust_2/pages/homepage.dart';
import 'package:elim_trust_2/pages/mats.dart';
import 'package:elim_trust_2/pages/profilepage.dart';
import 'package:elim_trust_2/pages/projects.dart';
import 'package:elim_trust_2/pages/vunja.dart';

import 'package:elim_trust_2/pages/yprep.dart';
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
  '/home': (context) => const HomePage(),
  '/projects': (context) => const ProjectsPage(),
   '/donations': (context) => const DonationsPage(),
   '/community': (context) => const CommunityPage(),
  '/profile': (context) => const ProfilePage(),

  '/yprep': (context) => const YprepPage(),
    '/matsdialogue': (context) => const MatsDialoguePage(),
    '/vunja': (context) => const VunjaPage(),
   '/capacity': (context) => const CapacityPage(),



},


     
    );
  }
}