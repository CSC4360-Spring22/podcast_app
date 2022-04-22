import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {

  final String imagePath;
  final bool isEdit;
  final VoidCallback onClicked;

  const ProfileWidget({Key? key, required this.imagePath, this.isEdit = false, required this.onClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          buildImage(),
          Positioned(
              child: buildEditButton(),
            bottom: 0,
            right: 5,
          ),
        ],
      )
    );
  }

  Widget buildImage(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,30.0,0,0),
      child: ClipOval(
        child: Image.asset(
          imagePath,
          height: 128,
          width: 128,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildEditButton(){
    return Container(
      padding: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Container(
        padding: EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
        child: Icon(
          isEdit ? Icons.add_a_photo : Icons.edit,
            size:20,
          color: Colors.white,
        ),
      ),
    );
  }

}
