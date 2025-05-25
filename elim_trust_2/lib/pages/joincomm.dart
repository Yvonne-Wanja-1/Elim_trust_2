import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: 70,
          width: double.infinity,
          decoration: const BoxDecoration(
            //color: Color.fromARGB(255, 0, 0, 0),
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
              
            ),
          ),
          child: Image.asset('images/joincomm.jpg',
          
            fit: BoxFit.cover,
            width: double.infinity,
           // height: 70,
          ),
         
        ),
      
      ),
    );
  }
}