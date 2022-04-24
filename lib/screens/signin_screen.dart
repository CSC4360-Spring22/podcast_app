import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:podcast_app/main.dart';
import 'package:podcast_app/resusable_widgets/resuable_widget.dart';
import 'package:podcast_app/screens/Logout(changeLater).dart';
import 'package:podcast_app/screens/homeScreen.dart';
import 'package:podcast_app/screens/signup_screen.dart';
import 'package:podcast_app/utils/color_utils.dart';
import 'package:podcast_app/views/home.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  // Sign In with google
  GoogleSignIn googleSignIn = GoogleSignIn();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Getting authentication and credentials from google
  Future signInFunction() async {
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      return;
    }

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    // Firebase can access the account and store the information
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    // Check the user already exsits
    DocumentSnapshot userExist =
        await firestore.collection('users').doc(userCredential.user!.uid).get();
    if (userExist.exists) {
      print("User Already Registered");
    } else {
      await firestore.collection('users').doc(userCredential.user!.uid).set({
        'email': userCredential.user!.email,
        'name': userCredential.user!.displayName,
        'image': userCredential.user!.photoURL,
        'uid': userCredential.user!.uid,
        'date': DateTime.now(),
      });
    }
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            hexStringToColor("baeaff"),
                            hexStringToColor("69b7d1"),
                            hexStringToColor("00a4db")
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20,
                            MediaQuery.of(context).size.height * 0.2, 10, 0),
                        child: Column(
                          children: <Widget>[
                            logoWidget("assets/images/podcast_image.png"),
                            SizedBox(
                              height: 20,
                            ),
                            resuableTextField(
                                "Enter Email address",
                                Icons.person_outline,
                                false,
                                _emailTextController),
                            SizedBox(
                              height: 10,
                            ),
                            resuableTextField(
                                "Enter Password",
                                Icons.lock_outline,
                                true,
                                _passwordTextController),
                            SizedBox(
                              height: 10,
                            ),
                            signInSignUpButton(context, true, () {
                              FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: _emailTextController.text,
                                      password: _passwordTextController.text)
                                  .then((value) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              }).onError((error, stackTrace) {
                                print("Error ${error.toString()}");
                              });
                            }),
                            signUpOption(),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () async {
                                  await signInFunction();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      'https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-webinar-optimizing-for-success-google-business-webinar-13.png',
                                      height: 36,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Sign In with Google",
                                      style: TextStyle(fontSize: 20),
                                    )
                                  ],
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.black),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(vertical: 12)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account? ",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        )
      ],
    );
  }
}
