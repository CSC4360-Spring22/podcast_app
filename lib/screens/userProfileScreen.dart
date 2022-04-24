import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:podcast_app/views/widgets/info_card.dart';

const url = "https://www.google.com";
const email = "johndoe@gmail.com";
const phone = "+1 123 346 7890";
const location = "Atlanta, GA";

class userProfileScreen extends StatelessWidget {
  const userProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/userProfile.png'),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "John Doe",
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: "Pacifico",
              ),
            ),
            Text(
              "Podcast Listner",
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.blueGrey[200],
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
                fontFamily: "Source Sans Pro",
              ),
            ),
            SizedBox(
              height: 20,
              width: 200,
              child: Divider(color: Colors.white),
            ),
            InfoCard(text: phone, icon: Icons.phone),
            InfoCard(text: url, icon: Icons.web),
            InfoCard(text: email, icon: Icons.email),
            InfoCard(text: location, icon: Icons.location_city)
          ],
        ),
      ),
    );
  }
}
