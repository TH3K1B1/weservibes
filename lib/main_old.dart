import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'splash_screen.dart'; // Import the SplashScreen widget
import 'package:overlapped_carousel/overlapped_carousel.dart';
import 'dart:math';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(), // Set the initial route to the splash screen
    );
  }
}

@override
Widget build(BuildContext context) {
  var screenWidth = MediaQuery.of(context).size.width;
  var screenHeight = MediaQuery.of(context).size.height;
  return Scaffold(
    backgroundColor: Colors.blue,
    //Wrap with Center to place the carousel center of the screen
    body: Center(
      //Wrap the OverlappedCarousel widget with SizedBox to fix a height. No need to specify width.
      child: SizedBox(
        height: min(screenWidth / 3.3 * (16 / 9), screenHeight * .9),
        child: OverlappedCarousel(
          widgets: widgets, //List of widgets
          currentIndex: 2,
          onClicked: (index) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("You clicked at $index"),
              ),
            );
          },
          // To obscure or blur cards not in focus use the obscure parameter.
          obscure: 0.4,
          // To control skew angle
          skewAngle: 0.25,
        ),
      ),
    ),
  );
}

// GoogleSignIn instance with client ID
final GoogleSignIn googleSignIn = GoogleSignIn(
    clientId:
        '16218835348-g7lrklfeg810mgg4tbgtr7utpqv5om78.apps.googleusercontent.com');

GoogleSignIn getGoogleSignInInstance() => googleSignIn;
