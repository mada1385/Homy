// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class User {
  String useremail;
  User({
    this.name,
    this.jobtitle,
    this.email,
    this.password,
  });

  final String name;
  final String email;
  String id;
  final String jobtitle;
  final String password;
  // final File photo ;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference users = Firestore.instance.collection('user');

  Future<FirebaseUser> handleSignIn() async {
   // hold the instance of the authenticated user
   FirebaseUser user;
   // flag to check whether we're signed in already
   bool isSignedIn = await _googleSignIn.isSignedIn();
   if (isSignedIn) {
      // if so, return the current user
      user = await _auth.currentUser();
   }
   else {
      final GoogleSignInAccount googleUser = 
         await _googleSignIn.signIn().catchError((onError) {
            print("error $onError");
          });
      final GoogleSignInAuthentication googleAuth = 
         await googleUser.authentication;
      // get the credentials to (access / id token)
      // to sign in via Firebase Authentication 
      final AuthCredential credential =
         GoogleAuthProvider.getCredential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken
         );
      user = (await _auth.signInWithCredential(credential)).user;
   }
 
   return user;
}

  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'full_name': name, // John Doe
          'email': email, // Stokes and Sons
          'jobtitle': jobtitle, // 42
          'email': email,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  FirebaseUser currentUser;

  void loadCurrentUser() {
    FirebaseAuth.instance.currentUser().then((FirebaseUser user) {
      // call setState to rebuild the view
      this.currentUser = user;
    });
  }

  String getemail() {
    loadCurrentUser();
    if (currentUser != null) {
      return currentUser.email;
    } else {
      return "no current user";
    }
  }

  Future login() async {
    String user;
    try {
      final signup = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        user = email;
      });

      if (signup != null) {
        useremail = email;
        // print(user);
      }
    } catch (e) {
      print(e);
      user = "failed";
      print(user.toString());
      return e;
    }
    return user;
  }

  Future register() async {
    String user = "sucsses";

    try {
      final signup = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (signup != null) {
        // useremail = email ;
        addUser();
      }
    } catch (e) {
      print(e);
      return e;
    }
    return user;
  }
}
