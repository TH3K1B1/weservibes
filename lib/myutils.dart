import 'package:firebase_auth/firebase_auth.dart';

void checkLoginStatus() {
  user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    // Navigate to login page if user is not logged in
    Navigator.pushReplacementNamed(context, '/login');
  } else {
    // User is logged in, proceed with the page
    print("User is logged in: ${user!.email}");
  }
}
