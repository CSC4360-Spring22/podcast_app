import 'package:flutter/material.dart';
import 'package:podcast_app/views/widgets/ProfileWidget.dart';
import '../classes/User.dart';
import '../utils/UserProfile.dart';
import 'EditProfilePage.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserProfile.myUser;

    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => EditProfilePage()),
              );
            },
            child: ProfileWidget(
              imagePath: user.imagePath,
              onClicked: () {},
            ),
          ),
          SizedBox(height: 20),
          buildName(user),
        ],
      ),
    );
  }

  Widget buildName(User user) {
    return Column(
      children: [
        Text(user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27)),
        SizedBox(height: 10),
        Text(user.email,
            style: TextStyle(color: Colors.grey[700], fontSize: 16)),
        SizedBox(height: 5),
        Text(user.number,
            style: TextStyle(color: Colors.grey[700], fontSize: 16)),
        SizedBox(height: 50),
        buildAbout(user),
      ],
    );
  }

  Widget buildAbout(User user) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 35, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("About",
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(height: 20),
          Text(user.about,
              style: TextStyle(
                  fontSize: 16, height: 1.4, color: Colors.grey[700])),
        ],
      ),
    );
  }
}
