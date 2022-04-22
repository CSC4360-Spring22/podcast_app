import 'package:flutter/material.dart';
import 'package:podcast_app/views/widgets/InputWidget.dart';
import 'package:podcast_app/views/widgets/ProfileWidget.dart';
import '../classes/User.dart';
import '../utils/UserProfile.dart';
import 'UserProfilePage.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User editUser = UserProfile.myUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(physics: BouncingScrollPhysics(), children: [
      ProfileWidget(
        imagePath: editUser.imagePath,
        isEdit: true,
        onClicked: () async {},
      ),
      SizedBox(height: 30),
      InputWidget(
          heading: "Full Name", text: editUser.name, onChange: (newName) {}),
      SizedBox(height: 10),
      InputWidget(
          heading: "Email", text: editUser.email, onChange: (newEmail) {}),
      SizedBox(height: 10),
      InputWidget(
          heading: "Phone Number",
          text: editUser.number,
          onChange: (newNumber) {}),
      SizedBox(height: 10),
      InputWidget(
          heading: "About",
          text: editUser.about,
          maxLines: 3,
          onChange: (newAbout) {}),
      SizedBox(height: 6),
      Center(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              onPrimary: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => UserProfilePage()),
              );
            },
            child: Text("Save")),
      )
    ]));
  }
}
