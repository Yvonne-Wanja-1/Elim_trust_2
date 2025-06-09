import 'dart:io'; // Required for File operations

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle; // Required for rootBundle
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_file_plus/open_file_plus.dart'; // Required for OpenFile
import 'package:path_provider/path_provider.dart'; // Required for getTemporaryDirectory
import 'package:url_launcher/url_launcher.dart'; // Required for launching URLs

class LatestnewsPage extends StatelessWidget {
  const LatestnewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          child: AppBar(
            backgroundColor: const Color.fromARGB(255, 4, 135, 242),
            centerTitle: true,
            title: const Text(
              'Latest News 📢',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.red,
                      blurRadius: 5.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                alignment: Alignment.center, // Center the icon within the container
                child: IconButton(
                  icon: const Icon(Icons.volunteer_activism, color: Colors.blue, size: 24),
                  padding: EdgeInsets.zero, // Remove default padding
                  constraints: const BoxConstraints(), // Remove default constraints
                  onPressed: () {
                    Navigator.pushNamed(context, '/donations');
                  },
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.red,
                        blurRadius: 5.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  alignment: Alignment.center, // Center the icon within the container
                  child: IconButton(
                    icon: const Icon(Icons.menu, color: Colors.blue),
                    padding: EdgeInsets.zero, // Remove default padding
                    constraints: const BoxConstraints(), // Remove default constraints
                    onPressed: () {
                      // Add functionality for the menu button here
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search Bar Section
            GestureDetector(
              onTap: () {
                // Add functionality for the search bar tap here
              },
              child: Container(
                margin: const EdgeInsets.all(30.0),
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.blue,
                      // Colors.blue, // Redundant
                      Color.fromARGB(255, 10, 21, 228),
                      Colors.blue,
                      // Colors.blue, // Redundant
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.search_rounded, color: Colors.white, size: 30),
                    const SizedBox(width: 8.0),
                    Text( // Removed 'const' as GoogleFonts style is not constant
                'Search for news articles...',
                style: GoogleFonts.dancingScript(
                  fontSize: 19,
                  color: Colors.white, // Note: Consider changing for better contrast
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
                  ],
                ),
              ),
            ),
            // News Content Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.blue,
                      blurRadius: 5.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column( // Changed Row to Column to accommodate multiple children
                  children: [
                    Row( // First child: The original Row for news content
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0), // Consider using GoogleFonts or default system font
                                child: Text(
                                  '23rd September 2020',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontStyle: FontStyle.italic,
                                    color: Color.fromARGB(255, 139, 193, 238),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 12.0, right: 8.0),
                                child: Text( // Consider using GoogleFonts or default system font
                                  '''The Mental Health Awareness Toolk...
''',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.blue,
                                blurRadius: 5.0,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'images/mentalhealth.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Second child: The Padding widget with buttons
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              // Reduced padding to make the button smaller
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text( // Consider default system font or GoogleFonts
                              'Read More 👇',
                              style: TextStyle(
                                fontSize: 16,
                                // fontFamily: 'Arial', // Consider removing or using a bundled/Google font
                                color: Colors.white,
                              ),
                            ),
                          ),
                          // Added SizedBox for spacing between buttons
                          const Spacer(), // Made Spacer const for minor optimization
                          ElevatedButton(
                            onPressed: () async {
                              // --- PDF Download/Open Logic ---
                              // IMPORTANT: Ensure 'your_actual_document_name.pdf' is the correct name of your PDF
                              // file (case-sensitive!) located in the 'assets/pdfs/' directory, and that 'assets/pdfs/'
                              // is declared in your pubspec.yaml. The path below should match your
                              // 'pubspec.yaml' declaration and actual file location.
                              // User specified: folder 'pdf', file 'mental.pdf'
                              const String assetPath = 'pdf/mental.pdf'; 
                              
                              try {
                                // 1. Get the directory for temporary files
                                final Directory tempDir = await getTemporaryDirectory();
                                final String tempPath = tempDir.path;
                                final String filePath = '$tempPath/${assetPath.split('/').last}'; // e.g., /data/user/0/.../your_document_name.pdf
                                final File file = File(filePath); // Use the dynamically created filePath

                                // 2. Load the asset
                                final ByteData byteData = await rootBundle.load(assetPath);
                                
                                // 3. Write the asset to the temporary file
                                await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
                                // 4. Open the file
                                final OpenResult result = await OpenFile.open(filePath); // Use the same filePath to open

                                if (result.type != ResultType.done) {
                                  print('Error opening file: ${result.message}');
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Could not open PDF: ${result.message}')),
                                    );
                                  }
                                }
                              } catch (e) {
                                print('Error processing PDF: $e');
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Error: Could not load PDF. $e')),
                                  );
                                }
                              }
                              // --- End PDF Logic ---
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text( // Consider default system font or GoogleFonts
                              'Download PDF📥',
                              style: TextStyle(
                                fontSize: 15,
                                // fontFamily: 'Arial', // Consider removing or using a bundled/Google font
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ], // End of Column children
                ), // End of Column
              ),
            ),
          ],
        ),
      ),



      bottomNavigationBar: SizedBox(
        height: 150, // You can adjust this value to your desired height
        child: Card(
          elevation: 5,
          margin: const EdgeInsets.all(8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // This is fine, SizedBox will control the outer height
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3.0), // Adjusted padding
                child: Text(
                  'Live. Love. Live.',
                  style: GoogleFonts.dancingScript(
                    textStyle: const TextStyle(
                      fontSize: 16, // Slightly increased font size
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Divider(
                color: Colors.blue,
                thickness: 1,
                indent: 16, // Padding on the left
                endIndent: 16,
              ),


              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 4),
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.red,
                            blurRadius: 5.0,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      
                      child: Icon(Icons.phone, color: Colors.white)),
                  ),
                  const SizedBox(width: 4), // Spacing between icon and text
                  const Text('+254 705 558 885', // Made const
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    )),
                  const Spacer(), // Spacing between phone and email
                  Padding(
                        padding: const EdgeInsets.only( right: 4),
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.red,
                                blurRadius: 5.0,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const Icon(Icons.email_rounded, color: Colors.white))),
                  const SizedBox(width: 4), // Spacing between icon and text
                  const Padding( // Made const
                      padding: EdgeInsets.only(right: 20),
                      child: Text('info@elim-trust.org',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                ],
                
              ),

// FloatingActionButton(

//               onPressed: () {
//                 // Add functionality for the WhatsApp button here
//               },
SizedBox(height: 10), // Spacing between rows
    Row(
      mainAxisAlignment: MainAxisAlignment.center, // Changed to spaceEvenly for better distribution
      children: [ 
        IconButton(
          icon: const Icon(FontAwesomeIcons.linkedin, color: Colors.blue),
          onPressed: () async {
            // Replace with your LinkedIn URL
            final Uri url = Uri.parse('https://www.linkedin.com/in/elim-trust-org/?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app'); 
            if (!await launchUrl(url)) {
              print('Could not launch $url');
            }
          },
        ),
        IconButton(
          icon: const Icon(FontAwesomeIcons.instagram, color: Colors.blue),
          onPressed: () async {
            // Replace with your Instagram URL
            final Uri url = Uri.parse('https://www.instagram.com/elimtrustorg?igsh=d2Q5djF1OGdmODJz&utm_source=qr');
            if (!await launchUrl(url)) {
              print('Could not launch $url');
            }
          },
        ),
        IconButton(
          icon: const Icon(FontAwesomeIcons.xTwitter, color: Colors.blue),
          onPressed: () async {
            final Uri url = Uri.parse('https://x.com/elim_trust_org?s=21');
            if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
              // Optionally show a snackbar or dialog to the user
              print('Could not launch $url');
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Could not open link: $url')),
                );
              }
            }
          },
        ),
        IconButton(
          icon: const Icon(FontAwesomeIcons.whatsapp, color: Colors.blue),
          onPressed: () async {
            // Example: Launch WhatsApp (replace with your specific link or number)
            // For a specific number: 'https://wa.me/1XXXXXXXXXX' (international format)
            // Or a general link: 'https://whatsapp.com/'
            final Uri url = Uri.parse('https://wa.me/254705558885'); // Example with your phone number
            if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
              print('Could not launch $url');
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Could not open WhatsApp: $url')),
                );
              }
            }
          },
        ),
        IconButton(
          icon: const Icon(FontAwesomeIcons.facebook, color: Colors.blue),
          onPressed: () async {
            // Replace with your Facebook page URL
            final Uri url = Uri.parse('https://www.facebook.com/ElimTrustOrg/'); 
            if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
              print('Could not launch $url');
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Could not open Facebook: $url')),
                );
              }
            }
          },
        ),
        IconButton(
          icon: const Icon(FontAwesomeIcons.locationDot, color: Colors.red),
          onPressed: () async {
            // Example: Open Google Maps with a specific location
            // You can use a query string for a place name or coordinates
            final Uri url = Uri.parse('https://maps.google.com/?q=Elim+Trust+Nairobi'); // Example query
            if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
              print('Could not launch $url');
              // Add SnackBar for error if needed
            }
          },
        ),
      ],
  ),

            
            ],
          ),
        ),
      ),
      





    );
  }
}
