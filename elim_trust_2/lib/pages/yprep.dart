import 'package:flutter/material.dart';
import 'package:elim_trust_2/widgets/appbar.dart'; // Make sure this file defines 'CustomAppBar'

class YprepPage extends StatelessWidget {
  const YprepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        title: 'Y-PREP Program',
        leadingIcon: Icons.arrow_back,
        actions: [
          Container(
            margin: const EdgeInsets.all(10),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.red,
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(Icons.volunteer_activism, color: Colors.blue),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {
                Navigator.pushNamed(context, '/donations');
              },
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text("Y-PREP Page Content"),
      ),
    );
  }
}
