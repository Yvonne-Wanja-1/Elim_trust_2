import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class EditInfo extends StatelessWidget {
  const EditInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(), // Added bouncing scroll physics
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Edit Your Personal Info 😊',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Add your edit functionality here
                  },
                  child: const Text('Edit Email'),
                ),
              ],
            ),
          ),
         floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // Direct WhatsApp link to Elim Trust
            const String whatsappNumber =
                '254705558885'; // Elim Trust WhatsApp number
            final Uri url = Uri.parse('https://wa.me/$whatsappNumber');
            if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(
                        'Could not open WhatsApp for $whatsappNumber. Please ensure WhatsApp is installed.')),
              );
              print('Could not launch $url');
            }
          },
          backgroundColor: Colors.green, // WhatsApp-like color
          child: const Icon(FontAwesomeIcons.whatsapp, color: Colors.white),
          tooltip: 'Chat on WhatsApp',
        ),
      ),
    );
  }
}